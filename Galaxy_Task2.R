# Task 2 - Galaxy Assignment

library(tidyverse)


# Read in datafile
raw_file <- readLines(con = "UCNG_Table4.txt")

# Find the line
L <-
  substr(x = raw_file, start = 2, stop = 3) %>% 
  grep("--", ., value = TRUE) %>% 
  head(2)

# Extract variable descriptions to text file
cat(raw_file[1:1], sep = "\n", file = "variable_description")
variable_des <- readLines("variable_description")

# Extract variable names in a vector
variable_names <- 
  str_split(string = variable_des , pattern = "\\|") %>% 
  unlist() %>% 
  str_trim()


# Comma separated values
comma_separated_values <- 
  raw_file[3:763] %>% 
  gsub("\\|", ",", .) %>% 
  gsub(" ", "", .)

# Separated values with variable name
comma_separated_values_with_name <-
  c(paste(variable_names, collapse = ","),
    comma_separated_values)


# Create new file
cat(comma_separated_values_with_name, sep = "\n", file = "Galaxy_data")

galaxies <- read_csv("Galaxy_data")     # Clean dataframe




