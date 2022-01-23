### Assessing convergence & acceptance rate

AutoCorrCalc <- function(chain, nlags) {
  autocorrs <- matrix(0, nrow = nlags, ncol = ncol(chain)) #create storage for all parameters
  
  for (k in 1:ncol(autocorrs)) {
    par1 <- matrix(0, nrow = length(chain[, k]), ncol = nlags) #create storage for 1 parameter
    
    for (i in 1:ncol(par1)) {
      par1[(i:(nrow(chain))), i] <- chain[(1:(nrow(chain) - (i - 1))), k] #create lagging vectors
    }
    
    autocorrs[1, k] <- cor(par1[, 1], par1[, 1]) #fill the first slot with correlation with itself
    
    for (j in 1:(ncol(par1) - 1)) {
      autocorrs[(j + 1), k] <- cor(par1[, 1], par1[, (1 + j)], use = "complete.obs") #correlate 1 with all up to nlags
    }
  }
  autocorrs <- as.data.frame(autocorrs)
  colnames(autocorrs) <- c("Intercept", "Screentime", "Age", "Residual Variance")
  return(autocorrs)
}

AutoCorrPlotter <- function(autocorrs, nlags) {
  ACdat <- data.frame(Lag = (1:nlags), autocorrs) #add column with nr. Lags
  
  plotlist <- list()
  for (i in 1:(ncol(ACdat) - 1)) {
    #create data frame for each parameter with the same names
    ACdat1 <- as.data.frame(ACdat[, c(1, 1 + i)])
    colnames(ACdat1) <- c("Lag", "Par")
    #loop over all parameters to make plot
    plotlist[[i]] <-
      ggplot(data = ACdat1, mapping = aes(x = Lag, y = Par)) +
      geom_hline(aes(yintercept = 0)) +
      geom_segment(mapping = aes(xend = Lag, yend = 0)) +
      ylim(-0.2,1) +
      labs(y = "Autocorrelation") +
      ggtitle(names(ACdat[(i + 1)])) +
      theme_classic() +
      theme(plot.title = element_text(hjust = 0.5))
  }
  grid.arrange(grobs = plotlist, ncol = 2) #plot all graphs in a grid
}

