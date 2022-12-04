Pre-research
================

``` r
nypd_complaint_2020_data = 
  read_csv("./data/nypd_complaint_2020_data.csv")
```

    ## Rows: 88484 Columns: 37
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ","
    ## chr  (21): cmplnt_to_dt, rpt_dt, ofns_desc, pd_desc, crm_atpt_cptd_cd, law_c...
    ## dbl  (14): cmplnt_num, month, day, year, addr_pct_cd, ky_cd, pd_cd, jurisdic...
    ## time  (2): cmplnt_fr_tm, cmplnt_to_tm
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

``` r
nypd_complaint_2021_data = 
  read_csv("./data/nypd_complaint_2021_data.csv")
```

    ## Rows: 101990 Columns: 37
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ","
    ## chr  (21): cmplnt_to_dt, rpt_dt, ofns_desc, pd_desc, crm_atpt_cptd_cd, law_c...
    ## dbl  (14): cmplnt_num, month, day, year, addr_pct_cd, ky_cd, pd_cd, jurisdic...
    ## time  (2): cmplnt_fr_tm, cmplnt_to_tm
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
