# Skew calculator

skewcalc <- function(dataset){
  sorted <- sort(dataset)
  R <- length(sorted[sorted > mean(dataset)]) #counts nr. of bins right of the mean
  L <- length(sorted[sorted < mean(dataset)]) #counts nr. of bins left of the mean
  
  LRratio <- R/L #ratio of nr of bins right/left to mean
  absdiff <- abs(1-LRratio) #absolute difference compared to 1 (no difference between L and R)
  return(absdiff)
}