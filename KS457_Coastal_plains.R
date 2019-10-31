#Skript for statistisk analyse av landskapsdata for Norge 2016
#LA 06 - Analyse av datasettet KS457 (Coastal plains)

###########################################
#### Import og tilrettelegging av data ####
###########################################

#Skriptet er gjort generelt, det vil si at datafiler som importeres navnes om til et standardnavn.
#Skriptet er dermed uavhengig av hvilket datasett som benyttes

#Dersom ikke programmet restartes etter tidligere analyser, fullstendig opprydding; fjerning av alle datarammer

rm(list=ls())
setwd("C:/Users/trosim/Documents/PhD/Subproject_2/Landscape_Analysis_Git_Hub/NiN_Landscape_Analysis")
getwd()

# Loading libraries
library (readxl)#for reading in data
library(vegan)  #vegan 2.4.0
library(graphics)  #for ? kunne identifisere punkter p? ordinasjonsdiagram


#Importerer data(matriser)
#Aktuelle datamatriser er: 

spreadsheet_filename  <-  "KS457_Coastal_plains.xlsx" # Setting the filename to the spreadsheet containg data

# Reading in data, specifying which columns to read with the command 'range'
sheetname  <-  "KS457" # Setting the name of the sheet within the spreadsheet containing data

av <- read_excel(spreadsheet_filename, sheet = sheetname, range = cell_cols("J:CO"), col_names = TRUE) #analysis variables, e.g. the 85 variables in the data; nod id's
av  <-  as.data.frame(av)

lg <- read_excel(spreadsheet_filename, sheet = sheetname, range = cell_cols("C:H"), col_names = TRUE) # placement along CLGs (affiliation to tentative major type based on the Norland project)
lg  <-  as.data.frame(lg)

nv <- read_excel(spreadsheet_filename, sheet = sheetname, range = cell_cols("CQ:CX"), col_names = TRUE) # key variables
nv <- as.data.frame(nv)

id <- read_excel(spreadsheet_filename, sheet = sheetname, range = cell_cols("A:B"), col_names = TRUE) #ID's and area
id <- as.data.frame(id)

sheetname  <-  "OrdRes" # Setting the name of the sheet within the spreadsheet containing data
onv <- read_excel(spreadsheet_filename, sheet = sheetname, range = cell_cols("O:S"), col_names = TRUE) #rONV'er
onv <- as.data.frame(onv)

sheetname  <-  "Resk2" # Setting the name of the sheet within the spreadsheet containing data
snv <- read_excel(spreadsheet_filename, sheet = sheetname, range = cell_cols("B:K"), col_names = TRUE) #reskalerte rONV'er (jf. regneark /resk)
snv <- as.data.frame(snv)

sheetname  <-  "JAtype" # Setting the name of the sheet within the spreadsheet containing data
jk <- read_excel(spreadsheet_filename, sheet = sheetname, range = cell_cols("F:G"), col_names = TRUE) #jordartsklasser

sheetname  <-  "OrdRes" # Setting the name of the sheet within the spreadsheet containing data
ordx <- read_excel(spreadsheet_filename, sheet = sheetname, range = cell_cols("B:E"), col_names = TRUE) #DCA
ordx <- as.data.frame(ordx)

dca1 <- ordx[,1]
dca2 <- ordx[,2]
dca3 <- ordx[,3]
dca4 <- ordx[,4]

sheetname  <-  "OrdRes" # Setting the name of the sheet within the spreadsheet containing data
ordx <- read_excel(spreadsheet_filename, sheet = sheetname, range = cell_cols("K:N"), col_names = TRUE) #GNMDS
ordx <- as.data.frame(ordx)

gnmds1 <- ordx[,1]
gnmds2 <- ordx[,2]
gnmds3 <- ordx[,3]
gnmds4 <- ordx[,4]

gnmds4_1 <- gnmds1
gnmds4_2 <- gnmds2
gnmds4_3 <- gnmds3 
gnmds4_4 <- gnmds4

akse1<-gnmds4_1
akse2<-gnmds4_2
akse3<-gnmds4_3
akse4<-gnmds4_4

attach(av)
names(av)
attach(lg)
names(lg)
attach(nv)
names(nv)
attach(id)
names(id)
attach(onv)
names(onv)
attach(snv)
names(snv)
attach(jk)
names(jk)

JK1 <- factor(JK1)
JK2 <- factor(JK2)

############################################
#### Innledende analyser av datasettene ####
############################################

#Korrelasjoner mellom n?kkelvariabler og/eller analysevariabler

#Velg variabel; variabler som ikke er relevante folr det aktuelle deldatasettet rem'es ut med #

nvar <- Kbf_a

cor.test(nvar,Oyst_i,method="k")
cor.test(nvar,Land_a,method="k")
cor.test(nvar,R_net_a,method="k")
cor.test(nvar,Ekspve_a,method="k")
cor.test(nvar,Stromn_a,method="k")

cor.test(nvar,Guro_t_a,method="k")
cor.test(nvar,Cre_f_a,method="k")
cor.test(nvar,Cre_b_a,method="k")
cor.test(nvar,Tpi1h_a,method="k")

#Histogrammer for n?kkelvariabler

hist(IfIu)

###############################################
#### Standardskript for ordinasjonsanalyse ####
###############################################

##### DCA #####
par(mfrow=c(1,1))

#Enkel plotting av DCA-resultater, svarte prikker:
plot(dca1,dca2,xlab="DCA1 - Coastal plains (KS457)",ylab="DCA2 - Coastal plains (KS457)",type="n")
plot(dca1,dca2,xlab="DCA1 - Coastal plains (KS457)",ylab="DCA2 - Coastal plains (KS457)",pch=16)

##### GNMDS #####

#Ekstrahering av akser, k = 2

#Enkelt ordinasjonsdiagram med punkter:
#Valg av akser som skal plottes
ax1 <- gnmds4_1
ax2 <- gnmds4_2

plot(ax1,ax2,xlab="GNMDS2 1 - Kyst (K810; H.C.-enheter)",ylab="GNMDS2 2 - Kyst (K810; H.C.-enheter)",xlim=c(-0.5,1),ylim=c(-0.7,0.7),pch=16,cex=0.5)
lines(c(-2,2),c(0,0),lty=2,col=8)
lines(c(0,0),c(-2,2),lty=2,col=8)

plot(ax1,ax2,xlab="GNMDS3 1 - Kyst (K810; H.C.-enheter)",ylab="GNMDS3 2 - Kyst (K810; H.C.-enheter)",xlim=c(-0.6,0.8),ylim=c(-0.7,0.7),pch=16,cex=0.5)
lines(c(-2,2),c(0,0),lty=2,col=8)
lines(c(0,0),c(-2,2),lty=2,col=8)

plot(ax1,ax2,xlab="GNMDS4 1 - Kyst (K810; H.C.-enheter)",ylab="GNMDS4 2 - Kyst (K810; H.C.-enheter)",xlim=c(-0.6,0.8),ylim=c(-0.7,0.7),pch=16,cex=0.5)
lines(c(-2,2),c(0,0),lty=2,col=8)
lines(c(0,0),c(-2,2),lty=2,col=8)

##### Korrelasjon mellom GNMDS- og DCA-akser #####

#Beregning av korrelasjonskoeffisienter; bare linjer som er relevante brukes:

ax <- dca4

cor.test(ax,gnmds1,method="k")
cor.test(ax,gnmds2,method="k")
cor.test(ax,gnmds3,method="k") 
cor.test(ax,gnmds4,method="k")

#Bestemmer gradientlengdene for akse 1, 2 og 3 og 4
grl1 <- max(akse1)-min(akse1)
grl2 <- max(akse2)-min(akse2)
grl3 <- max(akse3)-min(akse3)
grl4 <- max(akse4)-min(akse4)
grl1
grl2
grl3
grl4


########################################################################
#### Tolkning av ordinasjon vha korrelasjonsanalyse og enkle tester ####
########################################################################

#### Velg akser som skal analyseres

GNMDS4_1  <-  gnmds1
GNMDS4_2  <-  gnmds2
GNMDS4_3  <-  gnmds3
GNMDS4_4  <-  gnmds4

#Beregner korrelasjoner mellom ordinasjonsakser og n?kkelvariablene
#Velg n?kkelvariabel

nvar <- RR1

cor.test(akse1,nvar,method="k")
cor.test(akse2,nvar,method="k")
cor.test(akse3,nvar,method="k")
cor.test(akse4,nvar,method="k")

cor.test(R_net_a,akse2,method="k")

#Kruskal-Wallis' test av hvorvidt trinn langs LG segregrer langs ordinasjonsakser

#Velg landskapsgradient (?n og ?n m? analyseres)

lgvar <- factor(JP)

kruskal.test(akse1,lgvar)
kruskal.test(akse2,lgvar)
kruskal.test(akse3,lgvar)
kruskal.test(akse4,lgvar)

#ANOVA av hvorvidt trinn langs LG segregres langs ordinasjonsakser

#Velg akse og landskapsgradient (?n og ?n m? analyseres)

lgvar <- factor(JP)
akse <- akse1

lm0 <- lm(akse~+1)
lm1 <- lm(akse~lgvar)
lm1
anova(lm0,lm1,test="F")

#######Beregning av Kendall's tau mellom en ordinasjonsakse eller variabel og analysevariablene#######

ax <- sONV_OI #Bestem akse
env.var <- ordx #Bestem milj?variabelmatrise

p.val <- NULL #create empty objects for the p.values
tau.val <- NULL #creates empty object for the t-values.
p <- NULL

for(i in 1:4) # A Loop that calculates Kendall's tau and p-values for all the correlations tests.
{
  z <- cor.test(ax,env.var[,i], method="k")
  p.val[i] <- round(z$p.value, digits=5)
  tau.val[i] <- round(z$estimate,digits=5)
  if (p.val[i] < 0.05) #prints a star when the p-value is less than 0.05
  {p[i] <- "###"
  }else{
    p[i] <- " "}
}
#p.val
#tau.val
(test.summary.ax <- data.frame(cbind(names(env.var),p.val,tau.val,p)))

#Utskrift av resultat, kolonne for kolonne

writeClipboard(as.character(test.summary.ax[,1])) #Variabelnavn
writeClipboard(as.character(test.summary.ax[,3])) #Tau-verdier
writeClipboard(as.character(test.summary.ax[,2])) #p-verdier
writeClipboard(as.character(test.summary.ax[,3]))

#Beregning av Kendall's tau mellom variabler



##################################################
#### Standardskript for ordinasjonsdiagrammer ####
##################################################

#### Velge akser som skal plottes (over)

#### Enkelt diagram med punkter ####

#Plotting av ordinasjonsdiagram med svarte prikker for OE'ene:
plot(akse1,akse2,xlab="",ylab="",type="n")
plot(akse1,akse2,pch=16)

#### Generelt ordinasjonsdiagrammer med like enheter p? begge aksene ####

#Bestemmer gradientlengdene for akse 1, 2 og 3 og 4
grl1 <- max(akse1)-min(akse1)
grl2 <- max(akse2)-min(akse2)
grl3 <- max(akse3)-min(akse3)
grl4 <- max(akse4)-min(akse4)
grl1
grl2
grl3
grl4

#Diagram for akse 1 mot akse 2
#Vil finne koordinatene for hj?rner i det 'plotteomr?det' med koordinater (x1, x2, y1, y2) som gir
#like enheter p? begge akser. Vi holder x1, x2 og y1 faste og bestemmer y2 slik at (x2-x1)/(y2-y1) i plt=c(x1,x2,y1,y2)
#blir lik grl1/grl2
#Det krever at y2 = [(x2-x1)*grl2 + y1*grl1]/grl1 
#Setter vi x1, x2 og y1 konstante, f?r vi:
y2 <- (0.8*grl2+0.15*grl1)/grl1
y2

#Diagram for akse 1 mot akse 3
#Vil finne koordinatene for hj?rner i det 'plotteomr?det' med koordinater (x1, x2, z1, z2) som gir
#like enheter p? begge akser. Vi holder x1, x2 og z1 faste og bestemmer z2 slik at (x2-x1)/(z2-z1) i plt=c(x1,x2,z1,z2)
#blir lik grl1/grl3
#Det krever at z2 = [(x2-x1)*grl3 + z1*grl1]/grl1 
#Setter vi x1, x2 og z1 konstante, f?r vi:
z2 <- (0.8*grl3+0.15*grl1)/grl1
z2

#Diagram for akse 1 mot akse 4
#Vil finne koordinatene for hj?rner i det 'plotteomr?det' med koordinater (x1, x2, w1, w2) som gir
#like enheter p? begge akser. Vi holder x1, x2 og w1 faste og bestemmer w2 slik at (x2-x1)/(w2-w1) i plt=c(x1,x2,w1,w2)
#blir lik grl1/grl4
#Det krever at w2 = [(x2-x1)*grl3 + w1*grl1]/grl1 
#Setter vi x1, x2 og w1 konstante, f?r vi:
w2 <- (0.8*grl4+0.15*grl1)/grl1
w2

par(mfrow=c(1,1))

#Tegner diagrammet for aksene 1 og 2
par(plt=c(0.15, 0.95, 0.15, y2))
plot(akse1,akse2,xlab="GNMDS 1 Coastal plains (KS457)",ylab="GNMDS 2 Coastal plains (KS457)",xlim=c(min(akse1)-0.01,max(akse1)+0.01),ylim=c(min(akse2)-0.01,max(akse2)+0.01),xaxp=c(-0.5,1,3),yaxp=c(-0.5,0.5,2),type="n") #Grunnlag for plotting av symboler etc.
points(akse1,akse2,pch=16,cex=0.75)
lines(c(-2,2),c(0,0),lty=2,col=8)
lines(c(0,0),c(-2,2),lty=2,col=8)

#Tegner diagrammet for aksene 1 og 3
par(plt=c(0.15, 0.95, 0.15, z2))
plot(akse1,akse3,xlab="GNMDS 1 Coastal plains (KS457)",ylab="GNMDS 3 Coastal plains (KS457)",xlim=c(min(akse1)-0.01,max(akse1)+0.01),ylim=c(min(akse3)-0.01,max(akse3)+0.01),xaxp=c(-0.5,1,3),yaxp=c(-0.5,0.5,2),type="n") #Grunnlag for plotting av symboler etc.
points(akse1,akse3,pch=16,cex=0.75)
lines(c(-2,2),c(0,0),lty=2,col=8)
lines(c(0,0),c(-2,2),lty=2,col=8)

#Tegner diagrammet for aksene 1 og 4
par(plt=c(0.15, 0.95, 0.15, w2))
plot(akse1,akse4,xlab="GNMDS 1 Coastal plains (KS457)",ylab="GNMDS 4 Coastal plains (KS457)",xlim=c(min(akse1)-0.01,max(akse1)+0.01),ylim=c(min(akse4)-0.01,max(akse4)+0.01),xaxp=c(-0.5,1,3),yaxp=c(-0.5,0.5,2),type="n") #Grunnlag for plotting av symboler etc.
points(akse1,akse4,pch=16,cex=0.75)
lines(c(-2,2),c(0,0),lty=2,col=8)
lines(c(0,0),c(-2,2),lty=2,col=8)

##Vektorer for n?kkelvariabler, med envfit, diagrammet for akse 1 og 2; merk at r2 er squared Pearson's 

#Setter sammen de aktuelle aksene til en dataramme
ordx <- data.frame(akse1, akse2, akse3, akse4)
is.data.frame(ordx)
dim(ordx)

#Samler aktuelle n?kkelvariabler + 'surrogater' i ei dataramme
nvxOI <- data.frame(Gab_a,IfI,Lled_a,Vei_b_a,Sefr_a,Cul_a_s,Abygg_a)
nvxOI
nvxJP <- data.frame(Arfull_a,JI)
nvxJP
nvxSN <- data.frame(Arlov_a,Arbar_a,Land_a,Arbla_a,R_net_a,Kbf_a,Oyst_i,Ekspve_a)
nvxSN
nvxIP <- data.frame(Inns_s,II)
nvxIP
nvxMP <- data.frame(MI)
nvxMP
nvxX <- data.frame(Sn_torr,Sn_frisk,Sn_flekk,Bohei_a,Araaf_a,Kskred_a)
nvxX
nvx3 <- data.frame(IfI,Arfull_a,Oyst_i,RR1)
nvx3
nvxRR <- data.frame(RR1, Cre_f_a, Cre_f_a, Flat_a, Tpi1h_a, Tpi1l_a, Rug3_m, Guro_t_a)
nvxRR

#Beregner envfit-vektorer
ordvek12OI <- envfit(ordx[,1:2], nvxOI, permutations = 999)
ordvek12JP <- envfit(ordx[,1:2], nvxJP, permutations = 999)
ordvek12SN <- envfit(ordx[,1:2], nvxSN, permutations = 999)
ordvek12RR <- envfit(ordx[,1:2], nvxRR, permutations = 999)

ordvek12OI$vectors$arrows #gir koordinater for vektorpilenes hoder, standardisert til lengde = 1
ordvek12OI$vectors$r #gir r-squared for variablene
ordvek12OI #gir begge deler, skrevet ut i tabell
ordvek12JP #gir begge deler, skrevet ut i tabell
ordvek12SN #gir begge deler, skrevet ut i tabell
ordvek12RR #gir begge deler, skrevet ut i tabell

ordvek13IP <- envfit(ordx[,c(1,3)], nvxIP, permutations = 999)
ordvek13IP #gir begge deler, skrevet ut i tabell
ordvek13MP <- envfit(ordx[,c(1,3)], nvxMP, permutations = 999)
ordvek13MP
ordvek13X <- envfit(ordx[,c(1,3)], nvxX, permutations = 999)
ordvek13X
ordvek133 <- envfit(ordx[,c(1,3)], nvx3, permutations = 999)
ordvek133

ordvek14 <- envfit(ordx[,c(1,4)], nvx, permutations = 999)
ordvek14 #gir begge deler, skrevet ut i tabell

#Plotter vektorpiler p? standardordinasjonsdiagrammene med kommandoene:
plot(ordvek12OI,arrow.mul=.58,col="brown",add=T,cex=0.8)
plot(ordvek12JP,arrow.mul=.58,col="green3",add=T,cex=0.8)
plot(ordvek12SN,arrow.mul=.58,col="blue3",add=T,cex=0.8)
plot(ordvek12RR,arrow.mul=.49,col="darkviolet",add=T,cex=0.8)

plot(ordvek13IP,arrow.mul=.73,col="blue3",add=T,cex=0.6)
plot(ordvek13MP,arrow.mul=1.02,col="green3",add=T,cex=0.6)
plot(ordvek13X,arrow.mul=.61,col="brown",add=T,cex=0.6)
plot(ordvek133,arrow.mul=.61,col="black",add=T,cex=0.6)

plot(ordvek14,arrow.mul=.63,col="green3",add=T,cex=0.6)

###Figurer med isolinjer p? ordinasjonsdiagrammet (Ordisurf); akser 1 mot 2.
par(mfrow=c(1,1))

##For IfI med OI (akser 1 og 2)

par(plt=c(0.15, 0.95, 0.15, y2))
plot(akse1,akse2,xlab="GNMDS 1 Coastal plains (KS457)",ylab="GNMDS 2 Coastal plains (KS457)",xlim=c(min(akse1)-0.01,max(akse1)+0.01),ylim=c(min(akse2)-0.01,max(akse2)+0.01),xaxp=c(-0.5,1,3),yaxp=c(-0.5,0.5,2),type="n") #Grunnlag for plotting av symboler etc.
lines(c(-2,2),c(0,0),lty=2,col=8)
lines(c(0,0),c(-2,2),lty=2,col=8)

os <- ordisurf(ordx,IfI,display="sites",levels=c(1,2,4,6,8,10,11,12,13,14), col="red",add=T) #inkluderer plotting p? eksisterende ordinasjonsdiagram
lines(c(-0.77,-0.74),c(0.535,0.535),col=2)
text(-0.72,0.535,"IfI",adj=0,cex=0.8)

#Punkter ulike farger og symboler for ulike infrastruktur-trinn (OI-klasser 1-6)
points(akse1[OI==1],akse2[OI==1],pch=1,cex=0.6,col="lightblue3")
points(akse1[OI==2],akse2[OI==2],pch=16,cex=0.6,col="lightblue3")
points(akse1[OI==3],akse2[OI==3],pch=1,cex=0.75,col="lightblue4")
points(akse1[OI==4],akse2[OI==4],pch=16,cex=0.75,col="lightblue4")
points(akse1[OI==5],akse2[OI==5],pch=1,cex=0.9,col="red")
points(akse1[OI==6],akse2[OI==6],pch=16,cex=0.9,col="red")
points(-0.75,0.49,pch=1,cex=0.6,col="lightblue3")
text(-0.72,0.49,"OI = 1",adj=0,cex=0.8)
points(-0.75,0.45,pch=16,cex=0.6,col="lightblue3")
text(-0.72,0.45,"OI = 2",adj=0,cex=0.8)
points(-0.75,0.41,pch=1,cex=0.75,col="lightblue4")
text(-0.72,0.41,"OI = 3",adj=0,cex=0.8)
points(-0.75,0.37,pch=16,cex=0.75,col="lightblue4")
text(-0.72,0.37,"OI = 4",adj=0,cex=0.8)
points(-0.75,0.33,pch=1,cex=0.9,col="red")
text(-0.72,0.33,"OI = 5",adj=0,cex=0.8)
points(-0.75,0.29,pch=16,cex=0.9,col="red")
text(-0.72,0.29,"OI = 6",adj=0,cex=0.8)

##For Arfull_a med JP (akser 1 og 2)

hist(Arfull_a)
plot(IfI,JI)

par(plt=c(0.15, 0.95, 0.15, y2))
plot(akse1,akse2,xlab="GNMDS 1 Coastal plains (KS457)",ylab="GNMDS 2 Coastal plains (KS457)",xlim=c(min(akse1)-0.01,max(akse1)+0.01),ylim=c(min(akse2)-0.01,max(akse2)+0.01),xaxp=c(-0.5,1,3),yaxp=c(-0.5,0.5,2),type="n") #Grunnlag for plotting av symboler etc.
lines(c(-2,2),c(0,0),lty=2,col=8)
lines(c(0,0),c(-2,2),lty=2,col=8)

os <- ordisurf(ordx,Arfull_a,display="sites",levels=c(0.1,0.4,0.6,0.8), col="red",add=T) #inkluderer plotting p? eksisterende ordinasjonsdiagram
lines(c(-0.77,-0.74),c(0.535,0.535),col=2)
text(-0.72,0.535,"Arfull_a",adj=0,cex=0.8)

#Punkter ulike farger og symboler for ulike jordbrukspreg-trinn (JP 1-3)
points(akse1[JP==1],akse2[JP==1],pch=1,cex=0.6,col="lightblue2")
points(akse1[JP==2],akse2[JP==2],pch=16,cex=0.75,col="lightblue4")
points(akse1[JP==3],akse2[JP==3],pch=16,cex=0.9,col="red")
points(-0.75,0.49,pch=1,cex=0.6,col="lightblue2")
text(-0.72,0.49,"JP = 1",adj=0,cex=0.8)
points(-0.75,0.45,pch=16,cex=0.75,col="lightblue4")
text(-0.72,0.45,"JP = 2",adj=0,cex=0.8)
points(-0.75,0.41,pch=16,cex=0.9,col="red")
text(-0.72,0.41,"JP = 3",adj=0,cex=0.8)

##For JI med JP (akser 1 og 2)

hist(JI)

par(plt=c(0.15, 0.95, 0.15, y2))
plot(akse1,akse2,xlab="GNMDS 1 Coastal plains (KS457)",ylab="GNMDS 2 Coastal plains (KS457)",xlim=c(min(akse1)-0.01,max(akse1)+0.01),ylim=c(min(akse2)-0.01,max(akse2)+0.01),xaxp=c(-0.5,1,3),yaxp=c(-0.5,0.5,2),type="n") #Grunnlag for plotting av symboler etc.
lines(c(-2,2),c(0,0),lty=2,col=8)
lines(c(0,0),c(-2,2),lty=2,col=8)

os <- ordisurf(ordx,JI,display="sites",levels=c(0.01,0.025,0.05,0.1,0.2), col="red",add=T) #inkluderer plotting p? eksisterende ordinasjonsdiagram
lines(c(-0.77,-0.74),c(0.535,0.535),col=2)
text(-0.72,0.535,"JI",adj=0,cex=0.8)

#Punkter ulike farger og symboler for ulike jordbrukspreg-trinn (JP 1-3)
points(akse1[JP==1],akse2[JP==1],pch=1,cex=0.6,col="lightblue2")
points(akse1[JP==2],akse2[JP==2],pch=16,cex=0.75,col="lightblue4")
points(akse1[JP==3],akse2[JP==3],pch=16,cex=0.9,col="red")
points(-0.75,0.49,pch=1,cex=0.6,col="lightblue2")
text(-0.72,0.49,"JP = 1",adj=0,cex=0.8)
points(-0.75,0.45,pch=16,cex=0.75,col="lightblue4")
text(-0.72,0.45,"JP = 2",adj=0,cex=0.8)
points(-0.75,0.41,pch=16,cex=0.9,col="red")
text(-0.72,0.41,"JP = 3",adj=0,cex=0.8)

##Fig. med jordartskategorier p? akser 1 og 2

par(plt=c(0.15, 0.95, 0.15, z2))
plot(akse1,akse2,xlab="GNMDS 1 Coastal plains (KS457)",ylab="GNMDS 2 Coastal plains (KS457)",xlim=c(min(akse1)-0.01,max(akse1)+0.01),ylim=c(min(akse2)-0.01,max(akse2)+0.01),xaxp=c(-0.5,1,3),yaxp=c(-0.5,0.5,2),type="n") #Grunnlag for plotting av symboler etc.
lines(c(-2,2),c(0,0),lty=2,col=8)
lines(c(0,0),c(-2,2),lty=2,col=8)

points(akse1[JK2=="H"],akse2[JK2=="H"],pch=16,cex=0.5,col="red")
points(akse1[JK1=="H"],akse2[JK1=="H"],pch=16,cex=0.8,col="red3")
points(akse1[JK1=="B"],akse2[JK1=="B"],pch=16,cex=0.4,col="black")
points(akse1[JK1==0],akse2[JK1==0],pch=1,cex=0.5,col="lightblue4")

points(-0.75,0.41,pch=1,cex=0.5,col="lightblue4")
text(-0.72,0.41,"JK1 = 0 (ingen)",adj=0,cex=0.8)
points(-0.75,0.45,pch=16,cex=0.4,col="black")
text(-0.72,0.45,"JK1 = B (> 50 % NB)",adj=0,cex=0.8)
points(-0.75,0.49,pch=16,cex=0.5,col="red")
text(-0.72,0.49,"JK2 = H (> 25 % MA)",adj=0,cex=0.8)
points(-0.75,0.53,pch=16,cex=0.8,col="red3")
text(-0.72,0.53,"JK2 = H (> 50 % MA)",adj=0,cex=0.8)


##For Arlov_a (den enkeltvariabelen som er sterkest korrelert med akse 1) blant SN-relaterte variabler

hist(Arlov_a)

par(plt=c(0.15, 0.95, 0.15, z2))
plot(akse1,akse2,xlab="GNMDS 1 Coastal plains (KS457)",ylab="GNMDS 2 Coastal plains (KS457)",xlim=c(min(akse1)-0.01,max(akse1)+0.01),ylim=c(min(akse2)-0.01,max(akse2)+0.01),xaxp=c(-0.5,1,3),yaxp=c(-0.5,0.5,2),type="n") #Grunnlag for plotting av symboler etc.
lines(c(-2,2),c(0,0),lty=2,col=8)
lines(c(0,0),c(-2,2),lty=2,col=8)

os <- ordisurf(ordx[,c(1,2)],Arlov_a,display="sites",levels=c(0.1,0.25,0.4,0.6,0.8), col="red",add=T) #inkluderer plotting p? eksisterende ordinasjonsdiagram
lines(c(-0.77,-0.74),c(0.535,0.535),col=2)
text(-0.72,0.535,"Arlov_a",adj=0,cex=0.8)

#Punkter ulike farger og symboler for ulike (nye) skj?rg?rdspreg-trinn (SN-klasser 1-4)

points(akse1[SN==1],akse3[SN==1],pch=16,cex=0.5,col=1)
points(akse1[SN==2],akse3[SN==2],pch=16,cex=0.6,col="lightblue2")
points(akse1[SN==3],akse3[SN==3],pch=16,cex=0.75,col="darkblue")
points(akse1[SN==4],akse3[SN==4],pch=1,cex=0.75,col="red")
points(akse1[SN==5],akse3[SN==5],pch=16,cex=0.9,col="red")
points(-0.75,0.49,pch=16,cex=0.5,col="black")
text(-0.72,0.49,"SN = 1 (mainland)",adj=0,cex=0.8)
points(-0.75,0.45,pch=16,cex=0.6,col="lightblue2")
text(-0.72,0.45,"SN = 2",adj=0,cex=0.8)
points(-0.75,0.41,pch=16,cex=0.75,col="darkblue")
text(-0.72,0.41,"SN = 3",adj=0,cex=0.8)
points(-0.75,0.37,pch=1,cex=0.75,col="red")
text(-0.72,0.37,"SN = 4",adj=0,cex=0.8)
points(-0.75,0.33,pch=16,cex=0.9,col="red")
text(-0.72,0.33,"SN = 5",adj=0,cex=0.8)

##For Oyst_i

par(plt=c(0.15, 0.95, 0.15, z2))
plot(akse1,akse2,xlab="GNMDS 1 Coastal plains (KS457)",ylab="GNMDS 2 Coastal plains (KS457)",xlim=c(min(akse1)-0.01,max(akse1)+0.01),ylim=c(min(akse2)-0.01,max(akse2)+0.01),xaxp=c(-0.5,1,3),yaxp=c(-0.5,0.5,2),type="n") #Grunnlag for plotting av symboler etc.
lines(c(-2,2),c(0,0),lty=2,col=8)
lines(c(0,0),c(-2,2),lty=2,col=8)

os <- ordisurf(ordx[,c(1,2)],Oyst_i,display="sites",levels=c(0.19,0.454,0.574,0.643,0.693,0.733,0.768,0.798), col="red",add=T) #inkluderer plotting p? eksisterende ordinasjonsdiagram
lines(c(-0.77,-0.74),c(0.535,0.535),col=2)
text(-0.72,0.535,"Inverse island size (Oyst_i)",adj=0,cex=0.8)

#Punkter ulike farger og symboler for ulike (nye) skj?rg?rdspreg-trinn (SN-klasser 1-4)

points(akse1[SN==1],akse3[SN==1],pch=16,cex=0.5,col=1)
points(akse1[SN==2],akse3[SN==2],pch=16,cex=0.6,col="lightblue2")
points(akse1[SN==3],akse3[SN==3],pch=16,cex=0.75,col="darkblue")
points(akse1[SN==4],akse3[SN==4],pch=1,cex=0.75,col="red")
points(akse1[SN==5],akse3[SN==5],pch=16,cex=0.9,col="red")
points(-0.75,0.49,pch=16,cex=0.5,col="black")
text(-0.72,0.49,"SN = 1 (mainland)",adj=0,cex=0.8)
points(-0.75,0.45,pch=16,cex=0.6,col="lightblue2")
text(-0.72,0.45,"SN = 2",adj=0,cex=0.8)
points(-0.75,0.41,pch=16,cex=0.75,col="darkblue")
text(-0.72,0.41,"SN = 3",adj=0,cex=0.8)
points(-0.75,0.37,pch=1,cex=0.75,col="red")
text(-0.72,0.37,"SN = 4",adj=0,cex=0.8)
points(-0.75,0.33,pch=16,cex=0.9,col="red")
text(-0.72,0.33,"SN = 5",adj=0,cex=0.8)

plot.new
plot(IfI,Oyst_i)
hist(Oyst_i[IfI==0])

### Har kommet hit

##For Kbf_a

hist(Kbf_a)

par(plt=c(0.15, 0.95, 0.15, z2))
plot(akse1,akse2,xlab="GNMDS 1 Coastal plains (KS457)",ylab="GNMDS 2 Coastal plains (KS457)",xlim=c(min(akse1)-0.01,max(akse1)+0.01),ylim=c(min(akse2)-0.01,max(akse2)+0.01),xaxp=c(-0.5,1,3),yaxp=c(-0.5,0.5,2),type="n") #Grunnlag for plotting av symboler etc.
lines(c(-2,2),c(0,0),lty=2,col=8)
lines(c(0,0),c(-2,2),lty=2,col=8)

os <- ordisurf(ordx[,c(1,2)],Kbf_a,display="sites",levels=c(0.2,0.4,0.6,0.8,0.9,0.95), col="red",add=T) #inkluderer plotting p? eksisterende ordinasjonsdiagram
lines(c(-0.77,-0.74),c(0.535,0.535),col=2)
text(-0.72,0.535,"Proportion of area with soil type bare rock (Kbf_a)",adj=0,cex=0.8)

#Punkter ulike farger og symboler for ulike (nye) skj?rg?rdspreg-trinn (SN-klasser 1-4)

points(akse1[SN==1],akse3[SN==1],pch=16,cex=0.5,col=1)
points(akse1[SN==2],akse3[SN==2],pch=16,cex=0.6,col="lightblue2")
points(akse1[SN==3],akse3[SN==3],pch=16,cex=0.75,col="darkblue")
points(akse1[SN==4],akse3[SN==4],pch=1,cex=0.75,col="red")
points(akse1[SN==5],akse3[SN==5],pch=16,cex=0.9,col="red")
points(-0.75,0.49,pch=16,cex=0.5,col="black")
text(-0.72,0.49,"SN = 1 (mainland)",adj=0,cex=0.8)
points(-0.75,0.45,pch=16,cex=0.6,col="lightblue2")
text(-0.72,0.45,"SN = 2",adj=0,cex=0.8)
points(-0.75,0.41,pch=16,cex=0.75,col="darkblue")
text(-0.72,0.41,"SN = 3",adj=0,cex=0.8)
points(-0.75,0.37,pch=1,cex=0.75,col="red")
text(-0.72,0.37,"SN = 4",adj=0,cex=0.8)
points(-0.75,0.33,pch=16,cex=0.9,col="red")
text(-0.72,0.33,"SN = 5",adj=0,cex=0.8)

#For RR1 (varierer fra 12 til 364) med SN

hist(RR1)

par(plt=c(0.15, 0.95, 0.15, z2))
plot(akse1,akse2,xlab="GNMDS 1 Coastal plains (KS457)",ylab="GNMDS 2 Coastal plains (KS457)",xlim=c(min(akse1)-0.01,max(akse1)+0.01),ylim=c(min(akse2)-0.01,max(akse2)+0.01),xaxp=c(-0.5,1,3),yaxp=c(-0.5,0.5,2),type="n") #Grunnlag for plotting av symboler etc.
lines(c(-2,2),c(0,0),lty=2,col=8)
lines(c(0,0),c(-2,2),lty=2,col=8)

os <- ordisurf(ordx[,c(1,2)],RR1,display="sites",levels=c(25,50,75,100,150,200), col="red",add=T) #inkluderer plotting p? eksisterende ordinasjonsdiagram
lines(c(-0.77,-0.74),c(0.535,0.535),col=2)
text(-0.72,0.535,"RR1",adj=0,cex=0.8)

#Punkter ulike farger og symboler for ulike (nye) skj?rg?rdspreg-trinn (SN-klasser 1-4)

points(akse1[SN==1],akse3[SN==1],pch=16,cex=0.5,col=1)
points(akse1[SN==2],akse3[SN==2],pch=16,cex=0.6,col="lightblue2")
points(akse1[SN==3],akse3[SN==3],pch=16,cex=0.75,col="darkblue")
points(akse1[SN==4],akse3[SN==4],pch=1,cex=0.75,col="red")
points(akse1[SN==5],akse3[SN==5],pch=16,cex=0.9,col="red")
points(-0.75,0.49,pch=16,cex=0.5,col="black")
text(-0.72,0.49,"SN = 1 (mainland)",adj=0,cex=0.8)
points(-0.75,0.45,pch=16,cex=0.6,col="lightblue2")
text(-0.72,0.45,"SN = 2",adj=0,cex=0.8)
points(-0.75,0.41,pch=16,cex=0.75,col="darkblue")
text(-0.72,0.41,"SN = 3",adj=0,cex=0.8)
points(-0.75,0.37,pch=1,cex=0.75,col="red")
text(-0.72,0.37,"SN = 4",adj=0,cex=0.8)
points(-0.75,0.33,pch=16,cex=0.9,col="red")
text(-0.72,0.33,"SN = 5",adj=0,cex=0.8)


###Figurer med isolinjer p? ordinasjonsdiagrammet (Ordisurf); akser 1 mot 3.

##For RR1

par(plt=c(0.15, 0.95, 0.15, z2))
plot(akse1,akse3,xlab="GNMDS 1 Fjord (KF353)",ylab="GNMDS 3 Fjord (KF353)",xlim=c(min(akse1)-0.01,max(akse1)+0.01),ylim=c(min(akse3)-0.01,max(akse3)+0.01),xaxp=c(-0.5,1,3),yaxp=c(-0.5,0.5,2),type="n") #Grunnlag for plotting av symboler etc.
lines(c(-2,2),c(0,0),lty=2,col=8)
lines(c(0,0),c(-2,2),lty=2,col=8)

os <- ordisurf(ordx[,c(1,3)],RR1,display="sites",levels=c(0,100,200,300,400), col="red",add=T) #inkluderer plotting p? eksisterende ordinasjonsdiagram
lines(c(-0.525,-0.495),c(0.51,0.51),col=2)
text(-0.48,0.51,"RR1",adj=0,cex=0.8)

#Punkter ulike farger og symboler for ulike dalnedskj?ringstrinn-trinn (DN-klasser 1-4)
points(akse1[DN==1],akse3[DN==1],pch=16,cex=0.6,col="lightblue2")
points(akse1[DN==2],akse3[DN==2],pch=16,cex=0.6,col="lightblue4")
points(akse1[DN==3],akse3[DN==3],pch=16,cex=0.75,col="darkblue")
points(akse1[DN==4],akse3[DN==4],pch=16,cex=0.75,col="red")
points(-0.51,0.475,pch=16,cex=0.6,col="lightblue2")
text(-0.48,0.475,"DN = 1",adj=0,cex=0.8)
points(-0.51,0.445,pch=16,cex=0.6,col="lightblue4")
text(-0.48,0.445,"DN = 2",adj=0,cex=0.8)
points(-0.51,0.415,pch=16,cex=0.75,col="darkblue")
text(-0.48,0.415,"DN = 3",adj=0,cex=0.8)
points(-0.51,0.385,pch=16,cex=0.75,col="red")
text(-0.48,0.385,"DN = 4",adj=0,cex=0.8)

##For MI

par(plt=c(0.15, 0.95, 0.15, z2))
plot(akse1,akse3,xlab="GNMDS 1 Fjord (KF353)",ylab="GNMDS 3 Fjord (KF353)",xlim=c(min(akse1)-0.01,max(akse1)+0.01),ylim=c(min(akse3)-0.01,max(akse3)+0.01),xaxp=c(-0.5,1,3),yaxp=c(-0.5,0.5,2),type="n") #Grunnlag for plotting av symboler etc.
lines(c(-2,2),c(0,0),lty=2,col=8)
lines(c(0,0),c(-2,2),lty=2,col=8)

os <- ordisurf(ordx[,c(1,3)],MI,display="sites",levels=c(0,0.02,0.04,0.06,0.08,0.1), col="red",add=T) #inkluderer plotting p? eksisterende ordinasjonsdiagram
lines(c(-0.525,-0.495),c(0.51,0.51),col=2)
text(-0.48,0.51,"MI",adj=0,cex=0.8)

#Punkter ulike farger og symboler for ulike MP-trinn (1 eller 2)
points(akse1[MP==1],akse3[MP==1],pch=16,cex=0.6,col="lightblue3")
points(akse1[MP==2],akse3[MP==2],pch=16,cex=0.6,col="red")
points(-0.51,0.475,pch=16,cex=0.6,col="lightblue3")
text(-0.48,0.475,"MP = 1",adj=0,cex=0.8)
points(-0.51,0.445,pch=16,cex=0.6,col="red")
text(-0.48,0.445,"MP = 2",adj=0,cex=0.8)

##For Steep_a

hist(Steep_a)

par(plt=c(0.15, 0.95, 0.15, z2))
plot(akse1,akse3,xlab="GNMDS 1 Fjord (KF353)",ylab="GNMDS 3 Fjord (KF353)",xlim=c(min(akse1)-0.01,max(akse1)+0.01),ylim=c(min(akse3)-0.01,max(akse3)+0.01),xaxp=c(-0.5,1,3),yaxp=c(-0.5,0.5,2),type="n") #Grunnlag for plotting av symboler etc.
lines(c(-2,2),c(0,0),lty=2,col=8)
lines(c(0,0),c(-2,2),lty=2,col=8)

os <- ordisurf(ordx[,c(1,3)],Steep_a,display="sites",levels=c(0,0.2,0.4,0.6,0.8), col="red",add=T) #inkluderer plotting p? eksisterende ordinasjonsdiagram
lines(c(-0.525,-0.495),c(0.51,0.51),col=2)
text(-0.48,0.51,"Steep_a",adj=0,cex=0.8)

#Punkter ulike farger og symboler for ulike dalnedskj?ringstrinn-trinn (DN-klasser 1-4)
points(akse1[DN==1],akse3[DN==1],pch=16,cex=0.6,col="lightblue2")
points(akse1[DN==2],akse3[DN==2],pch=16,cex=0.6,col="lightblue4")
points(akse1[DN==3],akse3[DN==3],pch=16,cex=0.75,col="darkblue")
points(akse1[DN==4],akse3[DN==4],pch=16,cex=0.75,col="red")
points(-0.51,0.475,pch=16,cex=0.6,col="lightblue2")
text(-0.48,0.475,"DN = 1",adj=0,cex=0.8)
points(-0.51,0.445,pch=16,cex=0.6,col="lightblue4")
text(-0.48,0.445,"DN = 2",adj=0,cex=0.8)
points(-0.51,0.415,pch=16,cex=0.75,col="darkblue")
text(-0.48,0.415,"DN = 3",adj=0,cex=0.8)
points(-0.51,0.385,pch=16,cex=0.75,col="red")
text(-0.48,0.385,"DN = 4",adj=0,cex=0.8)

##For Oyst_i

par(plt=c(0.15, 0.95, 0.15, z2))
plot(akse1,akse3,xlab="GNMDS 1 Fjord (KF353)",ylab="GNMDS 3 Fjord (KF353)",xlim=c(min(akse1)-0.01,max(akse1)+0.01),ylim=c(min(akse3)-0.01,max(akse3)+0.01),xaxp=c(-0.5,1,3),yaxp=c(-0.5,0.5,2),type="n") #Grunnlag for plotting av symboler etc.
lines(c(-2,2),c(0,0),lty=2,col=8)
lines(c(0,0),c(-2,2),lty=2,col=8)

os <- ordisurf(ordx[,c(1,3)],Oyst_i,display="sites",levels=c(0.19,0.454,0.574,0.643,0.693,0.733,0.768,0.798), col="red",add=T) #inkluderer plotting p? eksisterende ordinasjonsdiagram
lines(c(-0.525,-0.495),c(0.51,0.51),col=2)
text(-0.48,0.51,"Invers ?yst?rrelse (Oyst_i)",adj=0,cex=0.8)

#Punkter ulike farger og symboler for ulike (nye) skj?rg?rdspreg-trinn (SN-klasser 1-4)

points(akse1[SN==1],akse3[SN==1],pch=16,cex=0.5,col=1)
points(akse1[SN==2],akse3[SN==2],pch=16,cex=0.6,col="lightblue2")
points(akse1[SN==3],akse3[SN==3],pch=16,cex=0.75,col="darkblue")
points(akse1[SN==4],akse3[SN==4],pch=1,cex=0.75,col="red")
points(akse1[SN==5],akse3[SN==5],pch=16,cex=0.9,col="red")
points(-0.51,0.475,pch=16,cex=0.5,col="black")
text(-0.48,0.475,"SN = 1 (mainland)",adj=0,cex=0.8)
points(-0.51,0.445,pch=16,cex=0.6,col="lightblue2")
text(-0.48,0.445,"SN = 2",adj=0,cex=0.8)
points(-0.51,0.415,pch=16,cex=0.75,col="darkblue")
text(-0.48,0.415,"SN = 3",adj=0,cex=0.8)
points(-0.51,0.385,pch=1,cex=0.75,col="red")
text(-0.48,0.385,"SN = 4",adj=0,cex=0.8)
points(-0.51,0.355,pch=16,cex=0.9,col="red")
text(-0.48,0.355,"SN = 5",adj=0,cex=0.8)

#############################################################################################
#### Tallfesting av KLG-kandidatenes relative viktighet ved variasjonsoppdelingsanalyse ####
#############################################################################################

#Datasett: av

#Bestemmer total variasjon

vo0 <- rda(av~+1,scale=T)  #scale = T gj?r at dataene blir sentrert og standardisert ved deling med SD
vo0

voG1a <- rda(av~RR1,scale=T)
voG1a
tvoG1a <- permutest(voG1a,permutations=9999)
tvoG1a
voG1b <- rda(av~Crug9_m,scale=T)
voG1b
tvoG1b <- permutest(voG1b,permutations=9999)
tvoG1b
voG1c <- rda(av~Rug3_m,scale=T)
voG1c
tvoG1c <- permutest(voG1c,permutations=9999)
tvoG1c
voG1d <- rda(av~Cr3_u_a,scale=T)
voG1d
tvoG1d <- permutest(voG1d,permutations=9999)
tvoG1d
voG1e <- rda(av~Flat_a,scale=T)
voG1e
tvoG1e <- permutest(voG1e,permutations=9999)
tvoG1e
voG1f <- rda(av~Tpi1l_a,scale=T)
voG1f
tvoG1f <- permutest(voG1f,permutations=9999)
tvoG1f
voG1g <- rda(av~Guro_t_a,scale=T)
voG1g
tvoG1g <- permutest(voG1g,permutations=9999)
tvoG1g
voG1h <- rda(av~Cre_f_a,scale=T)
voG1h
tvoG1h <- permutest(voG1h,permutations=9999)
tvoG1h
voG1i <- rda(av~Cre_b_a,scale=T)
voG1i
tvoG1i <- permutest(voG1i,permutations=9999)
tvoG1i
voG1j <- rda(av~Tpi1h_a,scale=T)
voG1j
tvoG1j <- permutest(voG1j,permutations=9999)
tvoG1j
voG1k <- rda(av~Steep_a,scale=T)
voG1k
tvoG1k <- permutest(voG1k,permutations=9999)
tvoG1k
voG1l <- rda(av~Crug3_m,scale=T)
voG1l
tvoG1l <- permutest(voG1l,permutations=9999)
tvoG1l

voG1ca <- rda(av~RR1+Condition(Rug3_m),scale=T)
voG1ca
tvoG1ca <- permutest(voG1ca,permutations=9999)
tvoG1ca
voG1cb <- rda(av~Crug9_m+Condition(Rug3_m),scale=T)
voG1cb
tvoG1cb <- permutest(voG1cb,permutations=9999)
tvoG1cb
voG1cd <- rda(av~Cr3_u_a+Condition(Rug3_m),scale=T)
voG1cd
tvoG1cd <- permutest(voG1cd,permutations=9999)
tvoG1cd
voG1ce <- rda(av~Flat_a+Condition(Rug3_m),scale=T)
voG1ce
tvoG1ce <- permutest(voG1ce,permutations=9999)
tvoG1ce
voG1cf <- rda(av~Tpi1l_a+Condition(Rug3_m),scale=T)
voG1cf
tvoG1cf <- permutest(voG1cf,permutations=9999)
tvoG1cf
voG1cg <- rda(av~Guro_t_a+Condition(Rug3_m),scale=T)
voG1cg
tvoG1cg <- permutest(voG1cg,permutations=9999)
tvoG1cg
voG1ch <- rda(av~Cre_f_a+Condition(Rug3_m),scale=T)
voG1ch
tvoG1ch <- permutest(voG1ch,permutations=9999)
tvoG1ch
voG1ci <- rda(av~Cre_b_a+Condition(Rug3_m),scale=T)
voG1ci
tvoG1ci <- permutest(voG1ci,permutations=9999)
tvoG1ci
voG1cj <- rda(av~Tpi1h_a+Condition(Rug3_m),scale=T)
voG1cj
tvoG1cj <- permutest(voG1cj,permutatioks=9999)
tvoG1cj
voG1ck <- rda(av~Steep_a+Condition(Rug3_m),scale=T)
voG1ck
tvoG1ck <- permutest(voG1ck,permutations=9999)
tvoG1ck
voG1cl <- rda(av~Crug3_m+Condition(Rug3_m),scale=T)
voG1cl
tvoG1cl <- permutest(voG1cl,permutations=9999)
tvoG1cl

voG1cja <- rda(av~RR1+Condition(Rug3_m+Tpi1h_a),scale=T)
voG1cja
tvoG1cja <- permutest(voG1cja,permutations=9999)
tvoG1cja
voG1cjb <- rda(av~Crug9_m+Condition(Rug3_m+Tpi1h_a),scale=T)
voG1cjb
tvoG1cjb <- permutest(voG1cjb,permutations=9999)
tvoG1cjb
voG1cjd <- rda(av~Cr3_u_a+Condition(Rug3_m+Tpi1h_a),scale=T)
voG1cjd
tvoG1cjd <- permutest(voG1cjd,permutations=9999)
tvoG1cjd
voG1cje <- rda(av~Flat_a+Condition(Rug3_m+Tpi1h_a),scale=T)
voG1cje
tvoG1cje <- permutest(voG1cje,permutations=9999)
tvoG1cje
voG1cjf <- rda(av~Tpi1l_a+Condition(Rug3_m+Tpi1h_a),scale=T)
voG1cjf
tvoG1cjf <- permutest(voG1cjf,permutations=9999)
tvoG1cjf
voG1cjg <- rda(av~Guro_t_a+Condition(Rug3_m+Tpi1h_a),scale=T)
voG1cjg
tvoG1cjg <- permutest(voG1cjg,permutations=9999)
tvoG1cjg
voG1cjh <- rda(av~Cre_f_a+Condition(Rug3_m+Tpi1h_a),scale=T)
voG1cjh
tvoG1cjh <- permutest(voG1cjh,permutations=9999)
tvoG1cjh
voG1cji <- rda(av~Cre_b_a+Condition(Rug3_m+Tpi1h_a),scale=T)
voG1cji
tvoG1cji <- permutest(voG1cji,permutations=9999)
tvoG1cji
voG1cjl <- rda(av~Crug3_m+Condition(Rug3_m+Tpi1h_a),scale=T)
voG1cjl
tvoG1cjl <- permutest(voG1cjl,permutations=9999)
tvoG1cjl

voG1cjhf <- rda(av~Tpi1l_a+Condition(Rug3_m+Tpi1h_a+Cre_f_a),scale=T)
voG1cjhf
tvoG1cjhf <- permutest(voG1cjhf,permutations=9999)
tvoG1cjhf
voG1cjhk <- rda(av~Crug3_m+Condition(Rug3_m+Tpi1h_a+Cre_f_a),scale=T)
voG1cjhk
tvoG1cjhk <- permutest(voG1cjhk,permutations=99)
tvoG1cjhk

voG2a <- rda(av~Oyst_i,scale=T)
voG2a
tvoG2a <- permutest(voG2a,permutations=9999)
tvoG2a
voG2b <- rda(av~Land_a,scale=T)
voG2b
tvoG2b <- permutest(voG2b,permutations=9999)
tvoG2b
voG2c <- rda(av~R_net_a,scale=T)
voG2c
tvoG2c <- permutest(voG2c,permutations=9999)
tvoG2c
voG2d <- rda(av~Kbf_a,scale=T)
voG2d
tvoG2d <- permutest(voG2d,permutations=9999)
tvoG2d
voG2e <- rda(av~Ekspve_a,scale=T)
voG2e
tvoG2e <- permutest(voG2e,permutations=9999)
tvoG2e
voG2f <- rda(av~Stromn_a,scale=T)
voG2f
tvoG2f <- permutest(voG2f,permutations=9999)
tvoG2f

voG2ca <- rda(av~Oyst_i+Condition(R_net_a),scale=T)
voG2ca
tvoG2ca <- permutest(voG2ca,permutations=99)
tvoG2ca
voG2cb <- rda(av~Land_a+Condition(R_net_a),scale=T)
voG2cb
tvoG2cb <- permutest(voG2cb,permutations=99)
tvoG2cb
voG2cd <- rda(av~Kbf_a+Condition(R_net_a),scale=T)
voG2cd
tvoG2cd <- permutest(voG2cd,permutations=99)
tvoG2cd
voG2ce <- rda(av~Ekspve_a+Condition(R_net_a),scale=T)
voG2ce
tvoG2ce <- permutest(voG2ce,permutations=99)
tvoG2ce
voG2cf <- rda(av~Stromn_a+Condition(R_net_a),scale=T)
voG2cf
tvoG2cf <- permutest(voG2cf,permutations=99)
tvoG2cf

voG2cea <- rda(av~Oyst_i+Condition(R_net_a+Ekspve_a),scale=T)
voG2cea
tvoG2cea <- permutest(voG2cea,permutations=99)
tvoG2cea
voG2ced <- rda(av~Kbf_a+Condition(R_net_a+Ekspve_a),scale=T)
voG2ced
tvoG2ced <- permutest(voG2ced,permutations=99)
tvoG2ced
voG2cef <- rda(av~Stromn_a+Condition(R_net_a+Ekspve_a),scale=T)
voG2cef
tvoG2cef <- permutest(voG2cef,permutations=99)
tvoG2cef

voG2cead <- rda(av~Kbf_a+Condition(R_net_a+Ekspve_a+Oyst_i),scale=T)
voG2cead
tvoG2cead <- permutest(voG2cead,permutations=99)
tvoG2cead
voG2ceaf <- rda(av~Stromn_a+Condition(R_net_a+Ekspve_a+Oyst_i),scale=T)
voG2ceaf
tvoG2ceaf <- permutest(voG2ceaf,permutations=99)
tvoG2ceaf

voG3a <- rda(av~Inns_s,scale=T)
voG3a
tvoG3a <- permutest(voG3a,permutations=9999)
tvoG3a
voG3b <- rda(av~II,scale=T)
voG3b
tvoG3b <- permutest(voG3b,permutations=9999)
tvoG3b
voG3c <- rda(av~Dislake,scale=T)
voG3c
tvoG3c <- permutest(voG3c,permutations=9999)
tvoG3c
voG3d <- rda(av~MI,scale=T)
voG3d
tvoG3d <- permutest(voG3d,permutations=9999)
tvoG3d
voG3e <- rda(av~Dismire,scale=T)
voG3e
tvoG3e <- permutest(voG3e,permutations=9999)
tvoG3e

voG3ea <- rda(av~Inns_s+Condition(Dismire),scale=T)
voG3ea
tvoG3ea <- permutest(voG3ea,permutations=99)
tvoG3ea
voG3eb <- rda(av~II+Condition(Dismire),scale=T)
voG3eb
tvoG3eb <- permutest(voG3eb,permutations=99)
tvoG3eb
voG3ec <- rda(av~Dislake+Condition(Dismire),scale=T)
voG3ec
tvoG3ec <- permutest(voG3ec,permutations=99)
tvoG3ec
voG3ed <- rda(av~MI+Condition(Dismire),scale=T)
voG3ed
tvoG3ed <- permutest(voG3ed,permutations=99)
tvoG3ed

voG3eac <- rda(av~Dislake+Condition(Dismire+Inns_s),scale=T)
voG3eac
tvoG3eac <- permutest(voG3eac,permutations=99)
tvoG3eac

voG4a <- rda(av~C_kk_a,scale=T)
voG4a
tvoG4a <- permutest(voG4a,permutations=99)
tvoG4a
voG4b <- rda(av~Ccom_m,scale=T)
voG4b
tvoG4b <- permutest(voG4b,permutations=99)
tvoG4b
voG4c <- rda(av~Maro_s,scale=T)
voG4c
tvoG4c <- permutest(voG4c,permutations=99)
tvoG4c
voG4d <- rda(av~Bplu_a,scale=T)
voG4d
tvoG4d <- permutest(voG4d,permutations=99)
tvoG4d
voG4e <- rda(av~Kmar_a,scale=T)
voG4e
tvoG4e <- permutest(voG4e,permutations=99)
tvoG4e

voG4ba <- rda(av~C_kk_a+Condition(Ccom_m),scale=T)
voG4ba
tvoG4ba <- permutest(voG4ba,permutations=99)
tvoG4ba
voG4bc <- rda(av~Maro_s+Condition(Ccom_m),scale=T)
voG4bc
tvoG4bc <- permutest(voG4bc,permutations=99)
tvoG4bc
voG4bd <- rda(av~Bplu_a+Condition(Ccom_m),scale=T)
voG4bd
tvoG4bd <- permutest(voG4bd,permutations=99)
tvoG4bd
voG4be <- rda(av~Kmar_a+Condition(Ccom_m),scale=T)
voG4be
tvoG4be <- permutest(voG4be,permutations=99)
tvoG4be

voG4bca <- rda(av~C_kk_a+Condition(Ccom_m+Maro_s),scale=T)
voG4bca
tvoG4bca <- permutest(voG4bca,permutations=99)
tvoG4bca
voG4bcd <- rda(av~Bplu_a+Condition(Ccom_m+Maro_s),scale=T)
voG4bcd
tvoG4bcd <- permutest(voG4bcd,permutations=99)
tvoG4bcd

voG5 <- rda(av~JK1,scale=T)
voG5
tvoG5 <- permutest(voG5,permutations=99)
tvoG5

voG6 <- rda(av~JK2,scale=T)
voG6
tvoG6 <- permutest(voG6,permutations=99)
tvoG6

voG7a <- rda(av~Kbf_a,scale=T)
voG7a
tvoG7a <- permutest(voG7a,permutations=99)
tvoG7a
voG7b <- rda(av~Kmar_a,scale=T)
voG7b
tvoG7b <- permutest(voG7b,permutations=99)
tvoG7b
voG7ba <- rda(av~Kbf_a+Condition(Kmar_a),scale=T)
voG7ba
tvoG7ba <- permutest(voG7ba,permutations=99)
tvoG7ba

voU1a <- rda(av~Arlov_a,scale=T)
voU1a
tvoU1a <- permutest(voU1a,permutations=99)
tvoU1a
voU1b <- rda(av~Arbar_a,scale=T)
voU1b
tvoU1b <- permutest(voU1b,permutations=99)
tvoU1b
voU1c <- rda(av~Arbla_a,scale=T)
voU1c
tvoU1c <- permutest(voU1c,permutations=99)
tvoU1c

voU1ab <- rda(av~Arbar_a+Condition(Arlov_a),scale=T)
voU1ab
tvoU1ab <- permutest(voU1ab,permutations=99)
tvoU1ab
voU1ac <- rda(av~Arbla_a+Condition(Arlov_a),scale=T)
voU1ac
tvoU1ac <- permutest(voU1ac,permutations=99)
tvoU1ac

voU1acb <- rda(av~Arbar_a+Condition(Arlov_a+Arbla_a),scale=T)
voU1acb
tvoU1acb <- permutest(voU1acb,permutations=99)
tvoU1acb


voU2a <- rda(av~Sn_torr,scale=T)
voU2a
tvoU2a <- permutest(voU2a,permutations=99)
tvoU2a
voU2b <- rda(av~Sn_frisk,scale=T)
voU2b
tvoU2b <- permutest(voU2b,permutations=99)
tvoU2b
voU2c <- rda(av~Sn_flekk,scale=T)
voU2c
tvoU2c <- permutest(voU2c,permutations=99)
tvoU2c
voU2d <- rda(av~Bohei_a,scale=T)
voU2d
tvoU2d <- permutest(voU2d,permutations=99)
tvoU2d
voU2e <- rda(av~Araaf_a,scale=T)
voU2e
tvoU2e <- permutest(voU2e,permutations=99)
tvoU2e

voU2da <- rda(av~Sn_torr+Condition(Bohei_a),scale=T)
voU2da
tvoU2da <- permutest(voU2da,permutations=99)
tvoU2da
voU2db <- rda(av~Sn_frisk+Condition(Bohei_a),scale=T)
voU2db
tvoU2db <- permutest(voU2db,permutations=99)
tvoU2db
voU2dc <- rda(av~Sn_flekk+Condition(Bohei_a),scale=T)
voU2dc
tvoU2dc <- permutest(voU2dc,permutations=99)
tvoU2dc
voU2de <- rda(av~Araaf_a+Condition(Bohei_a),scale=T)
voU2de
tvoU2de <- permutest(voU2de,permutations=99)
tvoU2de

voU2dca <- rda(av~Sn_torr+Condition(Bohei_a+Sn_flekk),scale=T)
voU2dca
tvoU2dca <- permutest(voU2dca,permutations=99)
tvoU2dca
voU2dcb <- rda(av~Sn_frisk+Condition(Bohei_a+Sn_flekk),scale=T)
voU2dcb
tvoU2dcb <- permutest(voU2dcb,permutations=99)
tvoU2dcb
voU2dce <- rda(av~Araaf_a+Condition(Bohei_a+Sn_flekk),scale=T)
voU2dce
tvoU2dce <- permutest(voU2dce,permutations=99)
tvoU2dce


voA1a <- rda(av~IfI,scale=T)
voA1a
tvoA1a <- permutest(voA1a,permutations=9999)
tvoA1a
voA1b <- rda(av~Gab_a,scale=T)
voA1b
tvoA1b <- permutest(voA1b,permutations=9999)
tvoA1b
voA1c <- rda(av~Lled_a,scale=T)
voA1c
tvoA1c <- permutest(voA1c,permutations=9999)
tvoA1c
voA1d <- rda(av~Vei_b_a,scale=T)
voA1d
tvoA1d <- permutest(voA1d,permutations=9999)
tvoA1d
voA1e <- rda(av~Sefr_a,scale=T)
voA1e
tvoA1e <- permutest(voA1e,permutations=9999)
tvoA1e
voA1f <- rda(av~Cul_a_s,scale=T)
voA1f
tvoA1f <- permutest(voA1f,permutations=9999)
tvoA1f
voA1g <- rda(av~Abygg_a,scale=T)
voA1g
tvoA1g <- permutest(voA1g,permutations=9999)
tvoA1g
voA1h <- rda(av~Gab_nae,scale=T)
voA1h
tvoA1h <- permutest(voA1h,permutations=99)
tvoA1h

voA1ba <- rda(av~IfI+Condition(Gab_a),scale=T)
voA1ba
tvoA1ba <- permutest(voA1ba,permutations=9999)
tvoA1ba
voA1bc <- rda(av~Lled_a+Condition(Gab_a),scale=T)
voA1bc
tvoA1bc <- permutest(voA1bc,permutations=9999)
tvoA1bc
voA1bd <- rda(av~Vei_b_a+Condition(Gab_a),scale=T)
voA1bd
tvoA1bd <- permutest(voA1bd,permutations=9999)
tvoA1bd
voA1be <- rda(av~Sefr_a+Condition(Gab_a),scale=T)
voA1be
tvoA1be <- permutest(voA1be,permutations=9999)
tvoA1be
voA1bf <- rda(av~Cul_a_s+Condition(Gab_a),scale=T)
voA1bf
tvoA1bf <- permutest(voA1bf,permutations=9999)
tvoA1bf
voA1bg <- rda(av~Abygg_a+Condition(Gab_a),scale=T)
voA1bg
tvoA1bg <- permutest(voA1bg,permutations=9999)
tvoA1bg
voA1bh <- rda(av~Gab_nae+Condition(Gab_a),scale=T)
voA1bh
tvoA1bh <- permutest(voA1bh,permutations=9999)
tvoA1bh

voA1bag <- rda(av~Abygg_a+Condition(Gab_a+IfI),scale=T)
voA1bag
tvoA1bag <- permutest(voA1bag,permutations=9999)
tvoA1bag
voA1bah <- rda(av~Gab_nae+Condition(Gab_a+IfI),scale=T)
voA1bah
tvoA1bah <- permutest(voA1bah,permutations=9999)
tvoA1bah

voA2a <- rda(av~Arfull_a,scale=T)
voA2a
tvoA2a <- permutest(voA2a,permutations=99)
tvoA2a
voA2b <- rda(av~JI,scale=T)
voA2b
tvoA2b <- permutest(voA2c,permutations=99)
tvoA2b
voA2c <- rda(av~Arover_a,scale=T)
voA2c
tvoA2c <- permutest(voA2c,permutations=99)
tvoA2c

voA2ab <- rda(av~JI+Condition(Arfull_a),scale=T)
voA2ab
tvoA2ab <- permutest(voA2ab,permutations=99)
tvoA2ab
voA2ac <- rda(av~Arover_a+Condition(Arfull_a),scale=T)
voA2ac
tvoA2ac <- permutest(voA2ac,permutations=99)
tvoA2ac

voG2G1 <- rda(av~Rug3_m+Tpi1h_a+Condition(R_net_a+Ekspve_a+Oyst_i),scale=T)
voG2G1
tvoG2G1 <- permutest(voG2G1,permutations=99)
tvoG2G1
voG2G3 <- rda(av~Dismire+Inns_s+Dislake+Condition(R_net_a+Ekspve_a+Oyst_i),scale=T)
voG2G3
tvoG2G3 <- permutest(voG2G3,permutations=99)
tvoG2G3
voG2G4 <- rda(av~Ccom_m + Maro_s+Condition(R_net_a+Ekspve_a+Oyst_i),scale=T)
voG2G4
tvoG2G4 <- permutest(voG2G4,permutations=99)
tvoG2G4
voG2G5 <- rda(av~Kbf_a+Kmar_a+Condition(R_net_a+Ekspve_a+Oyst_i),scale=T)
voG2G5
tvoG2G5 <- permutest(voG2G5,permutations=99)
tvoG2G5

voG2G1G3 <- rda(av~Dismire+Inns_s + Dislake+Condition(R_net_a+Ekspve_a+Oyst_i+Rug3_m+Tpi1h_a),scale=T)
voG2G1G3
tvoG2G1G3 <- permutest(voG2G1G3,permutations=99)
tvoG2G1G3
voG2G1G4 <- rda(av~Ccom_m + Maro_s+Condition(R_net_a+Ekspve_a+Oyst_i+Rug3_m+Tpi1h_a),scale=T)
voG2G1G4
tvoG2G1G4 <- permutest(voG2G1G4,permutations=99)
tvoG2G1G4

voG2G1G3G4 <- rda(av~Ccom_m + Maro_s+Condition(R_net_a+Ekspve_a+Oyst_i+Rug3_m+Tpi1h_a+Dismire+Inns_s + Dislake),scale=T)
voG2G1G3G4
tvoG2G1G3G4 <- permutest(voG2G1G3G4,permutations=99)
tvoG2G1G3G4

voGU1 <- rda(av~Arlov_a+Arbla_a+Condition(R_net_a+Ekspve_a+Oyst_i+Rug3_m+Tpi1h_a+Dismire+Inns_s + Dislake),scale=T)
voGU1
tvoGU1 <- permutest(voGU1,permutations=99)
tvoGU1
voGU2 <- rda(av~Bohei_a+Sn_flekk+Condition(R_net_a+Ekspve_a+Oyst_i+Rug3_m+Tpi1h_a+Dismire+Inns_s + Dislake),scale=T)
voGU2
tvoGU2 <- permutest(voGU2,permutations=99)
tvoGU2

voGU1U2 <- rda(av~Bohei_a+Sn_flekk+Condition(Arlov_a+Arbla_a+R_net_a+Ekspve_a+Oyst_i+Rug3_m+Tpi1h_a+Dismire+Inns_s + Dislake),scale=T)
voGU1U2
tvoGU1U2 <- permutest(voGU1U2,permutations=99)
tvoGU1U2


voGUA1 <- rda(av~IfI+Gab_a+Condition(Arlov_a+Arbla_a+R_net_a+Ekspve_a+Oyst_i+Rug3_m+Tpi1h_a+Dismire+Inns_s + Dislake),scale=T)
voGUA1
tvoGUA1 <- permutest(voGUA1,permutations=99)
tvoGUA1
voGUA2 <- rda(av~Arfull_a+Arover_a+Condition(Arlov_a+Arbla_a+R_net_a+Ekspve_a+Oyst_i+Rug3_m+Tpi1h_a+Dismire+Inns_s + Dislake),scale=T)
voGUA2
tvoGUA2 <- permutest(voGUA2,permutations=99)
tvoGUA2


####################################################################
#### Finner prim?rn?kkelvariabler for identifiserte KLG ved RDA ####
####################################################################

#Skript for ? finne ortogonale prim?rn?kkelvariabler (rONV'er) i ei n?kkelvariabelgruppe

#Om n?dvendig: importerer relevante rPNV'er

#dta_pnv <- read-table("clipboard",header=T)
#attach(dta_pnv)

#VE for 1 .akse i RDA'er gir VA(PNV)

RDA_IYK <- rda(av~R_net_a+Ekspve_a  + Oyst_i,scale=T)
RDA_RE <- rda(av~Rug3_m + Tpi1h_a,scale=T)
RDA_VP <- rda(av~Dismire+Inns_s + Dislake,scale=T)
RDA_SkP <- rda(av~Arlov_a + Arbla_a,scale=T)
RDA_OI <- rda(av~IfI+Gab_a,scale=T)

#EV for RDA 1 gir VE for PNV

summary(RDA_IYK)$cont
summary(RDA_RE)$cont
summary(RDA_VP)$cont
summary(RDA_SkP)$cont
summary(RDA_OI)$cont

#Finner oPNV'er

oRDA_IYK <- rda(av~R_net_a+Ekspve_a  + Oyst_i,scale=T)
oRDA_RE <- rda(av~Rug3_m + Tpi1h_a+Condition(R_net_a+Ekspve_a  + Oyst_i),scale=T)
oRDA_VP <- rda(av~Dismire+Inns_s + Dislake+Condition(R_net_a+Ekspve_a  + Oyst_i +Rug3_m + Tpi1h_a),scale=T)
oRDA_SkP <- rda(av~Arlov_a + Arbla_a+Condition(Dismire+Inns_s + Dislake+R_net_a+Ekspve_a  + Oyst_i +Rug3_m + Tpi1h_a),scale=T)
oRDA_OI <- rda(av~IfI+Gab_a+Condition(Arlov_a + Arbla_a+Dismire+Inns_s + Dislake+R_net_a+Ekspve_a  + Oyst_i + Rug3_m + Tpi1h_a),scale=T)

summary(oRDA_IYK)$cont  #gir egenverdien for RDA-akse 1
summary(oRDA_RE)$cont
summary(oRDA_VP)$cont
summary(oRDA_SkP)$cont
summary(oRDA_OI)$cont

#Ekstraksjon av ONV; dette er vektorer
ONV_IYK <- scores(oRDA_IYK, display="lc", choices=1, scaling=1)
ONV_RE <- -scores(oRDA_RE, display="lc", choices=1, scaling=1)
ONV_VP <- scores(oRDA_VP, display="lc", choices=1, scaling=1)
ONV_SkP <- scores(oRDA_SkP, display="lc", choices=1, scaling=1)
ONV_OI <- -scores(oRDA_OI, display="lc", choices=1, scaling=1)



#Sjekker om rONV'en har samme fortegn som variablen(e) som karakteriserer den, og gj?r om n?dvendig ny ekstraksjon av sk?rer med motsatt fortegn
cor.test(ONV_IYK,Lled_a,method="k")
cor.test(ONV_RE,RR1,method="k")
cor.test(ONV_VP,Inns_s,method="k")
cor.test(ONV_SkP,Arlov_a,method="k")
cor.test(ONV_OI,IfIu,method="k")

#Rangerer ONV'ene

rONV_IYK <- (ONV_IYK-min(ONV_IYK))/(max(ONV_IYK)-min(ONV_IYK))
rONV_RE <- (ONV_RE-min(ONV_RE))/(max(ONV_RE)-min(ONV_RE))
rONV_VP <- (ONV_VP-min(ONV_VP))/(max(ONV_VP)-min(ONV_VP))
rONV_SkP <- (ONV_SkP-min(ONV_SkP))/(max(ONV_SkP)-min(ONV_SkP))
rONV_OI <- (ONV_OI-min(ONV_OI))/(max(ONV_OI)-min(ONV_OI))

#Eksporterer rONV-sk?rer til Excel

writeClipboard(as.character(rONV_IYK))
writeClipboard(as.character(rONV_RE))
writeClipboard(as.character(rONV_VP))
writeClipboard(as.character(rONV_SkP))
writeClipboard(as.character(rONV_OI))

##########################################################
#### Beregning av LA mellom KLG-klasser ved bruk av PD####
##########################################################

#Importerer om n?dvendig rPNVer fra Excel:

#rPNV <- read.table("clipboard",header=T)
#attach(rPNV)
#names(rPNV)

#Analyse av KLG'er representert ved rangerte n?kkelvariabler

rPNV <- rONV_IYK

#Inspeksjon av OE'enes frekvensfordeling langs rPNV'en
hist(rPNV)

#Importerer landskapsegenskapsprofiler fra regneark

### DENNE FUNKER IKKE ###lep <- read.table("clipboard",header=F)
### DENNE FUNKER IKKE ###attach(lep)
### DENNE FUNKER IKKE ###names(lep)

### DENNE FUNKER IKKE ###dim(lep)

#Beregner artsulikhet (PD)

### DENNE FUNKER IKKE ###dist <- vegdist(lep,method="bray") 
### DENNE FUNKER IKKE ###dist

### DENNE FUNKER IKKE ####PD-verdiene er s? lave at det ikke er noe behov for ? bruke geodetisk avstand

### DENNE FUNKER IKKE ####Eksporterer til Excel

### DENNE FUNKER IKKE ###writeClipboard(as.character(dist)) #M? importeres som 'character' (jf. Crawley 2007: 77)

### DENNE FUNKER IKKE ####Importerer IA-estimater fra NiN2LAD5/OI-PD2

### DENNE FUNKER IKKE ###IAest.df <- read.table("clipboard",header=T)
### DENNE FUNKER IKKE ###attach(IAest.df)
### DENNE FUNKER IKKE ###names(IAest.df)

### DENNE FUNKER IKKE ###hist(IAest)

### DENNE FUNKER IKKE ###mean(IAest)
### DENNE FUNKER IKKE ###sd(IAest)


####################################################################
#### Finner prim?rn?kkelvariabler for identifiserte KLG ved RDA ####
####################################################################

#Skript for ? finne ortogonale prim?rn?kkelvariabler (rONV'er) i ei n?kkelvariabelgruppe

#Om n?dvendig: importerer relevante rPNV'er

#dta_pnv <- read-table("clipboard",header=T)
#attach(dta_pnv)

#VE for 1 .akse i RDA'er gir VA(PNV)

RDA_RE <- rda(av~RR1+Rug3_m+Tpi1h_a,scale=T) #er lik PNV, for den f?rst utvalgte gruppa
RDA_SkP <- rda(av~Arbar_a + Sn_imp,scale=T)
RDA_OI <- rda(av~IfIu+Gab_a,scale=T)
#EV for RDA 1 gir VE for PNV
RDA_RE
RDA_SkP
RDA_OI

oRDA_RE <- rda(av~RR1+Rug3_m+Tpi1h_a,scale=T) #er lik PNV, for den f?rst utvalgte gruppa
oRDA_SkP <- rda(av~Arbar_a + Sn_imp+Condition(RR1+Rug3_m+Tpi1h_a),scale=T)
oRDA_OI <- rda(av~IfIu+Gab_a+Condition(Arbar_a + Sn_imp+RR1+Rug3_m+Tpi1h_a),scale=T)

summary(oRDA_RE)$cont
summary(oRDA_SkP)$cont #gir aksenes egenverdier
summary(oRDA_OI)$cont


#Ekstraksjon av ONV; dette er vektorer
ONV_RE <- scores(oRDA_RE, display="lc", choices=1, scaling=1)
ONV_SkP <- -scores(oRDA_SkP, display="lc", choices=1, scaling=1)
ONV_OI <- -scores(oRDA_OI, display="lc", choices=1, scaling=1)

#Sjekker om rONV'en har samme fortegn som variablen(e) som karakteriserer den, og gjlrb om n?dvendig ny ekstraksjon av sk?rer med motsatt fortegn
cor.test(ONV_RE,Rr1_m,method="k")
cor.test(ONV_SkP,Arbar_a,method="k")
cor.test(ONV_OI,IfIu,method="k")

#Eksporterer evt sk?rer langs ONV'ene til Excel
writeClipboard(as.character(ONV_RE))
writeClipboard(as.character(ONV_SkP))
writeClipboard(as.character(ONV_OI)) 

#Rangerer ONV'ene

rONV_RE <- (ONV_RE-min(ONV_RE))/(max(ONV_RE)-min(ONV_RE)) #Tar vare p? de korrigerte prim?rn?kkelvariablene
rONV_SkP <- (ONV_SkP-min(ONV_SkP))/(max(ONV_SkP)-min(ONV_SkP))
rONV_OI <- (ONV_OI-min(ONV_OI))/(max(ONV_OI)-min(ONV_OI))

#Eksporterer rONV-sk?rer til Excel

writeClipboard(as.character(rONV_RE))
writeClipboard(as.character(rONV_SkP))
writeClipboard(as.character(rONV_OI))

##########################################################
#### Beregning av LA mellom KLG-klasser ved bruk av PD####
##########################################################

#Importerer om n?dvendig rPNVer fra Excel:

#rPNV <- read.table("clipboard",header=T)
#attach(rPNV)
#names(rPNV)

#Analyse av KLG'er representert ved rangerte n?kkelvariabler

rONV <- rONV_OI

#Inspeksjon av OE'enes frekvensfordeling langs rPNV'en
hist(rONV)


#Importerer landskapsegenskapsprofiler fra regneark
### DENNE FUNKER IKKE ### 
### DENNE FUNKER IKKE ### lep <- read.table("clipboard",header=F)
### DENNE FUNKER IKKE ###lep <- as.numeric(lep)
### DENNE FUNKER IKKE ###attach(lep)
### DENNE FUNKER IKKE ###names(lep)

### DENNE FUNKER IKKE ###dim(lep)

### DENNE FUNKER IKKE ####Beregner artsulikhet (PD)

### DENNE FUNKER IKKE ###dist <- vegdist(lep,method="bray") 
### DENNE FUNKER IKKE ###dist

### DENNE FUNKER IKKE ####PD-verdiene er s? lave at det ikke er noe behov for ? bruke geodetisk avstand

### DENNE FUNKER IKKE ####Eksporterer til Excel

### DENNE FUNKER IKKE ###writeClipboard(as.character(dist)) #M? importeres som 'character' (jf. Crawley 2007: 77)

### DENNE FUNKER IKKE ###cor.test(IfIu,rONV_AP)

### DENNE FUNKER IKKE ### SLUTT ###

###################################################################
#### Analyser av samvariasjon mellom reskalerte rONV'er (sONV) ####
###################################################################

#Fig. 1. 1 IyK mot 2 RE; SN som symboler og isolinjer for Oyst_i

#sONV'er som skal plottes mot hverandre
s1 <- sONV_IyK
s2 <- sONV_RE

#Finner koordinatene for hj?rner i det 'plotteomr?det' med koordinater (x1, x2, y1, y2) som gir
#like enheter p? begge akser. Vi holder x1, x2 og y1 faste og bestemmer y2 slik at (x2-x1)/(y2-y1) i plt=c(x1,x2,y1,y2)
#blir lik max(s1)/max(s2)
#Det krever at y2 = [(x2-x1)*max(s2) + y1*max(s1)]/max(s1) 
#Setter vi x1, x2 og y1 konstante, f?r vi:
y2 <- (0.8*max(s2)+0.15*max(s1))/max(s1)
y2

#Plotter SN-klasser p? figuren, og legger p? isolinjer for Oyst_i
par(plt=c(0.15, 0.95, 0.15, y2))
plot(s1,s2,xlab="KLG 1 IYF - Coastal plains (KS457)",ylab="KLG 2 RE - Coastal plains (KS457)",xlim=c(-0.01,max(s1)+0.01),ylim=c(-0.01,max(s2)+0.01),xaxp=c(0,0.4,5),yaxp=c(0,0.4,5),type="n") #Grunnlag for plotting av symboler etc.
lines(c(0,max(s1)),c(max(s2),max(s2)),lty=3,col=8)
lines(c(0,max(s1)),c(0,0),lty=3,col=8)
lines(c(0,0),c(0,max(s2)),lty=3,col=8)
lines(c(max(s1),max(s1)),c(0,max(s2)),lty=3,col=8)

lines(c(0,max(s1)),c(max(s2)/3,max(s2)/3),lty=2,col=8)
lines(c(0,max(s1)),c(2*max(s2)/3,2*max(s2)/3),lty=3,col=8)
lines(c(0.2*max(s1),0.2*max(s1)),c(0,max(s2)-0.025),lty=2,col=8)
lines(c(0.4*max(s1),0.4*max(s1)),c(0,max(s2)),lty=2,col=8)
lines(c(0.6*max(s1),0.6*max(s1)),c(0,max(s2)),lty=2,col=8)
lines(c(0.8*max(s1),0.8*max(s1)),c(0,max(s2)),lty=2,col=8)

lines(c(0,0.142),c(max(s2),max(s2)),col=8)
lines(c(0,0.142),c(max(s2)-0.025,max(s2)-0.025),col=8)
lines(c(0.142,0.142),c(max(s2)-0.025,max(s2)),col=8)
lines(c(0,0),c(max(s2)-0.025,max(s2)),col=8)
points(0.01,max(s2)-0.012,pch=16,cex=0.5,col="black")
points(0.02,max(s2)-0.012,pch=16,cex=0.6,col="lightblue2")
points(0.03,max(s2)-0.012,pch=16,cex=0.75,col="darkblue")
points(0.04,max(s2)-0.012,pch=1,cex=0.75,col="red")
points(0.05,max(s2)-0.012,pch=16,cex=0.9,col="red")

text(0.06,max(s2)-0.012,"SN & Oyst_i",adj=0,cex=0.8)
points(s1[SN==1],s2[SN==1],pch=16,cex=0.5,col=1)
points(s1[SN==2],s2[SN==2],pch=16,cex=0.6,col="lightblue2")
points(s1[SN==3],s2[SN==3],pch=16,cex=0.75,col="darkblue")
points(s1[SN==4],s2[SN==4],pch=1,cex=0.75,col="red")
points(s1[SN==5],s2[SN==5],pch=16,cex=0.9,col="red")

os <- ordisurf(snv[,c(1,2)],Oyst_i,display="sites",levels=c(0.19,0.454,0.574,0.643,0.693,0.733,0.768,0.798), col="red",add=T) #inkluderer plotting p? eksisterende ordinasjonsdiagram

**
  
  #Plotter OI-klasser p? figuren, og legger p? isolinjer for IfIu
  par(plt=c(0.15, 0.95, 0.15, y2))
plot(s1,s2,xlab="KLG 1 IYF - Coastal plains (KS457)",ylab="KLG 2 RE - Coastal plains (KS457)",xlim=c(-0.01,max(s1)+0.01),ylim=c(-0.01,max(s2)+0.01),xaxp=c(0,0.4,5),yaxp=c(0,0.4,5),type="n") #Grunnlag for plotting av symboler etc.
lines(c(0,max(s1)),c(max(s2),max(s2)),lty=3,col=8)
lines(c(0,max(s1)),c(0,0),lty=3,col=8)
lines(c(0,0),c(0,max(s2)),lty=3,col=8)
lines(c(max(s1),max(s1)),c(0,max(s2)),lty=3,col=8)

lines(c(0,max(s1)),c(max(s2)/3,max(s2)/3),lty=2,col=8)
lines(c(0,max(s1)),c(2*max(s2)/3,2*max(s2)/3),lty=3,col=8)
lines(c(0.2*max(s1),0.2*max(s1)),c(0,max(s2)-0.025),lty=2,col=8)
lines(c(0.4*max(s1),0.4*max(s1)),c(0,max(s2)),lty=2,col=8)
lines(c(0.6*max(s1),0.6*max(s1)),c(0,max(s2)),lty=2,col=8)
lines(c(0.8*max(s1),0.8*max(s1)),c(0,max(s2)),lty=2,col=8)

lines(c(0,0.142),c(max(s2),max(s2)),col=8)
lines(c(0,0.142),c(max(s2)-0.025,max(s2)-0.025),col=8)
lines(c(0.142,0.142),c(max(s2)-0.025,max(s2)),col=8)
lines(c(0,0),c(max(s2)-0.025,max(s2)),col=8)
points(0.01,max(s2)-0.012,pch=1,cex=0.6,col="lightblue3")
points(0.02,max(s2)-0.012,pch=16,cex=0.6,col="lightblue3")
points(0.03,max(s2)-0.012,pch=1,cex=0.75,col="lightblue4")
points(0.04,max(s2)-0.012,pch=16,cex=0.75,col="lightblue4")
points(0.05,max(s2)-0.012,pch=1,cex=0.9,col="red")
points(0.06,max(s2)-0.012,pch=16,cex=0.9,col="red")

text(0.07,max(s2)-0.012,"OI & IfIu",adj=0,cex=0.8)
points(s1[OI==1],s2[OI==1],pch=1,cex=0.6,col="lightblue3")
points(s1[OI==2],s2[OI==2],pch=16,cex=0.6,col="lightblue3")
points(s1[OI==3],s2[OI==3],pch=1,cex=0.75,col="lightblue4")
points(s1[OI==4],s2[OI==4],pch=16,cex=0.75,col="lightblue4")
points(s1[OI==5],s2[OI==5],pch=1,cex=0.9,col="red")
points(s1[OI==6],s2[OI==6],pch=16,cex=0.9,col="red")

os <- ordisurf(snv[,c(1,2)],IfIu,display="sites",levels=c(1,2,4,6,8,10,11), col="red",add=T) #inkluderer plotting p? eksisterende ordinasjonsdiagram

**
  
  #Plotter JP-klasser p? figuren, og legger p? isolinjer for Ar_full
  par(plt=c(0.15, 0.95, 0.15, y2))
plot(s1,s2,xlab="KLG 1 IYF - Coastal plains (KS457)",ylab="KLG 2 RE - Coastal plains (KS457)",xlim=c(-0.01,max(s1)+0.01),ylim=c(-0.01,max(s2)+0.01),xaxp=c(0,0.4,5),yaxp=c(0,0.4,5),type="n") #Grunnlag for plotting av symboler etc.
lines(c(0,max(s1)),c(max(s2),max(s2)),lty=3,col=8)
lines(c(0,max(s1)),c(0,0),lty=3,col=8)
lines(c(0,0),c(0,max(s2)),lty=3,col=8)
lines(c(max(s1),max(s1)),c(0,max(s2)),lty=3,col=8)

lines(c(0,max(s1)),c(max(s2)/3,max(s2)/3),lty=2,col=8)
lines(c(0,max(s1)),c(2*max(s2)/3,2*max(s2)/3),lty=3,col=8)
lines(c(0.2*max(s1),0.2*max(s1)),c(0,max(s2)-0.025),lty=2,col=8)
lines(c(0.4*max(s1),0.4*max(s1)),c(0,max(s2)),lty=2,col=8)
lines(c(0.6*max(s1),0.6*max(s1)),c(0,max(s2)),lty=2,col=8)
lines(c(0.8*max(s1),0.8*max(s1)),c(0,max(s2)),lty=2,col=8)

lines(c(0,0.142),c(max(s2),max(s2)),col=8)
lines(c(0,0.142),c(max(s2)-0.025,max(s2)-0.025),col=8)
lines(c(0.142,0.142),c(max(s2)-0.025,max(s2)),col=8)
lines(c(0,0),c(max(s2)-0.025,max(s2)),col=8)
points(0.01,max(s2)-0.012,pch=1,cex=0.6,col="lightblue2")
points(0.02,max(s2)-0.012,pch=16,cex=0.75,col="lightblue4")
points(0.03,max(s2)-0.012,pch=16,cex=0.9,col="red")

text(0.04,max(s2)-0.012,"JI & Arfull_a",adj=0,cex=0.8)

points(s1[JP==1],s2[JP==1],pch=1,cex=0.6,col="lightblue2")
points(s1[JP==2],s2[JP==2],pch=16,cex=0.75,col="lightblue4")
points(s1[JP==3],s2[JP==3],pch=16,cex=0.9,col="red")

os <- ordisurf(snv[,c(1,2)],Arfull_a,display="sites",levels=c(0.1,0.4,0.6), col="red",add=T) #inkluderer plotting p? eksisterende ordinasjonsdiagram

**
  
  #Plotter MI-klasser p? figuren, og legger p? isolinjer for Mire_a
  par(plt=c(0.15, 0.95, 0.15, y2))
plot(s1,s2,xlab="KLG 1 IYF - Coastal plains (KS457)",ylab="KLG 2 RE - Coastal plains (KS457)",xlim=c(-0.01,max(s1)+0.01),ylim=c(-0.01,max(s2)+0.01),xaxp=c(0,0.4,5),yaxp=c(0,0.4,5),type="n") #Grunnlag for plotting av symboler etc.
lines(c(0,max(s1)),c(max(s2),max(s2)),lty=3,col=8)
lines(c(0,max(s1)),c(0,0),lty=3,col=8)
lines(c(0,0),c(0,max(s2)),lty=3,col=8)
lines(c(max(s1),max(s1)),c(0,max(s2)),lty=3,col=8)

lines(c(0,max(s1)),c(max(s2)/3,max(s2)/3),lty=2,col=8)
lines(c(0,max(s1)),c(2*max(s2)/3,2*max(s2)/3),lty=3,col=8)
lines(c(0.2*max(s1),0.2*max(s1)),c(0,max(s2)-0.025),lty=2,col=8)
lines(c(0.4*max(s1),0.4*max(s1)),c(0,max(s2)),lty=2,col=8)
lines(c(0.6*max(s1),0.6*max(s1)),c(0,max(s2)),lty=2,col=8)
lines(c(0.8*max(s1),0.8*max(s1)),c(0,max(s2)),lty=2,col=8)

lines(c(0,0.142),c(max(s2),max(s2)),col=8)
lines(c(0,0.142),c(max(s2)-0.025,max(s2)-0.025),col=8)
lines(c(0.142,0.142),c(max(s2)-0.025,max(s2)),col=8)
lines(c(0,0),c(max(s2)-0.025,max(s2)),col=8)
points(0.01,max(s2)-0.012,pch=1,cex=0.6,col="lightblue4")
points(0.02,max(s2)-0.012,pch=16,cex=0.6,col="red")

text(0.03,max(s2)-0.012,"MP & Mire_a",adj=0,cex=0.8)

points(s1[MP==1],s2[MP==1],pch=16,cex=0.6,col="lightblue4")
points(s1[MP==2],s2[MP==2],pch=16,cex=0.6,col="red")

os <- ordisurf(snv[,c(1,2)],Mire_a,display="sites",levels=c(0.05,0.1,0.2,0.4,0.6,0.8), col="red",add=T) #inkluderer plotting p? eksisterende ordinasjonsdiagram

###

#Plotter RE-klasser p? figuren, og legger p? isolinjer for RR1
par(plt=c(0.15, 0.95, 0.15, y2))
plot(s1,s2,xlab="KLG 1 IYF - Coastal plains (KS457)",ylab="KLG 2 RE - Coastal plains (KS457)",xlim=c(-0.01,max(s1)+0.01),ylim=c(-0.01,max(s2)+0.01),xaxp=c(0,0.4,5),yaxp=c(0,0.4,5),type="n") #Grunnlag for plotting av symboler etc.
lines(c(0,max(s1)),c(max(s2),max(s2)),lty=3,col=8)
lines(c(0,max(s1)),c(0,0),lty=3,col=8)
lines(c(0,0),c(0,max(s2)),lty=3,col=8)
lines(c(max(s1),max(s1)),c(0,max(s2)),lty=3,col=8)

lines(c(0,max(s1)),c(max(s2)/3,max(s2)/3),lty=2,col=8)
lines(c(0,max(s1)),c(2*max(s2)/3,2*max(s2)/3),lty=3,col=8)
lines(c(0.2*max(s1),0.2*max(s1)),c(0,max(s2)-0.025),lty=2,col=8)
lines(c(0.4*max(s1),0.4*max(s1)),c(0,max(s2)),lty=2,col=8)
lines(c(0.6*max(s1),0.6*max(s1)),c(0,max(s2)),lty=2,col=8)
lines(c(0.8*max(s1),0.8*max(s1)),c(0,max(s2)),lty=2,col=8)

lines(c(0,0.142),c(max(s2),max(s2)),col=8)
lines(c(0,0.142),c(max(s2)-0.025,max(s2)-0.025),col=8)
lines(c(0.142,0.142),c(max(s2)-0.025,max(s2)),col=8)
lines(c(0,0),c(max(s2)-0.025,max(s2)),col=8)
points(0.01,max(s2)-0.012,pch=1,cex=0.6,col="lightblue4")
points(0.02,max(s2)-0.012,pch=16,cex=0.6,col="red")

points(0.01,max(s2)-0.012,pch=16,cex=0.5,col="black")
points(0.02,max(s2)-0.012,pch=16,cex=0.6,col="lightblue2")
points(0.03,max(s2)-0.012,pch=16,cex=0.75,col="darkblue")
points(0.04,max(s2)-0.012,pch=1,cex=0.75,col="red")
points(0.05,max(s2)-0.012,pch=16,cex=0.9,col="red")

text(0.06,max(s2)-0.012,"SN & RR1",adj=0,cex=0.8)
points(s1[SN==1],s2[SN==1],pch=16,cex=0.5,col=1)
points(s1[SN==2],s2[SN==2],pch=16,cex=0.6,col="lightblue2")
points(s1[SN==3],s2[SN==3],pch=16,cex=0.75,col="darkblue")
points(s1[SN==4],s2[SN==4],pch=1,cex=0.75,col="red")
points(s1[SN==5],s2[SN==5],pch=16,cex=0.9,col="red")

os <- ordisurf(snv[,c(1,2)],RR1,display="sites",levels=c(25,50,75,100,150,200), col="red",add=T) #inkluderer plotting p? eksisterende ordinasjonsdiagram

###

#Plotter RE-klasser p? figuren, og legger p? isolinjer for Rug3_m
par(plt=c(0.15, 0.95, 0.15, y2))
plot(s1,s2,xlab="KLG 1 IYF - Coastal plains (KS457)",ylab="KLG 2 RE - Coastal plains (KS457)",xlim=c(-0.01,max(s1)+0.01),ylim=c(-0.01,max(s2)+0.01),xaxp=c(0,0.4,5),yaxp=c(0,0.4,5),type="n") #Grunnlag for plotting av symboler etc.
lines(c(0,max(s1)),c(max(s2),max(s2)),lty=3,col=8)
lines(c(0,max(s1)),c(0,0),lty=3,col=8)
lines(c(0,0),c(0,max(s2)),lty=3,col=8)
lines(c(max(s1),max(s1)),c(0,max(s2)),lty=3,col=8)

lines(c(0,max(s1)),c(max(s2)/3,max(s2)/3),lty=2,col=8)
lines(c(0,max(s1)),c(2*max(s2)/3,2*max(s2)/3),lty=3,col=8)
lines(c(0.2*max(s1),0.2*max(s1)),c(0,max(s2)-0.025),lty=2,col=8)
lines(c(0.4*max(s1),0.4*max(s1)),c(0,max(s2)),lty=2,col=8)
lines(c(0.6*max(s1),0.6*max(s1)),c(0,max(s2)),lty=2,col=8)
lines(c(0.8*max(s1),0.8*max(s1)),c(0,max(s2)),lty=2,col=8)

lines(c(0,0.142),c(max(s2),max(s2)),col=8)
lines(c(0,0.142),c(max(s2)-0.025,max(s2)-0.025),col=8)
lines(c(0.142,0.142),c(max(s2)-0.025,max(s2)),col=8)
lines(c(0,0),c(max(s2)-0.025,max(s2)),col=8)
points(0.01,max(s2)-0.012,pch=1,cex=0.6,col="lightblue4")
points(0.02,max(s2)-0.012,pch=16,cex=0.6,col="red")

points(0.01,max(s2)-0.012,pch=16,cex=0.5,col="black")
points(0.02,max(s2)-0.012,pch=16,cex=0.6,col="lightblue2")
points(0.03,max(s2)-0.012,pch=16,cex=0.75,col="darkblue")
points(0.04,max(s2)-0.012,pch=1,cex=0.75,col="red")
points(0.05,max(s2)-0.012,pch=16,cex=0.9,col="red")

text(0.06,max(s2)-0.012,"SN & Rug3_m",adj=0,cex=0.8)
points(s1[SN==1],s2[SN==1],pch=16,cex=0.5,col=1)
points(s1[SN==2],s2[SN==2],pch=16,cex=0.6,col="lightblue2")
points(s1[SN==3],s2[SN==3],pch=16,cex=0.75,col="darkblue")
points(s1[SN==4],s2[SN==4],pch=1,cex=0.75,col="red")
points(s1[SN==5],s2[SN==5],pch=16,cex=0.9,col="red")

os <- ordisurf(snv[,c(1,2)],Rug3_m,display="sites",levels=c(0.1,0.2,0.4,0.6,0.8,0.9), col="red",add=T) #inkluderer plotting p? eksisterende ordinasjonsdiagram

#Fig. 2. 1 IyK mot 3 VP; SN som symboler og isolinjer for Inns_s

#sONV'er som skal plottes mot hverandre
s1 <- sONV_IyK
s2 <- sONV_VP

#Finner koordinatene for hj?rner i det 'plotteomr?det' med koordinater (x1, x2, y1, y2) som gir
#like enheter p? begge akser. Vi holder x1, x2 og y1 faste og bestemmer y2 slik at (x2-x1)/(y2-y1) i plt=c(x1,x2,y1,y2)
#blir lik max(s1)/max(s2)
#Det krever at y2 = [(x2-x1)*max(s2) + y1*max(s1)]/max(s1) 
#Setter vi x1, x2 og y1 konstante, f?r vi:
y2 <- (0.8*max(s2)+0.15*max(s1))/max(s1)
y2

par(plt=c(0.15, 0.95, 0.15, y2))
plot(s1,s2,xlab="KLG 1 IYF - Coastal plains (KS457)",ylab="KLG 3 VP - Coastal plains (KS457)",xlim=c(-0.01,max(s1)+0.01),ylim=c(-0.01,max(s2)+0.01),xaxp=c(0,0.4,5),yaxp=c(0,0.4,5),type="n") #Grunnlag for plotting av symboler etc.
lines(c(0,max(s1)),c(max(s2),max(s2)),lty=3,col=8)
lines(c(0,max(s1)),c(0,0),lty=3,col=8)
lines(c(0,0),c(0,max(s2)),lty=3,col=8)
lines(c(max(s1),max(s1)),c(0,max(s2)),lty=3,col=8)

polygon(c(4*max(s1)/5,4*max(s1)/5,max(s1),max(s1)),c(max(s2)/2,max(s2)-0.025,max(s2)-0.025,max(s2)/2),col="lightgray")
polygon(c(4*max(s1)/5,4*max(s1)/5,max(s1),max(s1)),c(max(s2)/2,max(s2)-0.025,max(s2)-0.025,max(s2)/2),col="lightgray",density=10) #legger egentlig et skr?tt raster opp?, og fjerner streken rundt

lines(c(0,max(s1)),c(max(s2)/2,max(s2)/2),lty=2,col=8)
lines(c(0.2*max(s1),0.2*max(s1)),c(0,max(s2)),lty=2,col=8)
lines(c(0.4*max(s1),0.4*max(s1)),c(0,max(s2)),lty=2,col=8)
lines(c(0.6*max(s1),0.6*max(s1)),c(0,max(s2)),lty=2,col=8)
lines(c(0.8*max(s1),0.8*max(s1)),c(0,max(s2)-0.025),lty=2,col=8)

lines(c(max(s1)-0.14,max(s1)),c(max(s2),max(s2)),col=8)
lines(c(max(s1)-0.14,max(s1)),c(max(s2)-0.025,max(s2)-0.025),col=8)
lines(c(max(s1)-0.14,max(s1)-0.14),c(max(s2)-0.025,max(s2)),col=8)
lines(c(max(s1),max(s1)),c(max(s2)-0.025,max(s2)),col=8)

text(max(s1)-0.075,max(s2)-0.012,"SN & Inns_s",adj=0,cex=0.8)
points(max(s1)-0.13,max(s2)-0.012,pch=16,cex=0.5,col="black")
points(max(s1)-0.12,max(s2)-0.012,pch=16,cex=0.6,col="lightblue2")
points(max(s1)-0.11,max(s2)-0.012,pch=16,cex=0.75,col="darkblue")
points(max(s1)-0.10,max(s2)-0.012,pch=1,cex=0.75,col="red")
points(max(s1)-0.09,max(s2)-0.012,pch=16,cex=0.9,col="red")

points(s1[SN==1],s2[SN==1],pch=16,cex=0.5,col=1)
points(s1[SN==2],s2[SN==2],pch=16,cex=0.6,col="lightblue2")
points(s1[SN==3],s2[SN==3],pch=16,cex=0.75,col="darkblue")
points(s1[SN==4],s2[SN==4],pch=1,cex=0.75,col="red")
points(s1[SN==5],s2[SN==5],pch=16,cex=0.9,col="red")

os <- ordisurf(snv[,c(1,3)],Inns_s,display="sites",levels=c(0.1,0.2,0.3,0.4,0.5,0.6), col="red",add=T) #inkluderer plotting p? eksisterende ordinasjonsdiagram

###

#1 IyK mot 3 VP; SN som symboler og isolinjer for Mire_a

par(plt=c(0.15, 0.95, 0.15, y2))
plot(s1,s2,xlab="KLG 1 IYF - Coastal plains (KS457)",ylab="KLG 3 VP - Coastal plains (KS457)",xlim=c(-0.01,max(s1)+0.01),ylim=c(-0.01,max(s2)+0.01),xaxp=c(0,0.4,5),yaxp=c(0,0.4,5),type="n") #Grunnlag for plotting av symboler etc.
lines(c(0,max(s1)),c(max(s2),max(s2)),lty=3,col=8)
lines(c(0,max(s1)),c(0,0),lty=3,col=8)
lines(c(0,0),c(0,max(s2)),lty=3,col=8)
lines(c(max(s1),max(s1)),c(0,max(s2)),lty=3,col=8)

polygon(c(4*max(s1)/5,4*max(s1)/5,max(s1),max(s1)),c(max(s2)/2,max(s2)-0.025,max(s2)-0.025,max(s2)/2),col="lightgray")
polygon(c(4*max(s1)/5,4*max(s1)/5,max(s1),max(s1)),c(max(s2)/2,max(s2)-0.025,max(s2)-0.025,max(s2)/2),col="lightgray",density=10) #legger egentlig et skr?tt raster opp?, og fjerner streken rundt

lines(c(0,max(s1)),c(max(s2)/2,max(s2)/2),lty=2,col=8)
lines(c(0.2*max(s1),0.2*max(s1)),c(0,max(s2)),lty=2,col=8)
lines(c(0.4*max(s1),0.4*max(s1)),c(0,max(s2)),lty=2,col=8)
lines(c(0.6*max(s1),0.6*max(s1)),c(0,max(s2)),lty=2,col=8)
lines(c(0.8*max(s1),0.8*max(s1)),c(0,max(s2)-0.025),lty=2,col=8)

lines(c(max(s1)-0.14,max(s1)),c(max(s2),max(s2)),col=8)
lines(c(max(s1)-0.14,max(s1)),c(max(s2)-0.025,max(s2)-0.025),col=8)
lines(c(max(s1)-0.14,max(s1)-0.14),c(max(s2)-0.025,max(s2)),col=8)
lines(c(max(s1),max(s1)),c(max(s2)-0.025,max(s2)),col=8)

text(max(s1)-0.075,max(s2)-0.012,"SN & Mire_a",adj=0,cex=0.8)
points(max(s1)-0.13,max(s2)-0.012,pch=16,cex=0.5,col="black")
points(max(s1)-0.12,max(s2)-0.012,pch=16,cex=0.6,col="lightblue2")
points(max(s1)-0.11,max(s2)-0.012,pch=16,cex=0.75,col="darkblue")
points(max(s1)-0.10,max(s2)-0.012,pch=1,cex=0.75,col="red")
points(max(s1)-0.09,max(s2)-0.012,pch=16,cex=0.9,col="red")

points(s1[SN==1],s2[SN==1],pch=16,cex=0.5,col=1)
points(s1[SN==2],s2[SN==2],pch=16,cex=0.6,col="lightblue2")
points(s1[SN==3],s2[SN==3],pch=16,cex=0.75,col="darkblue")
points(s1[SN==4],s2[SN==4],pch=1,cex=0.75,col="red")
points(s1[SN==5],s2[SN==5],pch=16,cex=0.9,col="red")

os <- ordisurf(snv[,c(1,3)],Mire_a,display="sites",levels=c(0.05,0.1,0.2,0.3,0.4,0.5,0.6), col="red",add=T) #inkluderer plotting p? eksisterende ordinasjonsdiagram

#Fig. 3. 2 RE mot 3 VP; SN som symboler og isolinjer for Inns_s
##Ikke relevant for siste gangs analyse

#sONV'er som skal plottes mot hverandre
s1 <- sONV_RE
s2 <- sONV_VP

#Finner koordinatene for hj?rner i det 'plotteomr?det' med koordinater (x1, x2, y1, y2) som gir
#like enheter p? begge akser. Vi holder x1, x2 og y1 faste og bestemmer y2 slik at (x2-x1)/(y2-y1) i plt=c(x1,x2,y1,y2)
#blir lik max(s1)/max(s2)
#Det krever at y2 = [(x2-x1)*max(s2) + y1*max(s1)]/max(s1) 
#Setter vi x1, x2 og y1 konstante, f?r vi:
y2 <- (0.8*max(s2)+0.15*max(s1))/max(s1)
y2

par(plt=c(0.15, 0.95, 0.15, y2))
plot(s1,s2,xlab="KLG 2 RE - Coastal plains (KS457)",ylab="KLG 3 VP - Coastal plains (KS457)",xlim=c(-0.01,max(s1)+0.01),ylim=c(-0.01,max(s2)+0.01),xaxp=c(0,0.4,5),yaxp=c(0,0.4,5),type="n") #Grunnlag for plotting av symboler etc.
lines(c(0,max(s1)),c(max(s2),max(s2)),lty=3,col=8)
lines(c(0,max(s1)),c(0,0),lty=3,col=8)
lines(c(0,0),c(0,max(s2)),lty=3,col=8)
lines(c(max(s1),max(s1)),c(0,max(s2)),lty=3,col=8)

polygon(c(max(s1)/2,max(s1),max(s1),max(s1)/2),c(max(s2)/2,max(s2)/2,max(s2),max(s2)),col="lightgray")
polygon(c(max(s1)/2,max(s1),max(s1),max(s1)/2),c(max(s2)/2,max(s2)/2,max(s2),max(s2)),col="lightgray",density=10) #legger egentlig et skr?tt raster opp?, og fjerner streken rundt

lines(c(0,max(s1)),c(max(s2)/2,max(s2)/2),lty=2,col=8)
lines(c(max(s1)/2,max(s1)/2),c(0,max(s2)),lty=2,col=8)

lines(c(0,0.095),c(max(s2),max(s2)),col=8)
lines(c(0,0.095),c(max(s2)-0.02,max(s2)-0.02),col=8)
lines(c(0.095,0.095),c(max(s2)-0.02,max(s2)),col=8)
lines(c(0,0),c(max(s2)-0.02,max(s2)),col=8)

points(0.007,max(s2)-0.01,pch=16,cex=0.5,col="black")
points(0.014,max(s2)-0.01,pch=16,cex=0.6,col="lightblue2")
points(0.021,max(s2)-0.01,pch=16,cex=0.75,col="darkblue")
points(0.028,max(s2)-0.01,pch=1,cex=0.75,col="red")
points(0.035,max(s2)-0.01,pch=16,cex=0.9,col="red")

text(0.045,max(s2)-0.01,"SN & Inns_s",adj=0,cex=0.8)
points(s1[SN==1],s2[SN==1],pch=16,cex=0.5,col=1)
points(s1[SN==2],s2[SN==2],pch=16,cex=0.6,col="lightblue2")
points(s1[SN==3],s2[SN==3],pch=16,cex=0.75,col="darkblue")
points(s1[SN==4],s2[SN==4],pch=1,cex=0.75,col="red")
points(s1[SN==5],s2[SN==5],pch=16,cex=0.9,col="red")

os <- ordisurf(snv[,c(1,2)],Inns_s,display="sites",levels=c(0.1,0.2,0.3,0.4,0.5,0.6,0.7), col="red",add=T) #inkluderer plotting p? eksisterende ordinasjonsdiagram

###

#Fig. 4. 1 IyK mot 4 SgP; SN som symboler og isolinjer for Maro_s ##Ikke relevant for siste gangs analyse

#sONV'er som skal plottes mot hverandre
s1 <- sONV_IyK
s2 <- sONV_SgP

#Finner koordinatene for hj?rner i det 'plotteomr?det' med koordinater (x1, x2, y1, y2) som gir
#like enheter p? begge akser. Vi holder x1, x2 og y1 faste og bestemmer y2 slik at (x2-x1)/(y2-y1) i plt=c(x1,x2,y1,y2)
#blir lik max(s1)/max(s2)
#Det krever at y2 = [(x2-x1)*max(s2) + y1*max(s1)]/max(s1) 
#Setter vi x1, x2 og y1 konstante, f?r vi:
y2 <- (0.8*max(s2)+0.15*max(s1))/max(s1)
y2

par(plt=c(0.15, 0.95, 0.15, y2))
plot(s1,s2,xlab="KLG 1 IYF - Coastal plains (KS457)",ylab="KLG 4 SgP - Coastal plains (KS457)",xlim=c(-0.01,max(s1)+0.01),ylim=c(-0.01,max(s2)+0.01),xaxp=c(0,0.4,5),yaxp=c(0,0.4,5),type="n") #Grunnlag for plotting av symboler etc.
lines(c(0,max(s1)),c(max(s2),max(s2)),lty=3,col=8)
lines(c(0,max(s1)),c(0,0),lty=3,col=8)
lines(c(0,0),c(0,max(s2)),lty=3,col=8)
lines(c(max(s1),max(s1)),c(0,max(s2)),lty=3,col=8)

polygon(c(0,0,0.8*max(s1),0.8*max(s1)),c(0,max(s2)/2,max(s2)/2,0),col="lightgray")
polygon(c(0,0,0.8*max(s1),0.8*max(s1)),c(0,max(s2)/2,max(s2)/2,0),col="lightgray",density=10) #legger egentlig et skr?tt raster opp?, og fjerner streken rundt

lines(c(0,max(s1)),c(max(s2)/2,max(s2)/2),lty=2,col=8)
lines(c(0.2*max(s1),0.2*max(s1)),c(0.025,max(s2)),lty=2,col=8)
lines(c(0.4*max(s1),0.4*max(s1)),c(0,max(s2)),lty=2,col=8)
lines(c(0.6*max(s1),0.6*max(s1)),c(0,max(s2)),lty=2,col=8)
lines(c(0.8*max(s1),0.8*max(s1)),c(0,max(s2)),lty=2,col=8)

polygon(c(0,0,0.142,0.142),c(0,0.025,0.025,0),col="white")
polygon(c(0,0,0.142,0.142),c(0,0.025,0.025,0),col="white",density=10) #legger egentlig et skr?tt raster opp?, og fjerner streken rundt

lines(c(0,0.142),c(0,0),col=8)
lines(c(0,0.142),c(0.025,0.025),col=8)
lines(c(0,0),c(0,0.025),col=8)
lines(c(0.142,0.142),c(0,0.025),col=8)

points(0.01,0.012,pch=16,cex=0.5,col="black")
points(0.02,0.012,pch=16,cex=0.6,col="lightblue2")
points(0.03,0.012,pch=16,cex=0.75,col="darkblue")
points(0.04,0.012,pch=1,cex=0.75,col="red")
points(0.05,0.012,pch=16,cex=0.9,col="red")

text(0.06,0.012,"SN & Maro_s",adj=0,cex=0.8)
points(s1[SN==1],s2[SN==1],pch=16,cex=0.5,col=1)
points(s1[SN==2],s2[SN==2],pch=16,cex=0.6,col="lightblue2")
points(s1[SN==3],s2[SN==3],pch=16,cex=0.75,col="darkblue")
points(s1[SN==4],s2[SN==4],pch=1,cex=0.75,col="red")
points(s1[SN==5],s2[SN==5],pch=16,cex=0.9,col="red")

os <- ordisurf(snv[,c(1,4)],Maro_s,display="sites",levels=c(0.1,0.2,0.3,0.4,0.5,0.6,0.7), col="red",add=T) #inkluderer plotting p? eksisterende ordinasjonsdiagram

###

#Fig. 5. 1 IyK mot 4 SkP; SN som symboler og isolinjer for Arbla_a

#sONV'er som skal plottes mot hverandre
s1 <- sONV_IyK
s2 <- sONV_SkP

#Finner koordinatene for hj?rner i det 'plotteomr?det' med koordinater (x1, x2, y1, y2) som gir
#like enheter p? begge akser. Vi holder x1, x2 og y1 faste og bestemmer y2 slik at (x2-x1)/(y2-y1) i plt=c(x1,x2,y1,y2)
#blir lik max(s1)/max(s2)
#Det krever at y2 = [(x2-x1)*max(s2) + y1*max(s1)]/max(s1) 
#Setter vi x1, x2 og y1 konstante, f?r vi:
y2 <- (0.8*max(s2)+0.15*max(s1))/max(s1)
y2

par(plt=c(0.15, 0.95, 0.15, y2))
plot(s1,s2,xlab="KLG 1 IYF - Coastal plains (KS457)",ylab="KLG 4 SkP - Coastal plains (KS457)",xlim=c(-0.01,max(s1)+0.01),ylim=c(-0.01,max(s2)+0.01),xaxp=c(0,0.4,5),yaxp=c(0,0.4,5),type="n") #Grunnlag for plotting av symboler etc.
lines(c(0,max(s1)),c(max(s2),max(s2)),lty=3,col=8)
lines(c(0,max(s1)),c(0,0),lty=3,col=8)
lines(c(0,0),c(0,max(s2)),lty=3,col=8)
lines(c(max(s1),max(s1)),c(0,max(s2)),lty=3,col=8)

polygon(c(4*max(s1)/5,4*max(s1)/5,max(s1),max(s1)),c(0.025,max(s2),max(s2),0.025),col="lightgray")
polygon(c(4*max(s1)/5,4*max(s1)/5,max(s1),max(s1)),c(0.025,max(s2),max(s2),0.025),col="lightgray",density=10) #legger egentlig et skr?tt raster opp?, og fjerner streken rundt

polygon(c(max(s1)-0.142,max(s1)-0.142,4*max(s1)/5,4*max(s1)/5),c(0.025,max(s2)/2,max(s2)/2,0.025),col="lightgray")
polygon(c(max(s1)-0.142,max(s1)-0.142,4*max(s1)/5,4*max(s1)/5),c(0.025,max(s2)/2,max(s2)/2,0.025),col="lightgray",density=10) #legger egentlig et skr?tt raster opp?, og fjerner streken rundt

polygon(c(3*max(s1)/5,3*max(s1)/5,max(s1)-0.142,max(s1)-0.142),c(0,max(s2)/2,max(s2)/2,0),col="lightgray")
polygon(c(3*max(s1)/5,3*max(s1)/5,max(s1)-0.142,max(s1)-0.142),c(0,max(s2)/2,max(s2)/2,0),col="lightgray",density=10) #legger egentlig et skr?tt raster opp?, og fjerner streken rundt

lines(c(0,max(s1)),c(max(s2)/2,max(s2)/2),lty=2,col=8)
lines(c(0.2*max(s1),0.2*max(s1)),c(0,max(s2)),lty=2,col=8)
lines(c(0.4*max(s1),0.4*max(s1)),c(0,max(s2)),lty=2,col=8)
lines(c(0.6*max(s1),0.6*max(s1)),c(0,max(s2)),lty=2,col=8)
lines(c(0.8*max(s1),0.8*max(s1)),c(0,max(s2)-0.025),lty=2,col=8)

lines(c(max(s1)-0.142,max(s1)),c(0,0),col=8)
lines(c(max(s1)-0.142,max(s1)),c(0.025,0.025),col=8)
lines(c(max(s1)-0.142,max(s1)-0.142),c(0,0.025),col=8)
lines(c(max(s1),max(s1)),c(0,0.025),col=8)

points(max(s1)-0.142+0.01,0.012,pch=16,cex=0.5,col="black")
points(max(s1)-0.142+0.02,0.012,pch=16,cex=0.6,col="lightblue2")
points(max(s1)-0.142+0.03,0.012,pch=16,cex=0.75,col="darkblue")
points(max(s1)-0.142+0.04,0.012,pch=1,cex=0.75,col="red")
points(max(s1)-0.142+0.05,0.012,pch=16,cex=0.9,col="red")

text(max(s1)-0.142+0.06,0.012,"SN & Arbla_a",adj=0,cex=0.8)
points(s1[SN==1],s2[SN==1],pch=16,cex=0.5,col=1)
points(s1[SN==2],s2[SN==2],pch=16,cex=0.6,col="lightblue2")
points(s1[SN==3],s2[SN==3],pch=16,cex=0.75,col="darkblue")
points(s1[SN==4],s2[SN==4],pch=1,cex=0.75,col="red")
points(s1[SN==5],s2[SN==5],pch=16,cex=0.9,col="red")

os <- ordisurf(snv[,c(1,4)],Arbla_a,display="sites",levels=c(0.1,0.2,0.3,0.4,0.5,0.6,0.7), col="red",add=T) #inkluderer plotting p? eksisterende ordinasjonsdiagram

###

#Fig. 6. 1 IyK mot 6 OI; OI som symboler og isolinjer for Gab_a

#sONV'er som skal plottes mot hverandre
s1 <- sONV_IyK
s2 <- sONV_OI

#Finner koordinatene for hj?rner i det 'plotteomr?det' med koordinater (x1, x2, y1, y2) som gir
#like enheter p? begge akser. Vi holder x1, x2 og y1 faste og bestemmer y2 slik at (x2-x1)/(y2-y1) i plt=c(x1,x2,y1,y2)
#blir lik max(s1)/max(s2)
#Det krever at y2 = [(x2-x1)*max(s2) + y1*max(s1)]/max(s1) 
#Setter vi x1, x2 og y1 konstante, f?r vi:
y2 <- (0.8*max(s2)+0.15*max(s1))/max(s1)
y2


#Plotter OI-klasser p? figuren, og legger p? isolinjer for Gab_a
par(plt=c(0.15, 0.95, 0.15, y2))
plot(s1,s2,xlab="KLG 1 IYF - Coastal plains (KS457)",ylab="KLG 6 Gab_a - Coastal plains (KS457)",xlim=c(-0.01,max(s1)+0.01),ylim=c(-0.01,max(s2)+0.01),xaxp=c(0,0.4,5),yaxp=c(0,0.4,5),type="n") #Grunnlag for plotting av symboler etc.
lines(c(0,max(s1)),c(max(s2),max(s2)),lty=3,col=8)
lines(c(0,max(s1)),c(0,0),lty=3,col=8)
lines(c(0,0),c(0,max(s2)),lty=3,col=8)
lines(c(max(s1),max(s1)),c(0,max(s2)),lty=3,col=8)

lines(c(0,max(s1)),c(max(s2)/2,max(s2)/2),lty=2,col=8)
lines(c(0.2*max(s1),0.2*max(s1)),c(0,max(s2)-0.025),lty=2,col=8)
lines(c(0.4*max(s1),0.4*max(s1)),c(0,max(s2)),lty=2,col=8)
lines(c(0.6*max(s1),0.6*max(s1)),c(0,max(s2)),lty=2,col=8)
lines(c(0.8*max(s1),0.8*max(s1)),c(0,max(s2)),lty=2,col=8)

lines(c(0,0.142),c(0,0),col=8)
lines(c(0,0.142),c(0.025,0.025),col=8)
lines(c(0.142,0.142),c(0,0.025),col=8)
lines(c(0,0),c(0,0.025),col=8)

points(0.01,0.012,pch=1,cex=0.6,col="lightblue3")
points(0.02,0.012,pch=16,cex=0.6,col="lightblue3")
points(0.03,0.012,pch=1,cex=0.75,col="lightblue4")
points(0.04,0.012,pch=16,cex=0.75,col="lightblue4")
points(0.05,0.012,pch=1,cex=0.9,col="red")
points(0.06,0.012,pch=16,cex=0.9,col="red")

text(0.07,0.012,"OI & Gab_a",adj=0,cex=0.8)
points(s1[OI==1],s2[OI==1],pch=1,cex=0.6,col="lightblue3")
points(s1[OI==2],s2[OI==2],pch=16,cex=0.6,col="lightblue3")
points(s1[OI==3],s2[OI==3],pch=1,cex=0.75,col="lightblue4")
points(s1[OI==4],s2[OI==4],pch=16,cex=0.75,col="lightblue4")
points(s1[OI==5],s2[OI==5],pch=1,cex=0.9,col="red")
points(s1[OI==6],s2[OI==6],pch=16,cex=0.9,col="red")

os <- ordisurf(snv[,c(1,6)],Gab_a,display="sites",levels=c(0.1,0.2,0.4,0.6,0.8), col="red",add=T) #inkluderer plotting p? eksisterende ordinasjonsdiagram


