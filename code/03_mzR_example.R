
# Examples with the mzR Bioconductor package
library(mzR)
# Also use the ggplot2 and dplyr package
library(ggplot2)
library(dplyr)

# When you set a seed this makes random number generation reproducible
# We'll use this when we randomly sample MS scans below
set.seed(12345)

# Example data from OpenMS Tutorial example data
# https://www.openms.de/tutorials/ --> Download Example Data --> Labelfree/datasets/lfq_spikein_dilution_1.mzML
# File: lfq_spikein_dilution_1.mzML
# Assumed to be in the same directory as this script
input_file_name <- "lfq_spikein_dilution_1.mzML"
ms_data <- openMSfile(input_file_name, backend = "pwiz")

# Investigate information about the instrument used and the run
# These functions return R lists, and you can access the list components with $
instr_info <- instrumentInfo(ms_data)
run_info <- runInfo(ms_data)

# Get the header info for the scan -- summary information about each scan
scan_info <- header(ms_data)
# We can use the View function to easily explore the data
View(scan_info)


# Let's look at some individual scans
# We can access that data via the peaks function
# First it's useful to separate out the MS1 and MS2 scans
#  also -- use dplyr pipeline!
ms1_scans <- scan_info %>% filter(msLevel == 1)
ms2_scans <- scan_info %>% filter(msLevel == 2)


# Let's check out a random MS1 scan
# we can index the scans by the seqNum index of ms1_scans
# the sample function just randomly selects one particular ms1 scan index
spec_sel <- spectra(ms_data, sample(ms1_scans$seqNum, 1))
# peaks_sel is a matrix with two columns: mz & intensity
# turn it into a data frame, makes it easier for analysis and plotting
spec_sel <- as.data.frame(spec_sel)
# make the column names meaningful!
names(spec_sel) <- c("mz", "intensity")
# Time to plot
ggplot(spec_sel, aes(mz, intensity)) + 
  geom_segment(aes(x = mz, xend = mz, y = 0, yend = intensity))

ggplot(spec_sel, aes(mz, intensity)) + 
  geom_segment(aes(x = mz, xend = mz, y = 0, yend = intensity)) +
  xlim(560, 575)


# You can repeat the the same thing for any MS1 or MS2 scan
# Now you have access to the main experimental raw data.
# Go forth and create amazing new algorithms!






