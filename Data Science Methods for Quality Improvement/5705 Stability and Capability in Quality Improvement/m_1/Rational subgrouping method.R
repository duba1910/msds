# Rational Subgrouping

require(lolcat)
# (Un)rational subgrouping
spc.chart.variables.mean.and.meanrange(data = Example.1.Method.1$Data, sample = Example.1.Method.1$Sample)
spc.chart.variables.mean.and.meanrange(data = Example.1.Method.1$Data, sample = Example.1.Method.1$Sample, chart1.control.rules = spc.rulesets.nelson.1984.test.1.2.3.4.5.6.7.8())
ex1<-spc.chart.variables.mean.and.meanrange(data = Example.1.Method.1$Data, sample = Example.1.Method.1$Sample, chart1.control.rules = spc.rulesets.nelson.1984.test.1.2.3.4.5.6.7.8())

# Rational subgrouping
# By Stream
spc.chart.variables.mean.and.meanrange(data = Example.1.Method.2$Stream.1, sample = Example.1.Method.2$Sample, chart1.main="Mean Chart - Stream 1", chart2.main="Range Chart - Stream 1")
spc.chart.variables.mean.and.meanrange(data = Example.1.Method.2$Stream.2, sample = Example.1.Method.2$Sample, chart1.main="Mean Chart - Stream 2", chart2.main="Range Chart - Stream 2")
spc.chart.variables.mean.and.meanrange(data = Example.1.Method.2$Stream.3, sample = Example.1.Method.2$Sample, chart1.main="Mean Chart - Stream 3", chart2.main="Range Chart - Stream 3")
spc.chart.variables.mean.and.meanrange(data = Example.1.Method.2$Stream.4, sample = Example.1.Method.2$Sample, chart1.main="Mean Chart - Stream 4", chart2.main="Range Chart - Stream 4")




