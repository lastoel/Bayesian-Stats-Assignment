#P-value calculator

pvalcalc <- function(obsdat, simdat, teststatfun) {
  #create storage:
  testsim <- matrix(0, ncol(simdat), 1)
  comparisons <- matrix(0, nrow(testsim), 1)
  
  #compute test statistic for observed and simulated data
  testobs <- teststatfun(obsdat)
  for (i in 1:ncol(simdat)) {
    testsim[i, ] <- teststatfun(simdat[, i])
  }
  
  #Step 5: compute posterior predictive p-value: 
  for (i in 1:nrow(testsim)) {
    if (testsim[i, ] > testobs) {
      comparisons[i, ] <- 1
    }
  }
  Bpvalue <- mean(comparisons)
  
  return(Bpvalue)
}