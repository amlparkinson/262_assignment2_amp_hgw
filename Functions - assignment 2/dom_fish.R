# output 1: most common fish caught at location
# Dom fish function 

dom_fish = function(fish){
  max_species = which.max(summary(fish))
  dom = names(summary(fish) [max_species])
  return(dom)
}

dom_fish(catch$catch_Mohawk)
