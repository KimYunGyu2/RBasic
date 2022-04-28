# 데이터 정제

# 원시 데이터 raw data 에는 관측치 만이 아니라 결측치(누락값)와
# 일반적인 값보다 편차가 현저히 크거나 작은 이상치가 많이 있다.
# 분석을 할때 오류가 발생되거나 불석 결과 자체를 왜곡시킬수 있다.
# 데이터 분석에서 가장 중요한 과정이 바로 결측치와 이상치를 처리하는데이터 정제이다.

# 결측치 확인
# 결측치는 결측값, 누락값 NA (Not Available) 로 표현한다. 결측치가 있는 경우
# 연산을 한 결과도 NA로 나오므로 결측치를 제외/제거 하거나 또는 다른 값으로 대체 해야 한다.

# 결측치를 확인하는 함수 is.na(변수명)

# table(is.na(변수명)) <-- 결측치 빈도를 확인.

x <- c(1,2,NA,4,5)
sum(x)
is.na(x)
table(is.na(x))

# sum() 함수로 데이터의 합걔를 구했지만 결과로 NA이 나온다. 연산시 NA 이 있으면
# 결과도 NA로 나오게 된다. is.na() 결측치를 확인하였을때 TRUE값이 나오면 결측치가
# 있다는 의미이다. 하지만 가독성이 떨이지므로 table(is.na(변수명)) 빈도를 계산하여
# 주므로 결측치 개수를 알수 있다.

sum(x, na.rm = T)

# na.rm = T 옵션을 지정하면 결측치를 제외하고 계산 결과를 반환한다.

data("airquality")
is.na(airquality)

table(is.na(airquality))  # 결측치와 아닌것들의 개수
sum(is.na(airquality))    # 전체의 결측치의 개수
colSums(is.na(airquality)) # 열별로 각각의 결측치의 계산


# 결측치 처리 / 제거

# na.omit(변수명)
# 결측치가 존재하는 행 전체를 제거한다.

na.omit(airquality)
table(is.na(airquality))

# 결측치 대체하기

# 변수명[is.na(변수명)] <- 대체값

data("airquality")
airquality[is.na(airquality)] <- 0
colSums(is.na(airquality))


# 이상치 확인
# 이상치는 극단치라고도 부른다. 데이터에서 정상적인 범주를 벗어난 값을 말한다.
# 이상치는 결과를 왜곡하기 때문에 결측치로 만들어 처리한다.
# 이상치는 어떻게 파악할수 있을가. bowplot 을 이용하면 쉽게 파악 가능하다.

data(mtcars)
boxplot(mtcars$wt)

# 윗수염을 벗어난 값은 이상치로 볼수 있다.

boxplot(mtcars)$status

# 이상치 처리

# 이상치 -> 결측치 -> 0 / 평균 / 최빈

mtcars$wt > 5.25

mtcars$wt <- ifelse(mtcars$wt >5.25, NA, mtcars$wt)

mtcars$wt > 5.25


y2 <- c(-16,22,31,NA,52,66,74,88,99,105,200,253,NA)

#y2 데이터의 결측치를 확인하세요 2가지

is.na(y2)
table(is.na(y2))

# y2 데이터의 결측치를 제거한 평균을 구하는 코드를 작성하세요

mean(y2, na.rm = T)

# y2 데이터의 결측치를 100으로 대체하고 평균을 구하시오

y2 <- ifelse(is.na(y2), 100, y2)
mean(y2)

# ggplot2 (reshape2, dplyr 패키지들을 만든 해들리 위컴이 만든 ggplot2)

# 기본 그래프를 그리고 그안에 다양한 옵션을 계속 포개는 방식으로 그래프를 표현한다.




