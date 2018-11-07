library(caret)
library(e1071)
Train=read.csv(file.choose())
Test=read.csv(file.choose())
Train=Train[,-1]
Test=Test[,-1]
head(Test)
knn1=train(Occupancy~.,Train,method="knn")
p1=predict(knn1,Test[,1:4])
levels(p1)
p2=as.numeric(Test$Occupancy)
levels(p2)
confusionMatrix(
  factor(p1, levels = min(p1):max(p1)),
  factor(Test$Occupancy, levels = min(p1):max(p1))
)