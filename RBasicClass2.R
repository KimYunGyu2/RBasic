# 5 기본 함수와 작업 공간
args(max)

max(10,20,NA,30)

example(seq)

example(mean)

getwd()

c(1:20)

1:20

c(1,2,3,4,5)

seq(1,10,2) #(start, stop, step)

rep(1:3,3)

rep(1:3,each=3)

x <- c(1,3,5,7)
y <- c(3,5)

union(x,y)
setdiff(x,y) # 차집합
intersect(x,y) # 교집합

v1 <- c(33,-5,20:23, -2:3)
v1

v4 <- c(33,05,20:23,12,"4")
v4

v1;mode(v1);class(v1) # 여러 명령줄을 한줄로 한번에 실행

age <- c(30,35,40)
age

names(age) <- c("홍길동","이순신","강감찬") #컬럼명 지정
age

age <- NULL
age

a <- c(1:50)  # 백터 객체 생성
a
a[10:45]
a[19:(length(a)-5)] #10부터 백터 전체 길이에서 5를 뺀만큼 출력

v1 <- c(13,-5,20:23,12,-2:3)
v1
v1[1]
v1[c(2,4)]
v1[c(3:5)]
v1[c(4,5:8,7)]

v1[-1]
v1[-c(2,4)]
v1[-c(2:5)]
v1[-c(2,5:10,1)]

install.packages("RSADBE")

library("RSADBE")

data(Severity_Counts)
str(Severity_Counts)
Severity_Counts

#매트릭스 matrix

m <- matrix(c(1:5))
m

m <- matrix(c(1:10), nrow=2)
m

m <- matrix(c(1:11), nrow=2)
m

m <- matrix(c(1:10), nrow=2, byrow=T) # byrow=T 행우선
m

x1 <- c(5,40,50:52)
x2 <- c(30,5,6:8)
mr <- rbind(x1,x2)   # 행묶음으로 matrix 객체 생성
mr

mc <- cbind(x1,x2)  # 열 묶음으로 matrix 객체 생성
mc

m3 <- matrix(10:19,2)
m3

m4 <- matrix(10:20,2)
m4

mode(m3);class(m3)

m3[1,]
m3[,5]
m3[2,3]
m3[1,c(2:5)]

x <- matrix(c(1:9), ncol=3, nrow=3)
x
length(x)
ncol(x)

apply(x,1,max) # 1은 행을 나타낸다
apply(x,2,max) # 2는 열을 나타낸다

#사용자 정의 함수
f <- function(x) {
  x * c(1,2,3)
}
result <- apply(x,1,f)
result

result <- apply(x,2,f)
result

colnames(x) <- c("one","two","three")
x

# 다차원 array

vec <- c(1:12)
arr <- array(vec,c(3,2,2))
arr

arr[,,1]
arr[,,2]

mode(arr); class(arr)

library("RSADBE")
data("Bug_Metrics_Software")
str(Bug_Metrics_Software)
dim(Bug_Metrics_Software)

no <- c(1,2,3)
name <- c("hong","lee","kim")
pay <- c(150,250,300)
vemp <- data.frame(No=no,Name=name,Pay=pay) # 칼럼명 지정
vemp

m <- matrix(c(1,"hong",150,
              2,"lee",250,
              3,"kim",300),3,by=T)
m

memp <- data.frame(m)
memp

memp$X3

str(memp)

summary(memp)

