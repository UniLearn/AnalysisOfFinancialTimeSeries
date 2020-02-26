# 文件“bnd.dat”中包含了美国政府的期限为 30 年、20 年、10 年、5 年和 1 年的债券的每月指数的简单收益率数据（以列顺序给出）。数据是由 CRSP 获得的，样本的时间区间是从 1942 年 1 月至 1999 年 12 月。给期限为 5 年的债券指数的简单收益率建立一个 AR 或 MA 模型。所拟合的模型是合适的吗？

bnd <- read.table("m-bnd.dat", header=F)

months <- ((c(1:696) - 1) %% 12)+1
days <- numeric(696)+1
years <- floor((c(1:696)-1)/12)+1942
serials <- as.Date(paste(years, months, days, sep='-'))

install.packages("astsa", repos='https://mirrors.e-ducation.cn/CRAN/')

library(astsa)

acf(bnd[,4])

# AR(1) for 30 years, 20 years, 10 years, 5 years and 1 year bonds' monthly return, respectively
# Check the pacf plot and found it is signaficant on 1, 11
sarima(bnd[,4], p=11, d=0, q=0)

# MA(11)s
# Check the acf and found it is signaficant on 1, 11
sarima(bnd[,4], p=0, d=0, q=11)