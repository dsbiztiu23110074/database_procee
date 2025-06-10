library(tidyverse)

d <- data.frame(
  name = c("太郎", "花子", "三郎", "良子", "次郎", "桜子", "四郎", "松子", "愛子"),
  school = c("南", "南", "南", "南", "南", "東", "東", "東", "東"),
  teacher = c("竹田", "竹田", "竹田", "竹田",  "佐藤", "佐藤", "佐藤", "鈴木", "鈴木"),
  gender = c("男", "女", "男", "女", "男", "女", "男", "女", "女"),
  math = c(4, 3, 2, 4, 3, 4, 5, 4, 5),
  reading = c(1, 5, 2, 4, 5, 4, 1, 5, 4) )

d

library(dplyr)
a <- select(d, name, math)
print(a)


a_1 <- select(d, -gender)
print(a_1)

a_2 <- slice(d, 3:6)
print(a_2)

a_3 <- arrange(d, name)
print(a_3)

a_4 <- arrange(d, desc(math))
print(a_4)

a_5 <- arrange(d, desc(math),desc(reading))
print(a_5)

a_6 <- select(d, name, reading)
print(a_6)

a_7 <- d %>%
  summarise(math_mean = mean(math))
print(a_7)

a_8 <- d %>%
  group_by(teacher) %>%
  summarize(math_mean = mean(math))
print(a_8)

a_9 <- filter(d, gender == "女")
print(a_9)

a_10 <- filter(d, school == "南" & gender == "男")
print(a_10)

a_11 <- d %>%
  group_by(teacher) %>%
  filter(n() >= 3) %>%
  ungroup()
print(a_11)

a_12 <- d %>%
  mutate(total = math + reading)
print(a_12)

a_13 <- d %>%
  mutate(math100 = (math / max(math)) * 100)
print(a_13)