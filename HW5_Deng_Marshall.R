#set working directory 
setwd("C:/Users/kfdeng28/Downloads")

#question 1
#find the product of matrix multiplication

a <- matrix(c(7,2,9,4,12,13), nrow = 2, ncol = 3)
a
b <- matrix(c(1,2,3,7,8,9,12,13,14,19,20,21), nrow = 3, ncol = 4)
b
a %*%b 
#-------------------------------------------------------

#question 2
#use data frame to create a table 
df <- data.frame(
  id = c(1,2,3,4,5),
  name = c("Peter", "Amy", "Ryan", "Gary", "Michelle"),
  salary = c(623.30,515.20,611.00,729.00,843.25)
)
df

#question 2
#add a new column of department 
df_new_col <- cbind(df, department = c("IT", "Finance", "Accounting", "Development", "Maintenance"))
df_new_col

#question 2
#extract specified rows and columns 
df_135 <- df_new_col[c(1,3,5), c(2,3)]
df_135

#question 2
#bar chart 
df_145 <- df_new_col[c(1,4,5), c(2,3)]
df_145
x_axis <- c(df_145$name)
y_axis <- c(df_145$salary)
barplot(y_axis, names.arg = x_axis, xlab = "name", ylab = "salary")

#question 2
#pie chart 
values = c(max(df_new_col$salary), min(df_new_col$salary), median(df_new_col$salary))
labels = c("Max", "Min", "Median")
colors = c("red", "blue", "yellow")
pie(values, labels, main = "salary", col =colors)
legend("topleft", labels, fill = colors)
#-------------------------------------------------------

#question 3
#import amazon order data 
az = read.csv("amazon-orders.csv")

#extract order months 
az_ordermonth <- cbind(az, order_month = c(substring(az$Order.Date, 1, 2)))

#summary statistics of monthly spending 
az_monthlyspending <- cbind(az_ordermonth, month_spending = as.numeric(gsub("\\$", "", az_ordermonth$Total.Charged))) 
tapply(az_monthlyspending$month_spending, az_monthlyspending$order_month, summary)

#create bar chart for maximum monthly spending
months <- c("April", "May", "June", "July")
max_spent <- c(tapply(az_monthlyspending$month_spending, az_monthlyspending$order_month, max))
max_spent
barplot(max_spent, names.arg = months, main = "Maximum Spending for Each Month", xlab = "month", ylab = "maximum spending")

#create a line graph with two lines to compare maximum spending and average spending for each month
months <- c("April", "May", "June", "July")
max_spent <- c(tapply(az_monthlyspending$month_spending, az_monthlyspending$order_month, max))
avg_spent <- c(tapply(az_monthlyspending$month_spending, az_monthlyspending$order_month, mean))
plot(max_spent, type = "o", col = "red", xlab = "Month", ylab = "Amount Spent", xaxt = "n", main = "Maximum (Red) vs. Average (Blue) Monthly Spending")
lines(avg_spent, type = "o", col = "blue")
axis(1, at=seq(1, 4, by=1), labels = months)
