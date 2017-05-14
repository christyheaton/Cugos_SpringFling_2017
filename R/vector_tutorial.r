
# install.packages(c("raster", "rgeos"))

library(raster)
library(rgeos)

setwd("/home/dmf/tutorials/springfling/Cugos_SpringFling_2017-master/")

transit <- shapefile("Data/routes.shp")
class(transit)

head(transit)

projection(transit)
transit@proj4string

plot(transit)
spplot(transit)

extent(transit)
transit@bbox

markets <- shapefile("Data/farmers_markets.shp")
head(markets)
dim(markets)
names(markets)

projection(transit) == projection(markets)

plot(transit, main="Markets & Transit")
plot(markets, col="orange", add=T)

circles <- buffer(markets, 10000, dissolve=F)
# circles <- gBuffer(markets, width=10000, byid=T)

plot(circles)
class(circles)


int_out <- over(circles, transit)

# return output as dataframe:
out_df <- circles@data[which(is.na(int_out$ROUTE)), ]

# or as SpatialPointsDataFrame
out_sp <- markets[which(is.na(int_out$ROUTE)), ]

## save output?
write.csv(out_df, file="markets_out.csv", row.names=F)

shapefile(out_sp, filename="markets_out.shp")

