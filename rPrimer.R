# ---
#   title: "R101 Primer"
# author: "Matthew Byrne"
# date: "02/10/2020"
# output:
#   word_document: default
# html_document: default
# pdf_document: default
# ---
#   
#   ```{r setup, include=FALSE}
# knitr::opts_chunk$set(echo = TRUE)
# #LOAD NEEDED LIBRARIES FIRST:
# library(tidyverse)
# ```
# 
# This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.
# 
# When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:
#   
#   <!-- ctrl-shift-c to comment out -->
#   <!-- ctrl-enter to execute some code -->
#   
#   # Some basic samples of R Data
#   ```{r Basics}
# myString <- 'Hello my name is Matt and this is R'
# print(myString)
# 
# 7 + 7
# 
# x = 1
# y = 2
# z = x + y
# ```
# 
# 
# ## Data Types in R
# 
# In contrast to other programming languages like C or Java, variables are not declared as some data type. The variables are assigned with R-Objects and the data type of the R-Object becomes the data type of the variable. They are many types of R-Objects. Here is the most common ones!
#   
#   ## R Objects
#   -vectors
# -Lists
# -Matrices
# -Arrays
# -Factors
# -Data Frames
# 
# 
# ### Vector - value assigned to a variable
# ```{r DataTypes}
# # Logical True or False
# v = TRUE
# print(class(v))
# 
# # Numeric 12.3, 5, 999
# v = 23.5
# print(class(v))
# 
# # Integer	2L, 34L, 0L	
# v = 2L
# print(class(v))
# 
# # Character vectors are strings	'a' , '"good", "TRUE", '23.4'	
# v = "this is a string"
# print(class(v))
# 
# # Raw Value	"Hello" is stored as 48 65 6c 6c 6f	
# v = charToRaw("hello")
# print(class(v))
# v
# 
# 
# ##################### Multiple Values ###############
# 
# # Create a vector with multiple values.
# apple = c('red','green',"yellow")
# print(apple)
# # Get the class of the multiple vector which is "character".
# print(class(apple))
# 
# 
# # Create a list (contains a vector, float, max function and boolean)
# list1 = list(c(2,5,3),21.3,max, TRUE)
# # Print the list. (Double brackets is the field of the list)
# print(list1)
# 
# 
# ## A matrix is a two-dimensional rectangular data set. It can be created using a vector input to the matrix function.
# # Create a matrix.
# M = matrix(c('a','a','b','c','b','a'), nrow = 2, ncol = 3, byrow = TRUE)
# print(M)
# 
# 
# # Create an array(repeats over and over if values are too short)
# a = array(c('green','yellow','purple'),dim = c(3,3,2))
# print(a)
# 
# 
# # Factors are the r-objects which are created using a vector. It stores the vector along with the distinct values of the elements in the vector as labels. The labels are always character irrespective of whether it is numeric or character or Boolean etc. in the input vector. They are useful in statistical modeling.
# 
# # Factors are created using the `factor()` function. The `nlevels` functions gives the count of levels.
# # Create a vector.
# apple_colors = c('green','green','yellow','red','red','red','green')
# # Create a factor object.
# factor_apple = factor(apple_colors)
# # Print the factor equal 3
# print(factor_apple)
# print(nlevels(factor_apple))
# 
# # Data frames are tabular data objects. Unlike a matrix in data frame each column can contain different modes of data. The first column can be numeric while the second column can be character and third column can be logical. It is a list of vectors of equal length.
# 
# # Data Frames are created using the `data.frame()` function.
# 
# # Create the data frame.
# BMI = 	data.frame(
#   gender = factor(c("Male", "Male","Female")), 
#   height = c(152, 171.5, 165), 
#   weight = c(81,93, 78),
#   Age = c(42,38,26)
# )
# print(BMI)
# ```
# 
# 
# # Get your Data into R
# # imports a multitude of packages designed to make your life much easier, a ecosystem and works together using a tidydata format
# ```{r dataImport}
# install.packages("tidyverse")
# library(tidyverse)
# ```
# 
# # Clean you data and reshape it
# ```{r cleanData}
# 
# # brings in a sample data set of "miles per gallon" in car manufacturers to tinker with
# 
# # dplyr and the pipe (piping the input into another action)
# mpg %>% 
#   
#   # return and filter models that are equal to a4
#   dplyr::filter(model == 'a4') %>% 
#   
#   # the previous output from the filter is now the input for arrange
#   # use the arrange function, sort by this, this and this
#   dplyr::arrange(displ, cyl) %>% 
#   
#   # create a new variable at the end "ageOfCar", using existing data while still retaining the old column
#   dplyr::mutate(ageOfCar = year < 2000, fullWheelDrive = drv == 'f') %>%  # add new preserve old
#   
#   
#   # if you wanna calculate, transform and completely replace the older data
#   # transmute give you back the field you asked for!
#   # dplyr::transmute(full_wheel_drive = drv == 'f')
#   
#   
#   # select explicitly or pipe all the output into select and say everything minus more columns below
#   dplyr::select(-drv, -trans, -year, -manufacturer, -model)
# 
# mpg %>%  # take the full data set to what it can do
#   dplyr::count(model, sort = TRUE) #return back 234 records if no condition
# 
# 
# ```
# 
# 
# # Make Some Graphics and plot with the GGPLOT package one of the biggest in R
# # graphical package that lets use complex highled detailed images used everywhere
# 
# 
# ```{r GGPLOTData}
# # ggplot(data = <DATA>) + 
# #   <GEOM_FUNCTION>(mapping = aes(<MAPPINGS>))
# 
# # geom_point is a scatter plot, mapping the aesthetic which represents "aes" to x and y axis of "miles per gallon" car data
# 
# # can you the previous pipe but can you a plus symbol to combine
# 
# # can use multiple geoms on your chart also
# 
# ggplot(data = mpg) + 
#   geom_point(mapping = aes(x = displ, y = hwy))
# 
# ggplot(data = mpg) + 
#   geom_point(mapping = aes(x = displ, y = hwy, color = class))
# 
# ggplot(data = mpg) + 
#   geom_point(mapping = aes(x = displ, y = hwy)) + 
#   facet_wrap(~ class, nrow = 2)
# 
# ggplot(data = mpg) + 
#   geom_point(mapping = aes(x = displ, y = hwy)) + 
#   facet_grid(drv ~ cyl)
# 
# ggplot(data = mpg) + 
#   geom_point(mapping = aes(x = displ, y = hwy)) 
# 
# ggplot(data = mpg) + 
#   geom_point(mapping = aes(x = displ, y = hwy)) +
#   geom_smooth(mapping = aes(x = displ, y = hwy))
# 
# ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
#   geom_point(mapping = aes(color = class)) + 
#   geom_smooth()
# 
# ggplot(data = diamonds) + 
#   geom_bar(mapping = aes(x = cut))
# ```
# 
# 
# # Examples of EDA
# 
# ```{r ExploratoryDataAnalysis}
# 
# 
# smaller <- diamonds %>% 
#   filter(carat < 3)
# 
# ggplot(data = smaller, mapping = aes(x = carat)) +
#   geom_histogram(binwidth = 0.3)
# 
# ggplot(data = mpg) +
#   geom_boxplot(mapping = aes(x = reorder(class, hwy, FUN = median), y = hwy))
# 
# diamonds %>% 
#   count(color, cut, sort = T) %>%  
#   ggplot(mapping = aes(x = color, y = cut)) +
#   geom_tile(mapping = aes(fill = n))
# 
# ```
# 
