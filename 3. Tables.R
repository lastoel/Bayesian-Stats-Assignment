#output tables

#load required workspace from Analysis depending on which model you want to generate the plots for: 
load("Workspaces/Model1.Rdata")
#load("Workspaces/Model2.Rdata")

results <- matrix(0, 4, 7)
rownames(results) <- c("Intercept", "Screen.diff", "Age.gmc", "Residual Variance")
colnames(results) <- c("Mean", "SD", "MC error", "Gelman-Rubin", "2.5%", "Median", "97.5%")

results[,1] <- apply(rbind(apply(unburn1, 2, mean), apply(unburn2, 2, mean)), 2, mean)
results[,2] <- apply(rbind(apply(unburn1, 2, sd), apply(unburn2, 2, sd)), 2, mean)
results[,3] <- MCerrcalc(results[,2], 12000)
results[,4] <- t(GRstat)
results[,5] <- apply(rbind(apply(unburn1, 2, quantile, 0.025), apply(unburn2, 2, quantile, 0.025)), 2, mean)
results[,5] <- apply(rbind(apply(unburn1, 2, median), apply(unburn2, 2, median)), 2, mean)
results[,7] <- apply(rbind(apply(unburn1, 2, quantile, 0.975), apply(unburn2, 2, quantile, 0.975)), 2, mean)
results
kable(results, digits = 3)