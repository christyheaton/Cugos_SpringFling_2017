# If you have not already, install the raster and rgeos packages
# install.packages(c("raster", "rgeos"))

# Bring these packages into your working environment
library(raster)
library(rgeos)

# Set your working directory to the master folder containing the data 
# Download this here: https://github.com/christyheaton/Cugos_SpringFling_2017
setwd("/home/dmf/tutorials/springfling/Cugos_SpringFling_2017-master/")

# Read in the transit routes and assign it to the variable "transit"
transit <- shapefile("Data/routes.shp")
class(transit) #Determine the class of the "transit" object

head(transit) #Take a look at the data table within the transit object.
              #AKA the "attributes table"

# Determine the projection of the transit data and get the proj4string
projection(transit)
transit@proj4string

# Now, make a plot! You can use the plot function OR the spplot function 
# if you would like to be fancy
plot(transit)
spplot(transit)

# Determine the extent of the data and bounding box
extent(transit)
transit@bbox

# Read in the farmers markets and assign it to the variable "markets"
markets <- shapefile("Data/farmers_markets.shp")
head(markets) #Take a look at the data table
dim(markets) #Determine the dimensions of the data table
names(markets)

#before we can attempt to intersect, we need to verify that the coordinate systems are the same
projection(transit) == projection(markets)

# Now, plot the transit and markets together in one plot
plot(transit, main="Markets & Transit")
plot(markets, col="orange", add=T) 

#Buffer the market locations with a 10000 ft ("walking distance") buffer 
circles <- buffer(markets, 10000, dissolve=F)
# circles <- gBuffer(markets, width=10000, byid=T)

# Plot the buffered circles
plot(circles)
class(circles)

# Determine where the circle buffers and transit maps intersect 
int_out <- over(circles, transit)

# return output as dataframe
out_df <- circles@data[which(is.na(int_out$ROUTE)), ]

# or as SpatialPointsDataFrame
out_sp <- markets[which(is.na(int_out$ROUTE)), ]

## save output?
write.csv(out_df, file="markets_out.csv", row.names=F)

shapefile(out_sp, filename="markets_out.shp")

