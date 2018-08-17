# get reddit file from https://s3.amazonaws.com/udacity-hosted-downloads/ud651/reddit.csv

getwd()

#assign variable to read file
reddit <- read.csv('reddit.csv')

#dimensions, 32754 rows and 14 columns
dim(reddit)
#32754    14

#table shows the count of different options within that category
table(reddit$employment.status)

"Employed full time                             Freelance 
14814                                  1948 
Not employed and not looking for work    Not employed, but looking for work 
682                                  2087 
Retired                               Student 
85                                 12987 """

##provides the summary of the dataset, 
summary(reddit)

"
      id            gender          age.range    
 Min.   :    1   Min.   :0.0000   18-24   :15802  
1st Qu.: 8189   1st Qu.:0.0000   25-34   :11575  
Median :16380   Median :0.0000   Under 18: 2330  
Mean   :16379   Mean   :0.1885   35-44   : 2257  
3rd Qu.:24568   3rd Qu.:0.0000   45-54   :  502  
Max.   :32756   Max.   :1.0000   (Other) :  200  
NA's   :201      NA's    :   88  
marital.status 
Engaged                                 : 1109  
Forever Alone                           : 5850  
In a relationship                       : 9828  
Married/civil union/domestic partnership: 5490  
Single                                  :10428  
Widowed                                 :   44  
NA's                                    :    5  
employment.status military.service children    
Employed full time                   :14814   No  :30526       No  :27488  
Freelance                            : 1948   Yes : 2223       Yes : 5047  
Not employed and not looking for work:  682   NA's:    5       NA's:  219  
Not employed, but looking for work   : 2087                                
Retired                              :   85                                
Student                              :12987                                
NA's                                 :  151                                
education               country     
Bachelor's degree                 :11046   United States :20967  
Some college                      : 9600   Canada        : 2888  
Graduate or professional degree   : 4722   United Kingdom: 1782  
High school graduate or equivalent: 3272   Australia     : 1051  
Some high school                  : 1924   Germany       :  407  
(Other)                           : 2046   (Other)       : 5482  
NA's                              :  144   NA's          :  177  
state                    income.range                fav.reddit   
:11908   Under $20,000      :7892                      : 4335  
California: 3401   $50,000 - $69,999  :4133   askreddit          : 2123  
Texas     : 1541   $70,000 - $99,999  :4101   fffffffuuuuuuuuuuuu: 1746  
New York  : 1418   $100,000 - $149,999:3522   pics               : 1651  
Illinois  :  976   $20,000 - $29,999  :3206   trees              : 1311  
Washington:  910   (Other)            :8285   (Other)            :21562  
(Other)   :12600   NA's               :1615   NA's               :   26  
dog.cat            cheese    
I like cats.   :11156   Other    :6563  
I like dogs.   :17151   Cheddar  :6102  
I like turtles.: 4442   Brie     :3742  
NA's           :    5   Provolone:3456  
Swiss    :3214  
(Other)  :9672  
NA's     :   5  """

#str provides a structural summary of the file the variables and the factors 
str(reddit)

#to get specific factors you need to reference the df and a field 
levels(reddit$age.range)

#to graph
library(ggplot2)

#To change the factors
reddit$age.range <- factor(reddit$age.range, levels =c("Under 18", "18-24", "25-34", "35-44","55-64","65 or Above"), ordered = T)

#plot
qplot(data = reddit, x = age.range)


#To change the orders
reddit$age.range <- ordered(reddit$age.range, levels =c("Under 18", "18-24", "25-34", "35-44","55-64","65 or Above"))


#count number of NA's in dataset 
sum(is.na(reddit))

#for specific column
sum(is.na(reddit$age.range))

##count na's per column
colSums(is.na(reddit))

##need to remove na from plot, remove all NA's from dataset
reddit.clean <- na.omit(reddit)

#check if in columns its clean
colSums(is.na(reddit.clean))

#Plot the new graph
qplot(data = reddit.clean, x = age.range)

#Lets do the same for income levels
levels(reddit$income.range)

#change the income range to be ordered
reddit$income.range <- factor(reddit$income.range, levels =c("Under $20,000", "$20,000 - $29,999",  "$30,000 - $39,999", "$40,000 - $49,999","$50,000 - $69,999" ,"$70,000 - $99,999","$100,000 - $149,999", "$150,000 or more" ), ordered = T)
#income plot
qplot(data = reddit, x = income.range)

#if we want to import only data that has a better quality (only columns with less than 10 NA's)
#the space after the square brackets means to import all the roswlotr
reddit.clean <- reddit[ , colSums(is.na(reddit)) <10]