# DIC function

DIC <- function(jointposterior) {
  dbardat <- matrix(0, nrow(dat), 1)
  for (i in 1:nrow(dbardat)) {
    dbardat[i] <- -2 * sum(dnorm(OSDI.diff6, mean = (jointposterior[i, 1] + jointposterior[i, 2] * screen.diff6 + jointposterior[i, 3] * age.gmc),
                                 sd = sqrt(jointposterior[i, 4]), log = T))
  }
  dbar <- mean(dbardat)
  
  dhat <- -2 * sum(dnorm(OSDI.diff6, mean = mean((jointposterior[i, 1]) + mean(jointposterior[i, 2]) * screen.diff6 + mean(jointposterior[i, 3]) * age.gmc),
                         sd = sqrt(mean(jointposterior[i, 4])), log = T))
  
  DIC <- dhat + 2 * (dbar - dhat)
  
  return(DIC)
}