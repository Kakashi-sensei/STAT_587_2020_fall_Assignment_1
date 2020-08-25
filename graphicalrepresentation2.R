#### Another Example of Graphical Representation of Data ####

# load the dataset, .txt file so use read.table() and no column names so we don't need to change 
# the header argument to TRUE
fourgrps <- read.table(file.choose())

## histograms for each group 
hist(fourgrps$V1, xlim=c(35,75)) # xlim to set all the x axes to the same range
hist(fourgrps$V2, xlim=c(35,75))
hist(fourgrps$V3, xlim=c(35,75))
hist(fourgrps$V4, xlim=c(35,75))

## all on the same plot?
par(mfrow=c(2,2)) # 2 by 2 plots
hist(fourgrps$V1, xlim=c(35,75)) 
hist(fourgrps$V2, xlim=c(35,75))
hist(fourgrps$V3, xlim=c(35,75))
hist(fourgrps$V4, xlim=c(35,75))

par(mfrow=c(1,1)) # to get back to 1 plot
hist(fourgrps$V2, xlim=c(35,75), breaks=6)

### side-by-side boxplots ###

# Need to convert dataset from 4 columns, 1 for each group, two two columns -- 1 for the values, 1 for the group name
melt() # reshape2 package, used to stack columns 

# install and load the reshape 2 package
install.package("reshape2") # run this code
library(reshape2)

fourgrps.m <- melt(fourgrps) # one trt variable, one response variable
head(fourgrps.m)

# construct a side by side boxplot
plot(fourgrps.m$variable, fourgrps.m$value)
points(jitter(as.numeric(fourgrps.m$variable), amount=0.05), fourgrps.m$value)

# summary statistics using tapply() function, on fourgrps.m
tapply(fourgrps.m$value, fourgrps.m$variable, max)

# could also easily get summaries on each column using original dataframe fourgrps
quantile(fourgrps$V3)


