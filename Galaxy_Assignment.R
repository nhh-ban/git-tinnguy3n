# Problem 2 - Galaxy Assignment

library(tidyverse)


# Read in datafile
raw_file <- readLines(con = "UCNG_Table4.txt")

# Find the line
substr(x = raw_file, start = 2, stop = 3) 

L <-
  which((substr(x = raw_file, start = 2, stop = 3) == "--"))
  

# Extract variable descriptions to text file
cat(raw_file[1:(L-2)], sep = "\n", file = "variable_description")
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





# Problem 3 - Star size and plot

# Read in datafile
raw_file2 <- readLines(con = "suites_dw_Table1.txt") 



# Have to follow same process as above to get tidy data frame

# Find the line
substr(x = raw_file2, start = 2, stop = 3) 

L2 <-
  which((substr(x = raw_file2, start = 2, stop = 3) == "--"))

# Extract variable descriptions to text file
cat(raw_file2[(L2-1):(L2-1)], sep = "\n", file = "variable_description2")
variable_des2 <- readLines("variable_description2")

# Extract variable names in a vector
variable_names2 <- 
  str_split(string = variable_des2 , pattern = "\\|") %>% 
  unlist() %>% 
  str_trim()

# Comma separated values
comma_separated_values2 <- 
  raw_file2[(L2 + 1):810] %>% 
  gsub("\\|", ",", .) %>% 
  gsub(" ", "", .)

# Separated values with variable name
comma_separated_values_with_name2 <-
  c(paste(variable_names2, collapse = ","),
    comma_separated_values2)

# Create new file
cat(comma_separated_values_with_name2, sep = "\n", file = "Galaxy_data2")

galaxies2 <- read_csv("Galaxy_data2")     # Clean dataframe


# Now we can create a plot and analyze

galaxies2 %>% 
  ggplot(aes(x = delta_vlg, y = a_26)) + 
  geom_point() + 
  xlab("Line of sight velocity relative to MD") + 
  ylab("Linear diameter in kpc") +
  theme_classic()

# I am unsure if this is the correct method for solving this problem. 

# We can see that a lot of small galaxies have a low line of sight velocity 
# relative to MD which can make it harder to study these galaxies, and therefore
# have been left out because of lack of content. 

# However there are some small galaxies with very high line of sight velocity,
# and the biggest galaxy has a line of sight velocity close to zero. This 
# is contradicting the explanation above.

  


