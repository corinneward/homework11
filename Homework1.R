#Question 1 
bonds <- read.csv('Homework1_Bonds.csv')
(table(bonds$Result))

approvedbonds <- (bonds$Result == 'Carried')
citybonds <-bonds[bonds$Gov_Type == 'CITY',]
approvedcitybonds <- sum(citybonds$Result == 'Carried')
approvedcitybonds <-as.numeric(approvedcitybonds)
citybonds <- nrow(citybonds)
rofcitybonds <- ((approvedcitybonds/citybonds)*100)


countybonds <-bonds[bonds$Gov_Type == 'COUNTY',]
approvedcountybonds <- sum(countybonds$Result == 'Carried')
approvedcountybonds <-as.numeric(approvedcountybonds)
countybonds <- nrow(countybonds)
rofcountyybonds <- ((approvedcountybonds/countybonds)*100)


sdbonds <-bonds[bonds$Gov_Type == 'ISD',]
approvedsdbonds <- sum(sdbonds$Result == 'Carried')
approvedsdbonds <-as.numeric(approvedsdbonds)
sdbonds <- nrow(sdbonds)
rofsdbonds <- ((approvedsdbonds/sdbonds)*100)


wdbonds <-bonds[bonds$Gov_Type == 'WD',]
approvedwdbonds <- sum(wdbonds$Result == 'Carried')
approvedwdbonds <-as.numeric(approvedwdbonds)
wdbonds <- nrow(wdbonds)
rofwdbonds <- ((approvedwdbonds/wdbonds)*100)

#Question 2 
Votes_Total <- bonds$Votes_For + bonds$Votes_Against
bonds['Votes_Total'] <- Votes_Total
bonds[bonds$Votes_Total== max(Votes_Total),]


#Question 3
approvedbonds <- bonds[bonds$Result == 'Carried' & bonds$Votes_Total >= 10,]
Percentage_For <-((approvedbonds$Votes_For/approvedbonds$Votes_Total)*100)
approvedbonds['Percentage_For'] <-Percentage_For
hist(approvedbonds$Percentage_For, main = 'Percentage of Votes for Bond', xlab = 'Percentage of Votes for ', col = 'lightblue', xlim = c(0,100), ylim=c(0,700))

#Question 4 
cor(approvedbonds$Percentage_For,approvedbonds$Amount)
plot(approvedbonds$Percentage_For,approvedbonds$Amount, main = 'Votes For v Bond Cost', xlab='Percentage of Votes For', ylab = 'Bond Cost', pch = 20, ylim=c(0,900000000),xlim=c(40,100))

#hello i dont know how to use this!!
