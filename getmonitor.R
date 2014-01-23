getmonitor <- function(id, directory, summarize = FALSE) {

        ## 'id' is a vector of length 1 indicating the monitor ID
        ## number. The user can specify 'id' as either an integer, a
        ## character, or a numeric.
        
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'summarize' is a logical indicating whether a summary of
        ## the data should be printed to the console; the default is
        ## FALSE
        
                
        # Create new ID with leading zeros
        
                newid <- formatC(id,width=3,flag="0")
          
        # Load data for requested ID
        
                data <- read.csv(paste(directory,"/",newid,".csv", sep = ""))
        
        # Print summary if requested 
        
                if (summarize==TRUE) {print(summary(data))}
        
        # implicit return of data
        
                data
        
}
