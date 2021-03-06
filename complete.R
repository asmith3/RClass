#function to return a dataframe listing number of complete observations for multiple files in a directory

complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases
        
        # create new ID's with leading zeros, matching the file names
        
          	newid <- formatC(id,width=3,flag="0")
        
        # read in data via a list of filenames
        
	  	data <- lapply(paste(directory,"/",newid,".csv", sep = ""),read.csv)
	        
	# apply the complete.cases funtion over the list of dataframes  
	        
	  	good <- lapply(data,complete.cases)
	        
	# add up boolean 1's created in previous step to output number of complete cases in each dataframe
	      
	  	nobs <- sapply(good,sum)
	        
        # implicitly return a dataframe with list of ID's and corresponding number of complete observations
        
		data.frame(id,nobs)
}	
