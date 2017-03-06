# load packages
# install.packages("ggplot2")
# install.packages("dplyr")
# install.packages("maps")
# install.packages("mapproj")
# install.packages("fBasics")
# install.packages("caret")
# install.packages("klaR")
library(caret)
library(klaR)
library(ggplot2)
library(dplyr)
library(maps)
library(mapproj)
library(fBasics)

# pathway
# getwd()
# setwd("/Users/iguest/GlobalTerrorismAnalysis")

# load data
gtd <- read.csv("globalterrorismdb_0616dist_US_ONLY.csv")
gtd_small <- select(gtd, success, attacktype1_txt, targtype1_txt, 
                    targsubtype1_txt, weaptype1_txt, weapsubtype1_txt, 
                    iyear, imonth, iday, longitude, latitude, ingroup, 
                    nperps, nkill, nwound, ishostkid, nhostkid, attacktype1, targtype1, 
                    targsubtype1, weaptype1, weapsubtype1)

gtd_small[ gtd_small == -99 ] <- NA
gtd_small[ gtd_small == -9 ] <- NA
#gtd_small <- subset(gtd_small, !is.na(gtd_small$nkill))

mod <- lm(nkill ~ success + imonth + ingroup + attacktype1 + targtype1 + targsubtype1 + weaptype1 + weapsubtype1, data = gtd_small)
summary(mod)
formula(step(mod))

mod2 <- lm(nkill ~ success + ingroup + attacktype1 + targtype1 + targsubtype1 + 
             weapsubtype1, data = gtd_small)
step(mod2)
formula(mod2)
#write.csv(gtd_small, file = "gtd_smallnonuller.csv")

summary(mod2)