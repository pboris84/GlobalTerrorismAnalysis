# load ggplot
library(ggplot2)

# plot casualties per year
gg.months <- ggplot(gtd, aes(iyear, nkill))
gg.months + geom_bar(stat="identity") + xlab("Year") + ylab("Number of Casualties") + 
  ggtitle("Number of Terrorist Attack Casualties per Year (1970-2015)") +
  scale_x_continuous(breaks=1970:2015) + theme_gray()

# plot attack success by attack type
gg.success.att <- ggplot(gtd, aes(attacktype1_txt, nkill))
gg.success.att + geom_bar(stat="identity") + ylab("Number of Successful Attacks") +
  ggtitle("Number of Casualties per Attack Type (1970-2015") + xlab("Attack Type")

# plot attack success by weapon type
gg.success.weap <- ggplot(gtd, aes(weaptype1_txt, nkill))
gg.success.weap + geom_bar(stat="identity") + ylab("Number of Successful Attacks") +
  ggtitle("Number of Casualties per Weapon Type 1970-2015") + xlab("Weapon Type") +
  scale_x_discrete(limits=weap.positions)