# LendInvest Data Analyst Assessment

## Overview

This assessment demonstrates SQL, data modelling, and analytical skills applied within a financial services lending environment.

The submission is split into two parts:

Part 1 – Portfolio Snapshot Analysis
Part 2 – ETL Modelling and Conversion Funnel Analysis

The objective was to deliver clear analysis of portfolio performance and assess risk across the lending book.

---

## Part 1 – Portfolio Snapshot

### Approach

* Explored the loan portfolio
* Identified concentration risk
* Assessed default and arrears exposure
* Built SQL queries to analyse portfolio performance
* Created Excel visualisations

### Key Insights

* Development loans represent 51.89% of portfolio exposure
* Southern regions account for 55.36% of lending exposure
* Prime introducers show the highest default rate
* Medium LTV loans show unexpectedly elevated defaults
* These findings highlight a potential misalignment between perceived and actual risk, particularly within medium LTV segments where default rates are elevated despite traditionally lower risk expectations.
* Additionally, the concentration of exposure in development lending and southern regions suggests heightened sensitivity to market-specific downturns, which may amplify portfolio risk under adverse conditions.

---

## Part 2 – ETL Modelling

### Approach

* Created staging tables to clean raw application data
* Normalised product types and regions
* Converted LTV text values into numeric format
* Built a conversion funnel analytics mart to assess performance by product and region

### Key Transformations

* Parsed product fields into `product_type` and `sub_product`
* Standardised regional data
* Calculated LTV midpoints from range-based values
* Developed metrics to measure offer conversion

---

## Conversion Funnel Metrics

* Applications Count
* Offers Count
* Conversion Rate %
* Average Offer Amount

---

## Repository Structure

```
lendinvest-assessment/
├── README.md
├── part1-portfolio-snapshot/
├── part2-etl-modelling/
│   ├── data/
│   ├── sql/
│   └── analysis/
│       └── conversion_summary.xlsx
```

---

## Assumptions

* Missing offers were treated as non-conversions
* LTV ranges were converted using midpoint values
* Product fields were parsed based on naming conventions

---

## Challenges

* Cleaning inconsistent LTV formatting
* Parsing non-standardised product naming conventions
* Interpreting a relatively small dataset

---

## Additional Analysis

* Portfolio concentration analysis
* LTV segmentation analysis
* Conversion funnel analysis
* Overall portfolio health assessment
