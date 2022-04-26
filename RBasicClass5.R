# 데이터 가공하기
# dplyr 패키지 - 데이터분석 필수 패키지

install.packages("dplyr")
library(dplyr)

nrow(mtcars)
str(mtcars)

# mtcars 연비 실린더 개수 등 연료소비와 관련된 변수 11개
# 자동차 32종의 모델 정보가 담긴 데이터셋

# 데이터 추출과 정렬
# 원하는 데이터만 추출하거나 순서를 정렬

# 행추출 filter() 함수 - 조건에 맞는 데이터를 필터링

# 조건 1 - 실린더 기통 4인 자동차만 추출

filter(mtcars, cyl==4)

# 조건 2 - 실린더 기통이 6 이상이고 연비가 20 을 초과

filter(mtcars, cyl >= 6 & mpg > 20)

# 열추출 select() 함수 - 지정한 변수만 추출할때 사용

select(mtcars, mpg, hp)

# 분명히 문법에는 이상이 없으나 실행이 안되거나 오류가 발생할때는
# 어떤 불특정 이유로 인해 dplyr에 있는 select이 실행이 되지 않고
# 다른 패키지의 select이 실행되는 경우 발생한다.

dplyr::select(mtcars, mpg, hp)
# 특정 패키지의 이름까지 적으면 해당 패키지의 함수가 실행된다.

# 정렬 arrange() - 데이터를 오름차순 또는 내림차순 정렬

arrange(mtcars, wt)

head(arrange(mtcars, wt)) # 상위 6개만 출력

head(arrange(mtcars, mpg, desc(wt))) # 처음 기준 mpg는 오름차순, 두번째기준  wt는 내림차순

# 정렬의 기준이 여러개 일때는 처음 기준으로 정렬을 하고
# 그중에 같은 값은 두번째 기준으로 정렬하게 된다.

# 열추가 mutate() 함수 데이터 셋에 열을 추가할때 사용
# 기존 열을 가공하여 그 결과로 새로운 열을 만든다.

# years 열을 만들어서 1974를 모두 일괄 적용
mutate(mtcars, years = "1974")

mutate(mtcars, mpg_rank = rank(mpg))
# rank 함수는 데이터의 순위를 확인할때 사용한다. 기본은 오름차순
# 값이 같을때는 소수점 순위로 반환한다.

# 중복값 제거 distinct() 함수 - 중복된 데이터를 제거할때 사용된다.

# 고유한 1개의 데이터만 추출
distinct(mtcars, cyl)

distinct(mtcars, gear)

distinct(mtcars, cyl, gear) # 각각의 열의 모든 값이 동일할 때만 제거

# summarise() 함수 - 데이터 요약 확인, 기술 통계함수와 함께 사용한다.

summarise(mtcars, cyl_mean = mean(cyl), cyl_min = min(cyl), cyl_max = max(cyl))

# group_by() 함수 - summarise() 함수는 데이터 전체 요약, 부분별 요약은 group_by()

gr_cyl <- group_by(mtcars, cyl)
summarise(gr_cyl, n())

# cyl 열을 그룹으로 개수는 총 3가지 4,6,8 이며 이에 따른 갯수는 11,7,14 인것을 볼수있다.