# Catch summary function 
# used for output 1 on assignment 2

catch_summary = function (fish) {
  
  #create data frame to store outputs
  dom_df = data.frame(matrix(ncol = 2, nrow = ncol(catch)))
  dom_df = setNames(dom_df, c("most_frequent_fish", "location"))
  
  # determine most frequent fish caught in each location
  for (i in 1:ncol(fish)) {
    #dom_df[[i, 1]] = which.max(summary(catch[[i]]))  # dont need this bc it reports the number of occurances of the most frequent fish and we just want the name
    dom_df[[i, 1]] = names(which.max(summary(fish[[i]])))
    dom_df[[i, 2]] = colnames(fish)[i]
  }
  return(dom_df)
}

catch_summary(catch)
