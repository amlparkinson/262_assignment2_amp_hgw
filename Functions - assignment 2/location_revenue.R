# Location Revenue function (used to calculate output 2 of assignment 2)

location_revenue = function(fish){
  
  #create data frame to store outputs
  location_revenue_df = data.frame(matrix(ncol = ncol(catch), nrow = nrow(fish_prices)))
  
  # count number of fish
  for(i in 1:ncol(catch)) {
    location_revenue_df[i]=summary(catch[[i]])
  }
  
  #add column names
  colnames(location_revenue_df) = colnames(catch) 
  
  # add row for fish species and move this row to the front
  names=names(summary(catch[[1]]))
  location_revenue_df$fish = names
  location_revenue_df <- location_revenue_df %>% 
    dplyr::select(fish, everything())
  
  # add prices
  fish_price_df = full_join(location_revenue_df, fish_prices, by = "fish")
  
  # new df to store location revenue
  price_df = data.frame(matrix(ncol = ncol(catch), nrow = nrow(fish_prices)))
  
  # math
  for (i in 2:ncol(location_revenue_df)) {
    price_df[,i] = location_revenue_df[,i] * fish_price_df$price
  }
  
  return(price_df)
}



