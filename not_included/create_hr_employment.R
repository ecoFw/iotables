library ( dplyr) ; library (tidyr)

hr_emp <- readxl::read_excel(
  path = "not_included/Croatia_labour_matching.xlsx"
) %>% select ( t_cols2, employment) %>%
  filter ( !is.na(t_cols2)) %>% 
  mutate ( row = 1:nrow(.)) %>%
  spread ( t_cols2, employment ) 

employment_hr <- data.frame (
  code = colnames (hr_emp[, 2:ncol(hr_emp)]), 
  employment = as.numeric(colSums(hr_emp[, 2:ncol(hr_emp)] , na.rm = TRUE))
)
  
#employment_hr <- as.data.frame(t (as.matrix ( colSums(hr_emp[, 2:ncol(hr_emp)] , na.rm = TRUE))))

croatia_employment_2013 <- iotables::metadata %>%
  filter ( group == "Product") %>%
  filter ( variable == "t_cols") %>%
  left_join ( employment_hr) %>%
  select ( code, iotables_label, employment ) %>%
  filter ( stats::complete.cases(.)) %>%
  mutate_if (is.factor, as.character) %>%
  dplyr::rename ( iotables_row = iotables_label)

devtools::use_data (croatia_employment_2013, overwrite = TRUE)

