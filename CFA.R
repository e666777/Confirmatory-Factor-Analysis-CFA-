##############验证性因子分析#########
library(lavaan)
library(semPlot)
#读取lavaa内置的数据集HolzingerSwineford1939
head(HolzingerSwineford1939)
#查看数据集的结构，想验证三个潜变量visual(x1,x2,x3)、textual(x4,x5,x6)、speed(x7,x8,x9)
str(HolzingerSwineford1939)
#建模，=~符号左边是潜变量，右边是指标。
#例如：latent variable =~ indicator1 + indicator2 + indicator3
CFA.model <- ' visual  =~ x1 + x2 + x3 
              textual =~ x4 + x5 + x6
              speed   =~ x7 + x8 + x9 '
#查看拟合情况，fit.measures = TRUE表示需要拟合度指标
#加入std.lv = TRUE，得到标准化后的题项载荷
fit <- cfa(CFA.model, data=HolzingerSwineford1939, std.lv=T)
summary(fit, fit.measures=TRUE)
semPaths(fit)