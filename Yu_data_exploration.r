#Author: Yu Pei
#
#

library('XML')
library('rjson')
library('RCurl')
library('httr')
#install.packages('RSocrata')
library(RSocrata)
setwd('~/Documents/git_repo/GreenGovHackathon/')

# read in C02 emission data
dat = read.socrata('https://greengov.data.ca.gov/Buildings/State-Agency-CO2e-2010-2014-/umpc-nnuk', 
                    '71fXkh2JryFgqZa5cayiyNmTd')

#Unique department name = 41
unique(dat$Organization.Name)