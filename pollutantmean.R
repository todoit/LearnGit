#test test2
pollutantmean <- function(directory, pollutant, id = 1:332) {
        sum <- 0
        row_num <- 0   
        #loop the files
        for(i in id) {
                #complete the file name
                idx = sprintf("%03d", i)
                file_name <- paste(idx, ".csv", sep = "")
                
                #read file 
                data <- read.csv(paste(directory, file_name, sep="/"))
                # get the column for use
                data.col.use <- data[[pollutant]]
                
                #calculate sum, remove NA
                sum <- sum + sum(data.col.use, na.rm = TRUE)
                # rownum, remove NA
                row_num <- row_num + sum(!is.na(data.col.use))
        }
        mean <- sum/row_num # return the mean
        mean
}

