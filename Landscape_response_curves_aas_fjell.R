### Species_response_curves

rm(list=ls())

library(goeveg)
library(vegan)

load("~/PhD/Subproject_2/Subpro_2_R/landscape_response_plot_glob_env_aas_fjell.RData")

## Draw species response curve for one species on environmental variable
## with points of occurrences

palette(c("#a6cee3", "#1f78b4", "#b2df8a", "#33a02c", "#fb9a99", "#e31a1c", 
  "#fdbf6f", "#ff7f00", "#cab2d6", "#6a3d9a", "#ffff99", "#b15928"))


specresponse(av[ ,c(9,18,14,19)], akse1, model = "gam", method = "ord", points = TRUE)
specresponse(av[ ,c(1:84)], akse1, model = "gam", method = "ord", points = FALSE)

specresponse(av[ ,c(1:10)], akse1, model = "gam", method = "ord", points = FALSE)
specresponse(av[ ,c(11:20)], akse1, model = "gam", method = "ord", points = FALSE)
specresponse(av[ ,c(21:30)], akse1, model = "gam", method = "ord", points = FALSE)
specresponse(av[ ,c(31:40)], akse1, model = "gam", method = "ord", points = FALSE)
specresponse(av[ ,c(41:50)], akse1, model = "gam", method = "ord", points = FALSE)
specresponse(av[ ,c(51:60)], akse1, model = "gam", method = "ord", points = FALSE)
specresponse(av[ ,c(61:66)], akse1, model = "gam", method = "ord", points = FALSE)
specresponse(av[ ,c(71:80)], akse1, model = "gam", method = "ord", points = FALSE)
specresponse(av[ ,c(81:84)], akse1, model = "gam", method = "ord", col="red", points = FALSE)
?specresponse

specresponse(av[ ,c(6, 8, 17, 18,24,28,34,37,40,42,46,50,52,56,65,66)], akse1, model = "gam", method = "ord", points = FALSE)
specresponse(av[ ,c(2,3,31,44,49,54,68,78,82)], akse1, model = "gam", method = "ord", points = FALSE)
specresponse(av[ ,c(2,3,31,44,49,54,68,78,82)], akse1, model = "gam", method = "ord", bw= TRUE, points = FALSE)
specresponse(av[ ,c(2,3,31,44,49,54,68,78,82)], akse1, model = "gam", bw= TRUE, points = FALSE, xlab = "Outer-inner coast")

#Bruk denne for outer_inner coast
library(goeveg)
library(vegan)

palette(c("#a6cee3", "#1f78b4", "#b2df8a", "#33a02c", "#fb9a99", "#e31a1c", 
          "#fdbf6f", "#ff7f00", "#cab2d6", "#6a3d9a", "#ffff99", "#b15928"))
rgb( ramp(seq(0, 1, length = 5)), max = 255)


specresponse2 <- function(species, var, main, xlab, model = "auto", method = "env", axis = 1, points = FALSE, bw = FALSE) {
  
  if(!is.data.frame(species)) {
    
    if(missing(main)) {
      main <- deparse(substitute(species))
    }
    
    specnames <- deparse(substitute(species))
    species <- data.frame(species)
    ismat <- F
    
  } else {
    if(missing(main)) {
      main <- " "
    }
    specnames <- names(species)
    ismat <- T
  }
  
  species <- decostand(species, method = "pa")
  
  if(length(species) >= 1) {
    
    ls <- length(species)
    
    if(method == "env") {
      
      if(missing(xlab)) {
        xlab <- deparse(substitute(var))
      }
    } else if(method == "ord") {
      
      # Extract site scores from ordination
      var <- as.numeric(scores(var, display="sites", choices=axis))
      
      # X-axis labeling
      if(missing(xlab)) {
        xlab <- paste("Axis", axis, "sample scores")
      }
    } else {
      stop("Method unknown.")
    }
    
    plot(var, species[,1], main = main, type="n", frame = FALSE, 
         xlab = xlab, ylab="Probability of occurrence", xlim=c(-0.8,1), ylim = c(0,1))
    
    for(i in 1:ls) {
      
      if(length(species[species[,i]>0,i]) <= 5) {
        # tried warning instead of print
        warning(paste("Only", length(species[species[,i]>0,i]), "occurrences of", names(species)[i], "."))
      }
      
      if(model == "unimodal") {
        
        specresponse <- suppressWarnings(glm(species[,i] ~ poly(var, 2),
                                             family="binomial"))
        
      } else if (model == "linear") {
        
        specresponse <- suppressWarnings(glm(species[,i] ~ var,
                                             family="binomial"))
        
      } else if (model == "bimodal") {
        
        specresponse <- suppressWarnings(glm(species[,i] ~ poly(var, 4),
                                             family="binomial"))
        
      }
      else if (model == "auto") {
        
        glm.1 <- suppressWarnings(glm(species[,i] ~ poly(var, 1), family="binomial"))
        glm.2 <- suppressWarnings(glm(species[,i] ~ poly(var, 2), family="binomial"))
        glm.3 <- suppressWarnings(glm(species[,i] ~ poly(var, 3), family="binomial"))
        glm.AIC <- c(extractAIC (glm.1)[2], extractAIC (glm.2)[2],
                     extractAIC (glm.3)[2])
        
        switch(c(1,2,3)[glm.AIC==min(glm.AIC)],
               {specresponse <- glm.1; deg<-1},
               {specresponse <- glm.2; deg<-2},
               {specresponse <- glm.3; deg<-3})
        
        print(paste("GLM with", deg, "degrees fitted for", specnames[i]))
        
      } else if (model == "gam") {
        
        gam.list <- list()
        gam.AIC <- 0
        
        for(n in 1:4) {
          gam.list[[paste("gam", n, sep=".")]] <- mgcv::gam(species[,i] ~ s(var, k = n+2), family='binomial')
          gam.AIC[n] <- extractAIC(gam.list[[n]])[2]
        }
        
        switch(c(1,2,3,4)[gam.AIC==min(gam.AIC)],
               {specresponse <- gam.list[[1]]; deg<-3},
               {specresponse <- gam.list[[2]]; deg<-4},
               {specresponse <- gam.list[[3]]; deg<-5},
               {specresponse <- gam.list[[4]]; deg<-6})
        
        print(paste("GAM with", deg, "knots fitted for", specnames[i]))
        
      } else {
        stop("Model unknown.")
      }
      
      xneu <- seq(min(var), max(var), len = 101)
      preds <- predict(specresponse, newdata = data.frame(var = xneu),
                       type="response")
      
      if(bw == T) {
        if(points == TRUE) {
          if(i > 1) {
            species[,i][species[,i]==1] <- species[,i][species[,i]==1] - 0.02*(i-1)
            species[,i][species[,i]==0] <- species[,i][species[,i]==0] + 0.02*(i-1)
          }
          
          col <- col2rgb(i)
          points(var, species[,i], pch = i,
                 col = rgb( ramp(seq(0, 1, length = 5)), max = 255))
        }
        
        lines(preds ~ xneu, lty=i)
      } else {
        
        if(points == TRUE) {
          if(i > 1) {
            species[,i][species[,i]==1] <- species[,i][species[,i]==1] - 0.02*(i-1)
            species[,i][species[,i]==0] <- species[,i][species[,i]==0] + 0.02*(i-1)
          }
          
          col <- col2rgb(i)
          points(var, species[,i],
                 col = rgb( ramp(seq(0, 1, length = 5)), max = 255),
                 pch = 16)
        }
        
        lines(preds ~ xneu, lty = i, lwd= 2, col = i)
      }
    }
    
    if(ismat == T) {
      
      if(bw == T){
        if(points == TRUE) {
          legend(0.70, 0.75,legend= "names(species)", "b", lty=1:ls, lwd = 2, pch=1:ls,
                 bty = "n", cex = 0.85)
        } else {
          legend(0.70, 0.75, legend= "names(spees)", lty=1:ls, lwd = 2, pch=1:ls,
                 bty = "n", cex = 0.85)
        }
      } else {
        legend(1.05, 0.75, legend= c("Large river", "Landslide soil", "Mire", "Glacier" ,"Rugged terrain", "Mixed boreal forest" ,
                                     "Open areas with heathland" ,"Roads" ,"Reindeer husbandry facilities" ,"Arable land" ,
                                     "Surface cultivated land" ), lty=1:ls, lwd = 2, col=1:ls, 
               bty = "n", cex = 0.85)
      }
    }
    
  }  else {
    stop("No species in matrix.")
  }
}


###
"Plotting curves for selected landscape elements"
specresponse(av[ ,c(6, 8, 17, 18, 24, 34, 40, 46)], akse1, model = "gam", bw= TRUE, points = FALSE, xlab = "Outer-inner coast")
specresponse2()

specresponse(av[ ,c(1,3,6,12,14, 19,29,36,39,43,53,68:71,84 )], akse1, model = "gam", method = "ord", points = FALSE)
specresponse(av[ ,c(1,3,6,12,19,29,36,39,43,53,68:71,84 )], akse1, method = "ord", points = FALSE)

specresponse(av[ ,c(6, 8, 17, 18, 24, 34, 40, 46)], akse1, points = FALSE)
specresponse(av[ ,c(2,3,12,32,31,40,68,78, 82)], akse1, points = FALSE)


specresponse(av[ ,c(1,3,12)], akse1, model = "gam", points = TRUE)
specresponse(av[ ,c(1,3,12)], akse1, model = "unimodal", points = FALSE)
specresponse(av[ ,c(3)], akse1, points = FALSE)


par(mar=c(5.1, 4.1, 4.1, 12.1), xpd=TRUE)

specresponse2 (av[ ,c(6,8,17,18)], akse1, xlab = "GNMDS 1 (Coastal plains, outer- inner coast)")
specresponse2 (av[ ,c(6, 8, 17, 18,24,28,34,37,40,42,46,50,52,56,65,66)], akse1, model = "gam", xlab = "GNMDS 1 (Coastal plains, outer- inner coast)")
specresponse2 (av[ ,c(6, 8, 17, 18, 34, 40, 46, 52,56,65,66)], akse1, model = "gam", xlab = "GNMDS 1 (Inland hills and mountains)")


specresponse2 (av[ ,c(1:66)], akse1, model = "gam", xlab = "GNMDS 1 (Inland hills and mountains)")

