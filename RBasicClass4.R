# 사용자 정의 함수

f1 <- function(){
  cat("매개변수가 없는 함수")
}

f1()

f3 <- function(x,y){
  add <- x + y
  return(add)
}
add <- f3(10,20)
add

test <- read.csv("test.csv",header=TRUE)
head(test)

summary(test)

str(test)

table(test$A)

data_pro <- function(x){
  for(idx in 1:length(x)){
    cat(idx,"번째 칼럼의 빈도 분석 결과")
    print(table(x[idx]))
    cat("\n")
  }
  
  for(idx in 1:length(x)){
    f <- table(x[idx])
    cat(idx,"번째 칼럼의 최대값/최소값\n")
    cat("max =",max(f),"min =",min(f),"\n")
  }
}

data_pro(test)

gugu <- function(i,j){
  for(x in i){
    cat("**",x,"단 **\n")
    for(y in j){
      cat(x,"*",y,"=",x*y,"\n")
    }
    cat("\n")
  }
}

i <- c(2:9)
j <- c(1:9)

gugu(i,j)

library(RSADBE)
data("Bug_Metrics_Software")
Bug_Metrics_Software[,,1]

rowSums(Bug_Metrics_Software[,,1]) # 행별 합계
rowMeans(Bug_Metrics_Software[,,1]) # 행별 평균

colSums(Bug_Metrics_Software[,,1]) # 열별 합계
colMeans(Bug_Metrics_Software[,,1]) # 열별 평균균

seq(-2,2,by=.2) # -2~2 범위에서 0.2씩 증가

vec <- 1:10
min(vec)
max(vec)
range(vec)
mean(vec)
median(vec)
sum(vec)
sd(rnorm(10))
table(vec)

# 난수 발생

n <- 1000
rnorm(n,mean=0,sd=1) #표준정규분표를 갖는 난수발생
hist(rnorm(n,mean=0,sd=1)) #히스토그램

n <- 1000
runif(n, min=0, max=10) # 정규 분포를 갖는 난수 생성하기
hist(runif(n, min=0, max=10))

# 집합 관련 내장함수
x <- c(1,3,5,7,9)
y <- c(3,7)
union(x,y) # 합집합
setequal(x,y) # 동일성 확인
intersect(x,y) #교집합합
setdiff(x,y) #차집합
5 %in% y # 5가 y의 원소인지 검사

install.packages("devtools")

devtools::install_github("rstudio/addinexamples", type = "source")

chart_data <- c(305,450,320,460,330,480,380,520)
names(chart_data) <- c("2018 1분기","2019 1분기","2018 2분기","2019 2분기",
                       "2018 3분기","2019 3분기","2018 4분기","2019 4분기")
str(chart_data)
chart_data

barplot(chart_data,ylim=c(0,600),
        col=rainbow(8),
        main="2018년도 vs 2019년도 매출현황 비교")

barplot(chart_data)

barplot(chart_data, horiz=T)

data(VADeaths)
VADeaths
str(VADeaths)
dim(VADeaths)
mode(VADeaths)
View(VADeaths) # V가 대문자

par(mfrow=c(1,2))

barplot(VADeaths)

dotchart(chart_data)
par(mfrow=c(1,1))
pie(chart_data)

boxplot(VADeaths)
summary(VADeaths)

data(iris)
str(iris)
dim(iris)
head(iris)
tail(iris)

summary(iris$Sepal.Length)
hist(iris$Sepal.Length)
hist(iris$Sepal.Width)

hist(iris$Sepal.Width, col="mistyrose", freq = F)
lines(density(iris$Sepal.Width),col="red")

x <- seq(2.0,4.5,0.1)
curve(dnorm(x,mean=mean(iris$Sepal.Width),
            sd=sd(iris$Sepal.Width)),
      col="blue",add=T)

price <- runif(10,min=1,max=100)
plot(price, col="red")

attributes(iris)
pairs(iris[iris$Species=="virginica",1:4])
pairs(iris[iris$Species=="setosa",1:4])

install.packages("scatterplot3d")
library(scatterplot3d)
iris_setosa=iris[iris$Species=='setosa',]
iris_versicolor=iris[iris$Species=='versicolor',]
iris_virginica=iris[iris$Species=='virginica',]

d3 <- scatterplot3d(iris$Petal.Length,
                    iris$Sepal.Length,
                    iris$Sepal.Width,
                    type='n')

d3$points3d(iris_setosa$Petal.Length,
            iris_setosa$Sepal.Length,
            iris_setosa$Sepal.Width,
            bg='orange', pch=21)
d3$points3d(iris_versicolor$Petal.Length,
            iris_versicolor$Sepal.Length,
            iris_versicolor$Sepal.Width,
            bg='blue', pch=23)
d3$points3d(iris_virginica$Petal.Length,
            iris_virginica$Sepal.Length,
            iris_virginica$Sepal.Width,
            bg='green', pch=25)
