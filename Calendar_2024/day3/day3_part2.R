library(stringr)
library(dplyr)

# strip the don'() parts, here we go again day 3 regex coming in
text <- paste(readLines("data.txt"), collapse = "\n")
do_pattern <- "don't\\(\\)[\\s\\S]*?do\\(\\)"
re_pattern <- "mul\\((\\d{1,3}),(\\d{1,3})\\)"
result <- gsub(do_pattern, "", text, perl = TRUE)

total_sum <- result %>%
  str_extract_all(re_pattern) %>%
  unlist() %>%
  str_match(re_pattern) %>%
  as.data.frame() %>%
  mutate(
    x = as.numeric(V2),
    y = as.numeric(V3)) %>%
  transmute(prod = x * y) %>%
  summarise(ans = sum(prod))
total_sum$ans

