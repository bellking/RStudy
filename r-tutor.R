# data.frame reference - column
head(mtcars[[2]])
class(mtcars[[2]])
head(mtcars[,2])
class(mtcars[,2])
# data.frame slice - column
head(mtcars[2])
class(mtcars[2])
# data.frame slice -row
L = mtcars$am == 0
mtcars[L,]
mtcars[L,]$mpg