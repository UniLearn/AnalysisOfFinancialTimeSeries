bnd <- read.table("m-bnd.dat", header=F)

months <- ((c(1:696) - 1) %% 12)+1
days <- numeric(696)+1
years <- floor((c(1:696)-1)/12)+1942
serials <- as.Date(paste(years, months, days, sep='-'))

install.packages("xts")

library(xts)

bnd1 <- xts(bnd[1], order.by=serials)
bnd2 <- xts(bnd[2], order.by=serials)
bnd3 <- xts(bnd[3], order.by=serials)
bnd4 <- xts(bnd[4], order.by=serials)
bnd5 <- xts(bnd[5], order.by=serials)

plot(bnd1)
plot(bnd2)
plot(bnd3)
plot(bnd4)
plot(bnd5)