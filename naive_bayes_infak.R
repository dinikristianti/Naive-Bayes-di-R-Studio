#CARA INPUT DATA
dataku=read.delim("clipboard")
View(dataku)

#cara install packages
install.packages("e1071")
install.packages("caret")

#cara memanggil pakcages
library(e1071)
library(caret)

#membagi data menjadi 2 bagian
sampel=sample(1:nrow(dataku),0.75*nrow(dataku),replace=TRUE)
training=data.frame(dataku)[sampel,]
testing=data.frame(dataku)[-sampel,]

#membuat naive bayes
modelNB=naiveBayes(KETERANGAN.BAYAR~.,data=training)

#melakukan prediksi
prediksi=predict(modelNB,testing)
hasil=confusionMatrix(table(prediksi,testing$KETERANGAN.BAYAR))
hasil
