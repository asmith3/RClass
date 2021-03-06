# This function returns correlations of complete cases across multiple files, subject to a threshold for complete cases

corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0

        ## Return a numeric vector of correlations
        
        # Use previously defined funtion to list number of complete cases for id
        
            comp <- complete(directory)
        
        # Creat a boolean vector indicating which files meet the threshold. 
          
            meet <- comp$nobs>threshold
                
        # If no files meet the criteria, then return a NULL vector  
          
            if (sum(meet)=="0") {return(NULL)}
          
        # Filter through ID's whos complete cases are above the threshold  
          
            pass <- comp$id[meet]
            
        # Apply previously defined function to read in data for each filtered ID
        
            data <- lapply(pass,getmonitor,directory)
            
        # There is probably a better way to finish this
        
            # NULLify ID numbers and date to allow cor function to run without error
                  
                data <- lapply(data, function(x) { x["ID"] <- NULL; x})
                data <- lapply(data, function(x) { x["Date"] <- NULL; x})
        
            # Apply cor function over the list of dataframes
              
                corrs <- sapply(data,cor,use="pairwise.complete.obs")
                
            # Implicitly return the vector of correlations produced by sapply
        
                corrs[2,]
}
