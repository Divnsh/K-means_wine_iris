## K means

iris_v2 = read.csv('iris_v2.csv',header=T)
set.seed(10)
library(ggplot2)
ggplot(iris_v2, aes(petalLength, petalWidth)) + geom_point()
irisCluster = kmeans(iris_v2[,3:4], 5, nstart=20)
irisCluster

irisCluster2 = kmeans(iris_v2, 5, nstart=20)

iris_clustered = data.frame(iris_v2[,3:4], irisCluster$cluster)
ggplot(iris_clustered, aes(petalLength, petalWidth, color = as.factor(irisCluster$cluster))) + geom_point()

library(readxl)
wine = read_excel('wines_velse.xlsx')
set.seed(10)
winecluster = kmeans(wine, 5, nstart=20)


     
     a=c()
     for(i in 2:15){
     winecluster = kmeans(wine, i, nstart=20)
     a = append(a,winecluster$tot.withinss)
     }
     a
     
     plot(c(2:15),a)
     
     
 w = read.csv('weather_data.csv')    
 str(w)
 library(naivebayes)
 library(e1071)
 w.train = w[floor(.7*nrow(w)),]
 w.test = w[-floor(.7*nrow(w)),]
 nbmodel = naiveBayes(Play~., w.train)
 pred = predict(nbmodel, w.test[,-5], type="raw")
 pred
 