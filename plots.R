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

# plot attacks by attack type in the 48 contiguous united states
us <- map_data("state")
q <- ggplot() +
geom_polygon(data=us, aes(x=long, y=lat, group=group), color="darkgray", fill="white") +
geom_point(data=gtd, aes(x=longitude, y=latitude, color=attacktype1_txt), size=2, alpha=0.5) +
coord_map() + xlim(-125, -65) + ylim(25, 50) + xlab("Longitude") + ylab("Latitude") +
theme_bw() + theme(legend.position="bottom", legend.title=element_blank()) +
ggtitle("Terrorist Attacks in the United States, by Attack Type (1970-2015)")
q
