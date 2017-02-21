install.packages("MASS")
library(MASS)

setwd("C:/Users/iGuest/GlobalTerrorismAnalysis")
getwd()

data <- read.csv("globalterrorismdb_0616dist_US_ONLY.csv")
head(data)

nrow(data)
str(data)

fit <- lm(success ~ nkill + nkillus + nwoundus + nperps + nperpcap + nkillter +
            nwound + nwoundte + attacktype1 + targtype1 +
            targsubtype1 + weaptype1 + weapsubtype1, data=data)

# attacktype1_txt + targtype1_txt +
# targsubtype1_txt + weaptype1_txt + weapsubtype1_txt
#     -changed to no _txt

step <- stepAIC(fit, direction="both")
step$anova # display results

plot(step)

plot(data$nkillus, data$nkill, xlim=c(0,50), ylim=c(0,20), size=data$nkill)