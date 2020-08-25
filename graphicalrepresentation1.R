#### Graphical Representation of Data ####

# Read in the creativity dataset using read.csv()
creativity <- read.csv(file.choose(), header=TRUE)

# Check that the data is loaded correctly
head(creativity)
str(creativity)

## histograms for both the extrinsic and instrinsic groups
# subset function
intrinsic <- subset(creativity, Treatment=="Intrinsic")
head(intrinsic)

extrinsic <- subset(creativity, Treatment=="Extrinsic")
head(extrinsic)

hist(intrinsic$Score, xlim=c(5,35), col="green", breaks=10) # col argument changes the color
hist(extrinsic$Score, xlim=c(5,35), col="red", breaks=4) # breaks argument is used to change bin width
# xlim argument changes the range of the x axis
# likewise, ylim argument is used to change the range of the y axis

## How to put more than one plot on a page?
# use the mfrow argument in the par() function
par(mfrow=c(1,2)) # side by side
par(mfrow=c(2,1)) # on top of each other
par(mfrow=c(1,1)) # get back to one plot per page
# This function changes the setting in the plotting window, so when you run your plotting code AFTER the par()
# function, the plots will show up next to each other
# play around with plotting using the par() function to get comfortable with how it works

## side-by-side boxplots
plot(creativity$Treatment, creativity$Score)
points(creativity$Treatment, creativity$Score) # overlays the data points on the boxplots

# using the function jitter within the points argument will add a little bit of noise in the horizontal
# direction to make it easier to see distribution of points when overplotting is an issue
points(jitter(as.numeric(creativity$Treatment), amount=0.05), creativity$Score)

#### Summary statistics ####

# on subsetted data
mean_extrinsic <- mean(extrinsic$Score)
mean_intrinsic <- mean(intrinsic$Score)

sd(extrinsic$Score)
sd(intrinsic$Score)

quantile(intrinsic$Score)
quantile(extrinsic$Score)

min(intrinsic$Score)
max(extrinsic$Score)
min(Score)

# or all at once using tapply() on the full dataset
means <- tapply(creativity$Score, creativity$Treatment, mean)
sds<-tapply(creativity$Score, creativity$Treatment, sd)
tapply(creativity$Score, creativity$Treatment, quantile)



