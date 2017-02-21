install.packages("MASS")
library(MASS)

setwd("C:/Users/iGuest/GlobalTerrorismAnalysis")
getwd()

data <- read.csv("globalterrorismdb_0616dist_US_ONLY.csv")
head(data)

fit <- lm(success ~ nkill + nkillus + nwoundus + nperps + nperpcap + nkillter +
            nwound + nwoundte + attacktype1 + targtype1 +
            targsubtype1 + weaptype1 + weapsubtype1,data=data)

# attacktype1_txt + targtype1_txt +
# targsubtype1_txt + weaptype1_txt + weapsubtype1_txt
#     -changed to no _txt

step <- stepAIC(fit, direction="both")
step$anova # display results