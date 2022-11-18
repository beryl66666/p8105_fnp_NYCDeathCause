Pre-research
================

``` r
cause_death_nyc = 
  read_csv("./data/New_York_City_Leading_Causes_of_Death.csv", na = ".") %>%
  janitor::clean_names() %>%
  filter(year == 2019) %>%
  arrange(desc(deaths))
```

    ## Warning: One or more parsing issues, see `problems()` for details

    ## Rows: 1272 Columns: 7
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ","
    ## chr (3): Leading Cause, Sex, Race Ethnicity
    ## dbl (4): Year, Deaths, Death Rate, Age Adjusted Death Rate
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

``` r
write.csv(cause_death_nyc,"D:/OneDrive/OneDrive - cumc.columbia.edu/Data Science R/p8105_fnp_NYCDeathCause/data/cause_death_nyc.csv", row.names = FALSE)
```
