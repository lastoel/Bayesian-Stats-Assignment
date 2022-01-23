#The Hecking Ultimate Gibbs Sampler (THUGS)

THUGS <- function(Y, X1, X2, inits, n.iters) {
  
  storage <- matrix(0, n.iters, 4) #create storage for sampled values of each parameter
  colnames(storage) <- c("beta0", "beta1", "beta2", "sigma2")
  storage[1,] <- c(beta0, beta1, beta2, sig2) #make the first value of each parameter the starting value
  n <- length(Y) #nr of observations in dataset
  accept.rate <- matrix(0, nrow = n.iters, ncol = 1)
  
  for(i in 2:n.iters) { #skip the first entry b/c starting value
    
    ###beta0 (Gibbs)
    tau2_01  <- n / sig2 + 1 / tau2_00 #posterior precision
    mu_01 <- (sum(Y - beta1 * X1 - beta2 * X2) / sig2 +
                mu_00 / tau2_00) /
      tau2_01
    beta0 <- rnorm(1, mu_01, 1 / tau2_01) #draw sample from normal posterior with initial parameters -> update
    
    ###beta1 (Metropolis-Hastings)
    # 1. sample candidate beta1 value from the normal proposal distribution
    beta1_star <- rnorm(1, mean = 0.4, sd = 0.1)
    
    # 2. sample a reference value
    u <- runif(1, 0, 1)
    
    # 3. Compute acceptance ratio
    target_prop <- cond_post(Y, X1, X2, beta0, beta1_star, beta2, sig2, mu_10, sd_10, df) /
      cond_post(Y, X1, X2, beta0, beta1, beta2, sig2, mu_10, sd_10, df)
    
    proposal_prop <- dnorm(beta1, mean = 0.2, sd = 0.5) /
      dnorm(beta1_star, mean= 0.2, sd = 0.5)
    
    R <- target_prop * proposal_prop
    
    # 4. Accept the candidate value or retain current value
    if(R >= u) {
      beta1 <- beta1_star
      accept.rate[i] <- 1
    }
    
    ###beta2 (Gibbs)
    tau2_21  <- sum(X2 ^ 2) / sig2 + 1 / tau2_20 
    mu_21 <- (sum(X2 * (Y - beta0 - beta1 * X1)) / sig2 +
                mu_20 / tau2_20) /
      tau2_21
    beta2 <- rnorm(1, mu_21, 1 / tau2_21)
    
    ###sig2 (Gibbs)
    a1  <- n / 2 + a0
    b1  <- sum((Y - (beta0 + beta1 * X1 + beta2 * X2)) ^ 2) / 2 + b0
    sig2 <- 1 / rgamma(1, a1, b1) 
    
    # store results
    storage[i, ] <- c(beta0, beta1, beta2, sig2)
  }
  output <- list("storage" = storage, "acceptance rate" = accept.rate)
  return(output)
}