library(ggplot2)
library(leaflet)
library(devtools)
library(dplyr)
library(tidyverse)
library(spdep)
library(cluster)
library(ggcluster)

ArrestData<-read.csv(file.choose(), header = TRUE)

ggplot(ArrestData, aes(x=ArrestData$PERP_RACE, y=ArrestData$AGE_GROUP)) +
  geom_hex(bins = 40) +
  scale_fill_viridis(option="E") +
  theme_bw()

ggplot(BoroughData, aes(x=BoroughData$ï..ARREST_YEAR, y=BoroughData$X.Age, fill=BoroughData$ARREST_AGE)) + 
  geom_area(alpha=0.6 , size=1, colour="black") + 
  labs(title="Age Data",y="Percentage",x="Year")

ggplot(BoroughData, aes(x=BoroughData$ï..ARREST_YEAR, y=BoroughData$Value, color=BoroughData$ARREST_AGE, size = 1)) +
  geom_line() +
  scale_color_viridis(discrete = TRUE) +
  theme(legend.position="none") +
  labs(title="Ethnicity Data",y="No. of Arrests",x="Year")+
  theme_ipsum()

ArrestLocation <- ArrestData[,c("Longitude","Latitude")]
ArrestLocation <- ArrestData[sample(nrow(ArrestData),500),]
Locat <- cbind(ArrestLocation$Longitude,ArrestLocation$Latitude)

ArrestKNN <- knearneigh(Locat, k=3, longlat = TRUE)
ArrestKNN2 <- knn2nb(ArrestKNN)
plot(ArrestKNN2,Locat)
title(main = "KNN Clustering for k = 3")

ArrestKNN <- knearneigh(Locat, k=5, longlat = TRUE)
ArrestKNN2 <- knn2nb(ArrestKNN)
plot(ArrestKNN2,Locat)
title(main = "KNN Clustering for k = 5")

ArrestKNN <- knearneigh(Locat, k=7, longlat = TRUE)
ArrestKNN2 <- knn2nb(ArrestKNN)
plot(ArrestKNN2,Locat)
title(main = "KNN Clustering for k = 7")
