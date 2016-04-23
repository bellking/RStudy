# Factor
# Factor는 범주형(Categorical) 데이터를 표현하기 위한 데이터 타입이다.
# 범주형(Categorical) 데이터는 또 다시 명목형(Norminal)과 순서형(Ordinal)로 구분된다.
# 범주형 변수가 담을 수 있는 값의 목록을 수준(Level)이라고 한다.
# 범주형 데이터에 상바노디는 데이터는 수치형(Numerical) 데이터가 있다.
sex <- factor(c("m","m","f","m"),c("m","f"))
nlevels(sex)
levels(sex)
sex[1]
levels(sex) <- c("male","female")
grade <- factor(c("A","C","B","C"),c("A","B","C"),ordered=TRUE)
size <- ordered(c("L","S","M","M"),c("L","M","S"))

# Vector
# 다른 프로그래밍 언어의 배열과 동일(동일한 스칼라 데이터 타입을 가짐)
# 슬라이스(Slice)란 배열의 일부를 잘라낸 뒤 이를 또 다시 배열처럼 다루는 개념이다.
# 또한, 백터의 각 셀에는 이름을 부여할 수 있다.
x <- c(1,3,4)
names(x) <- c("one","three","four")
len_x <- length(x)
cnt_x <- NROW(x) # NROW는 백터와 행렬에 모두 사용. nrow()는 행렬만 사용
x[1]
x[1:2]
x[-2]
x[c(1,3)]
x["one"]
identical(c(1,2,3),c(1,2,3,4))
1 %in% x
"one" %in% x
y <- x * 5 # name은 그대로 가져감. 주의 필요
names(y) <- c("five","fifteen", "twenty")
x == y # name은 left에 따라감
y == x
union(x,y)
intersect(x,y)
setdiff(x,y)
setequal(x,y)
z = c(1,3,3,4)
setequal(x,z) # 구성요소가 동일할 경우(갯수 무관)
i = c(1,3,4)
names(i) = c("1","3","4")
identical(x,i) # name, 요소, 요소 수까지 모두 동일할 경우
a = seq(10,1,-2)
seq_along(a)
rep(c(1,2,3),times=3,each=2)
## 참고 rm(), ls(), rm(ls()) X, rm(l=ls()) O

# List : (key,value)
x <- list(name="foo",height=c(1,3,5))
y <- list(a=list(val=c(1,2,3)),b=list(val=c(4,5,6)))
z <- list(c("r1","r2","r3"),c("c1","c2","c3")) # key가 정해지지 않은 list  ??Name을 정하려면?
x$name
y$a$val
x[1]
x[[1]]

# Matrix : 수학 시간 행렬과 동일(동일한 유형의 스칼라) /2차원
m1 = matrix(1:9, nrow=3, byrow=TRUE, dimnames=list(c("r1","r2","r3"),c("c1","c2","c3"))) #dimnames는 열 우선
dimnames(m1)
rownames(m1)
colnames(m1)
m1[1:2,]
m1[-1,]
m2 <- m1 + 2
m3 <- m1 +m2
m4 <- m1 %*% m2
m5 <- t(m1) # 전치행렬의 경우 dimnames도 따라간다.
nrow(m1)
ncol(m1)
dim(m1)
mm <- matrix(1:4,ncol=2)
mn <- solve(mm)
mo <- mn %*% mm
mp <-solve(mm,mo)
ma <-matrix(c(2,3))

# Array : 다차원 Matrix
a1 <- array(c(1:8),dim=c(2,2,2),dimnames=list(c("F1","F2"),c("S1","S2"),c("T1","T2")))
View(a1)
a1
dim(a1)
a1[-1,,]

# Dataframe : 정말 중요
d1 <- data.frame(x=c(1,2,3,4,5), y=c(2,4,6,8,10), z=c("M","F","M","F","M")) # 문자열은 기본으로 factor이며 stringAsFactor=FALSE 지정하여 문자로 할 수 있음.
d1[2,3]
d1[2,3,1] # 왜 오류가 나지 않는지?
d1[c(2,3,4),3]
d1[c(2,3,4),]
d1[,c("x","z")]
d1[,2] # 1차원일 경우 벡터로 반환, 형 변환을 하지 않으려면 drop=FALSE 옵션을 지정해야 함.
d1[,2, drop=FALSE]
d1[, !names(d1) %in% c("x")]
d1$y <- 6:10
d1$w <- d1$x * 2
str(d1)
head(d1)
tail(d1)
View(d1)
x <- data.frame(1:3,4:6)

# 타입 판별
class(c(1,2)) # 벡터 내 스칼라 타입을 반환(numeric, logical, character, factor)
class(matrix(c(1,2)))
class(list(c(1,2)))
class(data.frame(x=c(1,2),y=c(3,4)))
str(c(1,2)) # 벡터 내 스칼라 타입을 반환(numeric, logical, character, factor)
str(matrix(c(1,2)))
str(list(c(1,2)))
str(data.frame(x=c(1,2),y=c(3,4)))
is.data.frame(c(1,2,3))

# 타입 변환
v = c(1,2,3,1,2,3,4)
f = as.factor(v)
as.factor(c("m","f"))
factor(c("m","f"),levels=c("m","f"))
