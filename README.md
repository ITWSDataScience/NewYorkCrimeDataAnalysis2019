# NewYork Crime Data Analysis 
The dataset being analysed contains the data of every arrest made in the NYC starting from the calender year 2006 and ending in calender year 2018. The data present in this dataset is managed and maintained by the Office of Managemnet Analysis and Planning on a quarterly basis. The data gives an idea regarding the nature of NYPD law enforcement activities along with the crimes involved with those arrests in New York City. The data analysis is based on different crimes and their categorization on a quantitative basis.

##Getting Started
The dataset can be downloaded from https://catalog.data.gov/dataset/nypd-arrests-data-historic. The dataset being huge, has been subsetted into a smaller version with 150,000 rows based on random sampling. ArrestData 2 is the smaller dataset, whereas ArrestData3 is the transformed version of data2 where text columns have been converted to numerical factors.(Both files used in exploratory analysis only).

The metadata source for the dataset is: https://catalog.data.gov/harvest/object/79e474b1-74e0-4631-8a42-0020c1d4ca61. 

##Code
There are two script files namely Clustering.R and ExploratoryAnalysis.R that contain the R scripts for clustering analysis and the exploratory data analysis. Inorder to use the ggmaps in exploratory analysis script, a google maps api key needs to be entered that can be created on https://www.cloud.google.com. 

##Contributors
* Aradhya Kasat (kasata@rpi.edu)
* Anish Sethi (sethia@rpi.edu)
* Aayush Nitin Maheshwarkar (mahesa@rpi.edu)