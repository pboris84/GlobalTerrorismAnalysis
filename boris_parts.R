# load packages
# install.packages("ggplot2")
# install.packages("dplyr")
# install.packages("maps")
# install.packages("mapproj")
# install.packages("fBasics")
# install.packages("caret")
# install.packages("klaR")
# install.packages("pyplot")
install.packages("RColorBrewer")
library(caret)
library(klaR)
library(ggplot2)
library(dplyr)
library(maps)
library(mapproj)
library(fBasics)
library(pyplot)
library(RColorBrewer)

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

mod <- lm(nkill ~ success + imonth + ingroup + longitude + latitude + attacktype1 + targtype1 + targsubtype1 + weaptype1 + weapsubtype1, data = gtd_small)
summary(mod)
formula(step(mod))

mod2 <- lm(nkill ~ success + ingroup + attacktype1 + targtype1 + targsubtype1 + 
            weapsubtype1, data = gtd_small)
step(mod2)
formula(mod2)
#write.csv(gtd_small, file = "gtd_smallnonuller.csv")

summary(mod2)


ggplot(data = gtd_small, aes(x = nkill, fill = weaptype1_txt)) + geom_bar() + xlim(0, 17) + ylim(0, 200)

ggplot(gtd_small, aes(nwound, nkill)) + geom_point() + geom_smooth(model = lm) + xlim(0, 50) + ylim(0, 20)+ facet_grid(. ~ attacktype1_txt)

r <-ggplot(gtd_small, aes(nkill)) + geom_bar() + coord_polar(theta = "x", direction=1 )



# Polar coordinate chart
cbPalette <- c("#FF8A8A", "#FF6464", "#FF2D2D", "#EE0000", "#F0E442", "#CB0000", "#B00000", "#9C0000","#890000","#740000","#5A0000","#090000")
mymonths <- c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")
gtd_small_months <- gtd_small 
gtd_small_months$MonthAbb <- mymonths[ gtd_small_months$imonth ]
ggplot(gtd_small_months, 
       aes(factor(MonthAbb, levels = c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")), 
           nkill, fill = factor(MonthAbb, levels = c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")
                                  ))
       ) + geom_bar(stat = "identity", width = 1) + 
  ylim(0, 60) + coord_polar() + labs(title ="Killed by Month Since 1970", x = " ", y = " ") + 
  scale_fill_discrete(name = "Months")




