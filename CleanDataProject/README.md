CleanDataProject/extractAveragesBySubAct.R contains of  function analyseSmartphoneData. The function converts data collected by a smartphone about the activities of person to create averages per person and activity.  
The function takes as parameter a dictionary, which contains of:
  - a file with the name “activity_labels.txt” containing the names of the activities of a person
  - a file with the name “features.txt” containing the column header of the measurements
  - a directory named “test” 
  - a directory named “train”
 
The sub directories contain have to contain of the following files. Here are “xxxx” equal to the directory name:
  - “subject_xxxx.txt”, the assignments of the person to the measurements
  - “X_xxxx.txt”, the measurements
  - “y_xxxx.txt” the assignment of activities to the measurements
as default the actual working directory is taken. The result of the calculation is stored within the directory under the name “averageSubjcetActivity.txt” .