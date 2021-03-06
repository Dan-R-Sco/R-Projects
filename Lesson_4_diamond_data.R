
#load the diamonds data
data(diamonds)
View(diamonds)
str(diamonds)

#review the help on the dataset
?diamonds

#find the color factors
levels(diamonds$color)

#plot histogram price
qplot(data = diamonds, x = price, binwidth = 100)

summary(diamonds$price)

#find diamonds lower than $500
diamonds500 <- subset(diamonds, price < 500)
str(diamonds500)

#lower than $250
diamonds250 <- subset(diamonds, price < 250)
str(diamonds250)

#higher than or equal to $15000
diamonds15000 <- subset(diamonds, price >= 15000)
str(diamonds15000)

# Explore the largest peak in the 
# price histogram you created earlier.

# Try limiting the x-axis, altering the bin width,
# and setting different breaks on the x-axis.

# There won't be a solution video for this
# question so go to the discussions to
# share your thoughts and discover
# what other people find.

# You can save images by using the ggsave() command.
# ggsave() will save the last plot created.
# For example...
#                  qplot(x = price, data = diamonds)
#                  ggsave('priceHistogram.png')
qplot(x = diamonds$price, data = diamonds, binwidth = 10, xlab = "Diamond Price (USD)", ylab = "No. Occurences", color = I('black'), fill = I('#F79420')) +
  scale_x_continuous(breaks = seq(0, 3000, 500), lim = c(0,1500))

#save to pdf
ggsave("diamodsPriceHisto.pdf")

# Break out the histogram of diamond prices by cut.

# You should have five histograms in separate
# panels on your resulting plot.
qplot(x = diamonds$price, data = diamonds) + facet_grid(cut ~ .)

#Price by cut
#separate the cuts
fairdiamonds <- subset(diamonds, cut == "Fair")
gppddiamonds <- subset(diamonds, cut == "Good")
vgooddiamonds <- subset(diamonds, cut == "Very Good")
premdiamonds <- subset(diamonds, cut == "Premium")
idealdiamonds <- subset(diamonds, cut == "Ideal")

#get the summary of each cut to review the information
summary(fairdiamonds$price)
  #Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  #337    2050    3282    4359    5206   18574 
summary(gppddiamonds$price)
  #Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  #327    1145    3050    3929    5028   18788 
summary(vgooddiamonds$price)
  #Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  #336     912    2648    3982    5373   18818 
summary(premdiamonds$price)
  #Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  #326    1046    3185    4584    6296   18823 
summary(idealdiamonds$price)

#facet wrap plot with different y axis for each graph
qplot(x = price, data = diamonds) + facet_wrap(~cut, scales = "free")

#Create a histogram of price per carat and facet it by cut
p1 <- qplot(x=log10(price/carat), data = fairdiamonds, binwidth=0.03, main ="Fair Diamonds")
p2 <- qplot(x=log10(price/carat), data = gppddiamonds, binwidth=0.03, main = "Good Diamonds")
p3 <- qplot(x=log10(price/carat), data = vgooddiamonds, binwidth=0.03, main = "Very Good Diamonds")
p4 <- qplot(x = log10(price/carat), data = premdiamonds,binwidth=0.03, main = "Premium Diamonds")
p5 <-  qplot(x = log10(price/carat), data = idealdiamonds, binwidth=0.03,main = "Ideal Diamonds")
grid.arrange(p1, p2, p3, p4, p5, ncol =1)

#or with ggplot
ggplot(aes(x=price/carat), data=diamonds) +
  +     geom_histogram(binwidth=0.03, color='black', fill='#02a0e2') + 
  +     scale_x_log10() +
  +     facet_wrap(~cut, scales="fixed")

# Investigate the price of diamonds using box plots,
# numerical summaries, and one of the following categorical
# variables: cut, clarity, or color.

qplot(x = cut, y = price, data = diamonds, geom = 'boxplot')
ggsave("cutVspriceBox.pdf")
qplot(x = clarity, y = price, data = diamonds, geom = 'boxplot')
ggsave("clarityVspriceBox.pdf")
qplot(x = color, y = price, data = diamonds, geom = 'boxplot')
ggsave("colorVspriceBox.pdf")

#use the by function to give the price per colour
by(diamonds$price,diamonds$color,summary)

#find the IQR for diamonds with the best colour
#check what is the best colour
?diamonds

#diamond colour, from J (worst) to D (best)
#use IQR function to determine the price
IQR(subset(diamonds, color == "D")$price)

#IQR for the worst 
IQR(subset(diamonds, color == "J")$price)

# Investigate the price per carat of diamonds across
# the different colors of diamonds using boxplots.
ggplot(diamonds, aes(factor(color), (price/carat), fill=color)) + geom_boxplot() + ggtitle("Diamond Price per Carat according Colour") + xlab("Colour") + ylab("Price/Carat USD")
#check and validate with numerical summary
by(diamonds$price/diamonds$carat,diamonds$color, summary)
#investigate the weight of the diamonds using a freq polygon, what carat size has a count greater than 2000? 
#Answer 0.3 and 1.01
qplot(x = carat, data = diamonds, binwidth = 0.01, geom = 'freqpoly') + 
  +     scale_x_continuous(lim = c(0,2.4), breaks = seq(0,5,0.2))

#data wrangling cheatsheet
https://s3.amazonaws.com/udacity-hosted-downloads/ud651/DataWranglingWithR.pdf
#general r cheatsheets
https://www.rstudio.com/resources/cheatsheets/
