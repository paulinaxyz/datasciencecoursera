## Read the datasets
test<-read.table("X_test.txt")
train<-read.table("X_train.txt")

test.activity<-read.table("y_test.txt")
train.activity<-read.table("y_train.txt")

test.subject<-read.table("subject_test.txt")
train.subject<-read.table("subject_train.txt")

## adding a column for activity 
test$activity<-test.activity[,1]
train$activity<-train.activity[,1]

## adding a column for subject 
test$subject<-test.subject[,1]
train$subject<-train.subject[,1]

## combining both sets
merged<-rbind(test,train)

## adding variable names
features<-read.table("features.txt")
names(merged)<-features[,2]
names<-names(merged)
names[562]="activity"
names[563]="subject"
names(merged)<-names

## selecting mean and sd measurements 
mean<-grep("mean()", names(merged), fixed=T)
std<-grep("std()", names(merged), fixed=T)
data<-merged[,c(mean,std,562,563)]


## labelling activities
data$activity<-factor(x=data$activity,levels=c(1,2,3,4,5,6),
                      labels=c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS",
                               "SITTING", "STANDING","LAYING"))

data$subject<-factor(x=data$subject)

## creating the tidy dataset
result<-as.data.frame(matrix(nrow=180,ncol=68))
colnames(result)<-c("Subject","Activity",names(data[,1:66]))
x<-split(data,list(data$subject,data$activity))
y<-split(data,list(data$activity,data$subject))
for (i in 1:180){
    result[i,1]<-y[[i]][1,68]
    result[i,2]<-y[[i]][1,67]
    result[i,3:68]<-sapply(y[[i]][,1:66],mean) 
}

result$Activity<-factor(x=result$Activity,levels=c(1,2,3,4,5,6),
                        labels=c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS",
                                 "SITTING", "STANDING","LAYING"))

result$Subject<-factor(x=result$Subject)

## saving the dataset as a table
write.table(result,"result.txt", row.names = F)