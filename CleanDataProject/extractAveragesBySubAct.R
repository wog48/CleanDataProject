analyseSmartphoneData  <- function(dir = getwd()){
	# read and combine files
	readCombine        <- function(dir, prefix){
		testFilename     <- paste(dir, "test",  paste(prefix, "test.txt", sep="_"), sep = "/")
		trainFilename    <- paste(dir, "train", paste(prefix, "train.txt", sep="_"), sep = "/")
		data             <- rbind(read.table(trainFilename),read.table(testFilename), deparse.level = 0)
	}
	appendTextColumn <- function(actvityList, lables){
		activityNames <- c()
		for(i in 1:length(actvityList[,1])){
			activityNames <- c(activityNames, as.character(lables[actvityList[i,1],2]))
		}
		return(activityNames)
	}
	# read rawData and combine both data sets
	rawData            <- readCombine(dir, "X") 
	# read header
	colHeader          <- read.table(paste(dir, "features.txt", sep = "/"))
	# assign header
	colnames(rawData)  <- colHeader[,2]
	# filter the mean and standard deviation columns. All columns that contain "mean" in their name
	# are seen as mean columns and all with that contain "std" as columns that store standard deviation. 
	relevantColumns    <- subset(colHeader, grepl("std|mean",colHeader[,2]))	
	# create subject and Activity columns
	## read y_xxxx files for Activity as well as the activity lables
	activity           <- readCombine(dir, "y")
	activitiesLable    <- read.table(paste(dir, "activity_labels.txt", sep = "/"))
	activity           <- cbind(activity, appendTextColumn(activity, activitiesLable))
	## read subject_xxxx files for Subject
	subject            <- readCombine(dir, "subject")
	## merge columns
	reducedData        <- cbind(subject, activity[2], rawData[ , relevantColumns[,1]] )
	## give new columns names
	colnames(reducedData)[1] <-"SubjectID"
	colnames(reducedData)[2] <-"Acivity" 	
	## new tidy data set
	avrData            <- aggregate(reducedData[4:length(reducedData[1,])], by=reducedData[c("SubjectID","Acivity")], FUN=mean)
	write.csv(avrData, "averageSubjcetActivity.csv")
}	



