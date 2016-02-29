#Code Book

###Activities

Activityid       activityname
1 		 WALKING
2 		 WALKING_UPSTAIRS
3 		 WALKING_DOWNSTAIRS
4 		 SITTING
5 		 STANDING
6 		 LAYING

###Each subject has an id tracked by subjectid

### Subjectid, Activity ID and Activity Name: Refer to Activities table above
subjectid   
activityid                   
activityname 

## Measurement Variables
### All values are floating point numbers for each subject and activity.

###t prefix for Time Domain
###f predix for Frequency Domain

###Time Domain body Acceleration Mean XYZ and Standard Deviation(Std) XYZ              
-tBodyAccMeanX               
-tBodyAccMeanY                
-tBodyAccMeanZ                
-tBodyAccStdX                
-tBodyAccStdY                
-tBodyAccStdZ

###Time Domain body Acceleration Mean XYZ and Standard Deviation(Std) XYZ              

-tGravityAccMeanX 
-tGravityAccMeanY
-tGravityAccMeanZ
-tGravityAccStdX              
-tGravityAccStdY              
-tGravityAccStdZ              

###Time Domain Body Acceleration Jerk Mean and Std XYZ

-tBodyAccJerkMeanX           
-tBodyAccJerkMeanY            
-tBodyAccJerkMeanZ            
-tBodyAccJerkStdX             
-tBodyAccJerkStdY            
-tBodyAccJerkStdZ 


###Frequency Domain Body Gyro Mean  XYZ
            

###Time Domain Body Gyro Mean and Std XYZ
-tBodyGyroMeanX               
-tBodyGyroMeanY               
-tBodyGyroMeanZ              
-tBodyGyroStdX                
-tBodyGyroStdY                
-tBodyGyroStdZ                

###Time Domain Body Gyro Jerk Mean and Std XYZ
-tBodyGyroJerkMeanX          
-tBodyGyroJerkMeanY           
-tBodyGyroJerkMeanZ           
-tBodyGyroJerkStdX            
-tBodyGyroJerkStdY           
-tBodyGyroJerkStdZ            


###Time Domain Body Acceleration Magnitude Mean & Std 
-tBodyAccMagMean              
-tBodyAccMagStd 

###Time Domain Gravity  Acceleration Magnitude Mean & Std 
-tGravityAccMagMean          
-tGravityAccMagStd            

###Time Domain  Acceleration Jerk Magnitude Mean & Std 
-tBodyAccJerkMagMean          
-tBodyAccJerkMagStd 

###Time Domain  Body gyro  Magnitude Mean & Std 
-tBodyGyroMagMean            
-tBodyGyroMagStd              

###Time Domain  Body gyro Jerk Magnitude Mean & Std 
-tBodyGyroJerkMagMean         
-tBodyGyroJerkMagStd          

###Frequency  Domain Acceleration  Mean & Std  XYZ
-fBodyAccMeanX               
-fBodyAccMeanY                
-fBodyAccMeanZ                
-fBodyAccStdX                 
-fBodyAccStdY                
-fBodyAccStdZ                 

###Frequency  Domain Body Acceleration  Mean Frequency  XYZ
-fBodyAccMeanFreqX            
-fBodyAccMeanFreqY            
-fBodyAccMeanFreqZ   
        
###Frequency  Domain Body Acceleration Jerk  Mean, Std and Frequency  XYZ
-fBodyAccJerkMeanX            
-fBodyAccJerkMeanY            
-fBodyAccJerkMeanZ            
-fBodyAccJerkStdX            
-fBodyAccJerkStdY             
-fBodyAccJerkStdZ             
-fBodyAccJerkMeanFreqX        
-fBodyAccJerkMeanFreqY       
-fBodyAccJerkMeanFreqZ        

###Frequency  Domain Body Gyroscope  Mean, Std and Mean Frequency  XYZ
-fBodyGyroMeanX               
-fBodyGyroMeanY               
-fBodyGyroMeanZ              
-fBodyGyroStdX                
-fBodyGyroStdY                
-fBodyGyroStdZ                
-fBodyGyroMeanFreqX          
-fBodyGyroMeanFreqY           
-fBodyGyroMeanFreqZ           

###Frequency Domain Body Acceleration Magnitude  Mean, Std and Magnitude Mean Frequency
-fBodyAccMagMean              
-fBodyAccMagStd              
-fBodyAccMagMeanFreq          

###Frequency Domain  Body Acceleration Jerk Magnitude Mean, Std and Magnitude Mean frequency 
-fBodyBodyAccJerkMagMean      
-fBodyBodyAccJerkMagStd       
-fBodyBodyAccJerkMagMeanFreq 

###Frequency Domain  Body Gyroscope   Magnitude Mean, Std,  Magnitude Mean frequency  and Jerk Magnitude Mean.
-fBodyBodyGyroMagMean         
-fBodyBodyGyroMagStd          
-fBodyBodyGyroMagMeanFreq     
-fBodyBodyGyroJerkMagMean    
