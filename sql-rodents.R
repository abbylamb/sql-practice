

#install and load a new package
install.packages("RSQLite", dependencies=T)
library(RSQLite)

driver <- dbDriver("SQLite")
con <- dbConnect(driver, dbname="portal_mammals.sqlite")

results <- dbGetQuery(con, "SELECT species, wgt, year FROM surveys")

dbDisconnect(con) #disconnecting from database saves some memory, and since we've read in our data we don't need to stay connected

View(results)

#Plot my results
plot(results$year, results$wgt)


