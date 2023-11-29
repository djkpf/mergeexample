### Load tidyverse
library(tidyverse)

### Read counties file
counties_vacc <- read.csv("/Users/dan.kopf/Documents/src/examples/counties.csv")

### Read density file
counties_density <- read.csv("/Users/dan.kopf/Documents/src/examples/density.csv")

### Merge the two files
counties_vacc_density <- left_join(counties_vacc, counties_density, by = c("FIPS.code" = "GCT_STUB.target.geo.id2"))

### View merge
View(counties_vacc_density %>% select(County, Density.per.square.mile.of.land.area))

### Plot density against vaccination rate
ggplot(counties_vacc_density %>% filter(Population > 100000, Density.per.square.mile.of.land.area < 10000), 
       aes(x=Density.per.square.mile.of.land.area, y=People.with.at.least.1.dose.as...of.total.population)) + 
  geom_point()+
  geom_smooth()
