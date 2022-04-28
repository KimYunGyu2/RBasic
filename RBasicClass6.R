# 데이터 결합하기 - 2개 이상의 테이블을 결합하여 하나의 테이블로 만드는 과정
#                   세로 결합과 가로 결합이 있다.

# 세로 결합 - 변수명(열의 이름)을 기준으로 결합한다.
#              bind_rows(테이블명, 테이블명)

library(readxl)

m_history <- read_excel("Sample2_m_history.xlsx")
f_history <- read_excel("Sample3_f_history.xlsx")

View(m_history)
View(f_history)
library(dplyr)
data_bindjoin <- bind_rows(m_history, f_history)
View(data_bindjoin)

# 남성 내역 아래에 여성의 내역이 세로로 결합되어 10개의 관측치를 가진
# 세로로 결합된 테이블 data_bindjoin 이 생성 되었다.

# 가로 결합 - 가로 결합은 세로에 비해 조금 복잡하다. 기준이 되는 by="변수명"에
#            사용할 변수명이 필요하다. 이것을 키변수라고 한다.
#            키 변수는 결합할 각 테이블에 있어야 하고 한쪽이라도 없으면 실행되지 않는다.
#             방법이 3가지

jeju21 <- read_excel("Sample4_y21_history.xlsx")
jeju20 <- read_excel("Sample5_y20_history.xlsx")

#방법1. 첫번째 테이블을 기준으로 가로로 결합
left_bindcol <- left_join(jeju21, jeju20, by="ID")
View(left_bindcol)
View(jeju21)
View(jeju20)

# jeju21에는 변수 6개와 관측치 8개, jeju20에는 변수가 3개 그리고 관측치가 9개가 있다.
# 이 두 테이블에는 모두 ID변수를 포함하고 있어 그것으로 결합을 하게 된다.

# jeju20 테이블 id가 9가 없기 때문에 NA이 대신 삽입되었다.
# left_join() 함수는 첫번째 테이블과 키 변수를 기준으로
# 두번째 테이블에 있는 나머지 변수들을 결합한다.

#방법2. 키 변수가 동일할 때만 가로로 결합
innerjoin_bindcol <- inner_join(jeju21, jeju20, by="ID")
View(innerjoin_bindcol)
# 두 테이블에서 키변수 ID 변수가 동일한 관측치 들의 값만 기준으로 8개의 변수를
# 가진 테이블이 생성 되었다. left_join()과 달리 ID 변수가 일치하지 않는 데이터들은
# 결합되지 않는다.

#방법3. 모두 가로 결합
fulljoin_bindcol <- full_join(jeju21, jeju20, by="ID")
View(fulljoin_bindcol)

# full_join() 함수로 가로 결합을 하면 가장 많은 데이터를 가지게 된다. ID 값을 
# 기준으로 두개 테이블의 모든 데이터가 다 결합된다. 그리고 값이 없는 데이터에는
# NA이 삽입된다. 최종 관측치 10 그리고 변수는 8개 보이게 된다.

# left_join A-B
# inner_join A∩B
# full_join A∪B

# b를 기준으로 결합하는 right_join()함수도 존재한다.

# Quiz 1. exdata1 테이블에서 AGE가 30세 이하이면서 Y20_CNT 가 10건 이상인
# 데이터를 exdata2 테이블로 생성하시오 (파이프 연산자 사용)
# 행에서는 filter() 열에서는 select()

exdata1 <- read_excel("Sample1.xlsx")
exdata2 <- exdata1 %>% filter(AGE <= 30 & Y20_CNT >= 10)
View(exdata2)


# Quiz 2. exdata2를 AGE 변수를 기준으로 내림차순 Y20_CNT 변수를 기준으로 오름차순

exdata2 %>% arrange(desc(AGE), Y20_CNT)

# Quiz 3. exdata1, exdata2 테이블에서 ID 변수를 기준으로 가로 결합 full_join

full_join(exdata1, exdata2, by="ID")


# 데이터 구조 변형하기  reshape2 패키지 ... melt(), cast()

# 데이터 재구조화 - 같은 시간에 같은 버스를 타는 사람에 대해 정리된 데이터로
#                   시간에 따른 분석, 탑승위치에 따른 분석, 성별에 따른 분석 등
#                   다양한 시각에서 살펴볼수 있다. 동일한 데이터가 있더라도 바라보는
#                   관점에 따라서 분석의 방향이 달라진다. 그에따라 데이터의
#                   구조를 변형할 필요가 있다

install.packages("reshape2")
library(reshape2)

# melt() 열과 행을 뒤집어준다. 넓은 모양의 데이터를 긴 모양으로 변경

head(airquality)

# 일반적으로 R 열이름을 모두 소문자로 바꾸어 사용하는 경우가 많다.

names(airquality) <- tolower(names(airquality))
head(airquality)

str(airquality)

melt_air1 <- melt(airquality)

# 첫번째 행에 있던 ozone 변수와 변수값으로 변형이 되었다. 기준이 될 열을 지정하지 않아서
# 모든 열이 반환되었다. 변수명이 variable 열의 값이 된다.

tail(melt_airquality)

# 기준열에 따라 데이터를 변형하기 위해서 month, wind 변수를 지정하고 ozone 값을
# 반환하도록 해보자.

melt_air2 <- melt(airquality, id.vars=c("month","wind"), measure.vars="ozone")
head(melt_air2)

# month 와 wind 변수를 기준으로 데이터 변형되어 ozone 값이 출력된것을 확인할수 있다.

# iris 데이터셋의 변수명을 모두 소문자로 변경하고 앞6개만 출력하시오
names(iris) <- tolower(names(iris))
head(iris)

# sepal.length 변수가 행이 되도록 구조를 변경하는 코드를 작성하여 species변수를 반환하도록
# 작성하시오
melt_iris <- melt(iris, id.vars="species", measure.vars="sepal.length")
head(melt_iris)
View(melt_iris)
