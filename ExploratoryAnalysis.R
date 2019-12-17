library(tidyverse)
library(maps)
library(albersusa)#installed via github
library(ggmap)
library(RColorBrewer)
setwd("/Users/aradhyakasat/Documents/DataScience/")
data = read.csv("NewYorkCrimeDataAnalysis2019/Data/ArrestData2.csv")
data2 = read.csv("NewYorkCrimeDataAnalysis2019/Data/ArrestData3.csv")

table(data$PD_DESC)
table(data$OFNS_DESC)
barplot(table(data2$AGE_GROUP),col = rainbow(20),ylim=c(0,50000),xlab="Age Group",ylab="No. of Crimes",main="Age Group vs No. of crimes")


barplot(table(data2$ARREST_BORO),col = rainbow(20),ylim=c(0,50000),xlab="Boro",ylab="No. of Crimes",main="Boro vs No. of crimes")


barplot(table(data2$PERP_SEX),col = rainbow(20),ylim=c(0,80000),xlab="Sex",ylab="No. of Crimes",main="Sex vs No. of crimes")


barplot(table(data2$PERP_RACE),col = rainbow(20),ylim=c(0,50000),xlab="Race",ylab="No. of Crimes",main="Race vs No. of crimes",cex.names = 0.5)

table(data2$AGE_GROUP,data2$OFNS_DESC)
table(data2$PERP_SEX,data2$OFNS_DESC)
table(data2$PERP_RACE,data2$OFNS_DESC)
table(data2$JURISDICTION_CODE)
table(data2$ARREST_PRECINCT)
mosaicplot(table(data$PERP_SEX,data$AGE_GROUP),xlab ='Gender',ylab='Age Group',col=c(2,3,4))

#Please set your google maps api key to use
ggmap::register_google(key = "")

p <- ggmap(get_googlemap(center = c(lon = -74.0060, lat = 40.7128),
                         zoom = 10, scale = 2,
                         maptype ='terrain',
                         color = 'color'))

p + geom_point(aes(x =Longitude , y = Latitude, color=data$ARREST_BORO),data=data, alpha=0.25,size = 0.5) + 
  theme(legend.position="bottom")
p + geom_point(aes(x =Longitude , y = Latitude, color=data$PERP_SEX),data=data, alpha=0.25,size = 0.5) + 
  theme(legend.position="bottom")
p + geom_point(aes(x =Longitude , y = Latitude, color=data$OFNS_DESC),data=data, alpha=0.25,size = 0.5) + 
  theme(legend.position="bottom")
p + geom_point(aes(x =Longitude , y = Latitude, color=data$PERP_RACE),data=data, alpha=0.25,size = 0.5) + 
  theme(legend.position="bottom")
p + geom_point(aes(x =Longitude , y = Latitude, color=data$AGE_GROUP),data=data, alpha=0.25,size = 0.5) + 
  theme(legend.position="bottom")

data2_plot = data2
table(data2_plot$ARREST_BORO)
for(i in 1:nrow(data2_plot)){
  if(data2_plot$ARREST_BORO[i]==1){
    data2_plot$ARREST_BORO[i] = 'B';
  }
  else if(data2_plot$ARREST_BORO[i]==2){
    data2_plot$ARREST_BORO[i] = 'K';
  }
  else if(data2_plot$ARREST_BORO[i]==3){
    data2_plot$ARREST_BORO[i] = 'M';
  }
  else if(data2_plot$ARREST_BORO[i]==4){
    data2_plot$ARREST_BORO[i]='Q';
  }
  else if(data2_plot$ARREST_BORO[i]==5){
    data2_plot$ARREST_BORO[i] = 'S'
  }
}


plot_data_2014 = subset(data2_plot,data2_plot$ARREST_YEAR==2014)
plot_data_2015 = subset(data2_plot,data2_plot$ARREST_YEAR==2015)
plot_data_2016 = subset(data2_plot,data2_plot$ARREST_YEAR==2016)
plot_data_2017 = subset(data2_plot,data2_plot$ARREST_YEAR==2017)


p + geom_point(aes(x =Longitude , y = Latitude, color=plot_data_2014$ARREST_BORO),data=plot_data_2014, alpha=0.25,size = 0.5) + 
  theme(legend.position="bottom")
p + geom_point(aes(x =Longitude , y = Latitude, color=plot_data_2015$ARREST_BORO),data=plot_data_2015, alpha=0.25,size = 0.5) + 
  theme(legend.position="bottom")
p + geom_point(aes(x =Longitude , y = Latitude, color=plot_data_2016$ARREST_BORO),data=plot_data_2016, alpha=0.25,size = 0.5) + 
  theme(legend.position="bottom")
p + geom_point(aes(x =Longitude , y = Latitude, color=plot_data_2017$ARREST_BORO),data=plot_data_2017, alpha=0.25,size = 0.5) + 
  theme(legend.position="bottom")


plot_data_sex = subset(data,data$PERP_SEX=='F')
p + geom_point(aes(x =Longitude , y = Latitude, color=plot_data_sex$ARREST_BORO),data=plot_data_sex, alpha=0.25,size = 0.5) + 
  theme(legend.position="bottom")

plot_data_sex_male = subset(data,data$PERP_SEX=='M')
p + geom_point(aes(x =Longitude , y = Latitude, color=plot_data_sex_male$ARREST_BORO),data=plot_data_sex_male, alpha=0.25,size = 0.5) + 
  theme(legend.position="bottom")

res <- revgeocode(lonlat_sample, output="more")
# can then access zip and neighborhood where populated
res$postal_code
res$neighborhood

#Type of crimes bar plot
ggplot(data=data,aes(x=data$OFNS_DESC),fill=interaction(data$PERP_SEX))+geom_bar()+scale_fill_brewer(palette = "Set1") +coord_flip()
ggplot(data=data,aes(x=data$AGE_GROUP),fill=interaction(data$PERP_SEX))+geom_bar()+scale_fill_brewer(palette = "Set1") +coord_flip()
ggplot(data=data,aes(x=data$PERP_SEX))+geom_bar()+scale_fill_brewer(palette = "Set1") +coord_flip()
ggplot(data=data,aes(x=data$PERP_RACE))+geom_bar()+scale_fill_brewer(palette = "Set1") +coord_flip()

year_ts=table(data2$ARREST_YEAR)
year_ts = data.frame(year_ts)
ggplot()+geom_line(data=year_ts,aes(x=year_ts$Var1,y=year_ts$Freq,group=1))
month_ts=data.frame(table(data2$ARREST_MONTH))
ggplot()+geom_line(data=month_ts,aes(x=month_ts$Var1,y=month_ts$Freq,group=1))
day_ts=data.frame(table(data2$ARREST_DAY))
ggplot()+geom_line(data=day_ts,aes(x=day_ts$Var1,y=day_ts$Freq,group=1))

date_ts=data.frame(table(data2$ARREST_DATE))
ggplot()+geom_line(data=date_ts,aes(x=date_ts$Var1,y=date_ts$Freq,group=1))
wordcloud::wordcloud(data2$OFNS_DESC,colors =c("black", "cornflowerblue", "darkred"))
wordcloud::wordcloud(data2$PD_DESC,min.freq = 200,scale=c(4,.5),colors =c("black", "cornflowerblue", "darkred"))

ggplot()+geom_jitter(data=data2,aes(data2$PERP_SEX,data2$OFNS_DESC))

#

##Modelling
train = subset(data2, select = -c(ARREST_KEY,ARREST_DATE,PD_CD,KY_CD,LAW_CODE,X_COORD_CD,Y_COORD_CD,Latitude,Longitude))
kcluster = kmeans(train[4],3)
train = subset(train,select = -c(LAW_CAT_CD))
###################
library(geojsonio)
spdf <- geojson_read("/Users/aradhyakasat/Documents/DataScience/NewYorkCrimeDataAnalysis2019/Data/Borough Boundaries.geojson",  what = "sp")

ggplot() +
    geom_polygon(data = spdf, aes(fill=data2$ARREST_BORO ,x = shape_area, y = shape_leng), fill="white", color="grey") +
  theme_void() +
  coord_map()


spdf = data.frame(spdf)
for(i in 1:nrow(spdf)){
  if(spdf$boro_name[i]=='Bronx'){
    spdf$boro_name[i] = 'B';
  }
  else if(spdf$boro_name[i]=='Brooklyn'){
    spdf$boro_name[i] = 'K';
  }
  else if(spdf$boro_name[i]=='Staten Island'){
    spdf$boro_name[i] = 'S';
  }
  else if(spdf$boro_name[i]=='Queens'){
    spdf$boro_name[i]='Q';
  }
  else if(spdf$boro_name[i]=='Manhattan'){
    spdf$boro_name[i] = 'M'
  }
}
ggplot() + geom_map(data = data, aes(map_id = data$ARREST_BORO, fill = data$ARREST_BORO), 
        map = spdf) + expand_limits(x = shape_area, y = shape_leng)

ggplot() +
  geom_polygon(data = spdf, aes( x = lat, y = long), fill="white", color="grey") +
  theme_void() +
  coord_map()


ggplot() +
  geom_polygon(data = spdf, aes(fill = data$ARREST_BORO, x = spdf$boro_name)) +
  theme_void() +
  coord_map()
