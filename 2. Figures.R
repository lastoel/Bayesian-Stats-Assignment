#Trace plots

#load required workspace from Analysis depending on which model you want to generate the plots for: 
load("Workspaces/Model1.Rdata")
#load("Workspaces/Model2.Rdata")

#Beta 0:
par(oma=c(3,0,0,0)) 
par(mar=c(5,4,4,2) + 0.1)
plot(unburn1[,1], type = "s", xlab = "Nr. of iterations", ylab = "", main = "Intercept", col = "red")
lines(unburn2[,1], type = "s", col = "blue")
mtext(paste0("Autocorelation = ", format(mean(c(mean(autocorrs1[,1]), mean(autocorrs2[,1]))), digits = 2)), side=1, line=0, adj=0.1, cex=1, col="black", outer=TRUE)

#Beta 1: 
par(oma=c(3,0,0,0)) 
par(mar=c(5,4,4,2) + 0.1)
plot(unburn1[,2], type = "s", xlab = "Nr. of iterations", ylab = "", main = bquote(bold(Delta~"Screentime")), col = "red")
lines(unburn2[,2], type = "s", col = "blue")
mtext(paste0("Autocorelation = ", format(mean(c(mean(autocorrs1[,2]), mean(autocorrs2[,2]))), digits = 2)), side=1, line=0, adj=0.1, cex=1, col="black", outer=TRUE)
mtext(paste0("Acceptance rate = ", format(mean(c(AR1, AR2)), digits = 2), "%"), side=1, line=1, adj=0.1, cex=1, col="black", outer=TRUE)

#Beta 2: 
par(oma=c(3,0,0,0)) 
par(mar=c(5,4,4,2) + 0.1)
plot(unburn1[,3], type = "s", xlab = "Nr. of iterations", ylab = "", main = "Age", col = "red")
lines(unburn2[,3], type = "s", col = "blue")
mtext(paste0("Autocorelation = ", format(mean(c(mean(autocorrs1[,3]), mean(autocorrs2[,3]))), digits = 2)), side=1, line=0, adj=0.1, cex=1, col="black", outer=TRUE)

#Sigma2
par(oma=c(3,0,0,0)) 
par(mar=c(5,4,4,2) + 0.1)
plot(unburn1[,4], type = "s", xlab = "Nr. of iterations", ylab = "", main = "Residual Variance", col = "red")
lines(unburn2[,4], type = "s", col = "blue")
mtext(paste0("Autocorelation = ", format(mean(c(mean(autocorrs1[,4]), mean(autocorrs2[,4]))), digits = 2)), side=1, line=0, adj=0.1, cex=1, col="black", outer=TRUE)

