# SQL Data Cleaning, Merging, and Visualization Project in Tableau

## Project Overview

This project analyzes Personio's four strategic business priorities using a fictional dataset. Personio, a provider of all-in-one HR software for small and medium enterprises (SMEs), is focused on the following objectives:

1. **International Expansion**: Increasing their addressable market.
2. **Expanding Payroll Offerings**: Doubling revenue per customer by enhancing payroll services.
3. **Strengthening the Mid-Market Segment**: Improving profitability by focusing on the mid-market.
4. **Establishing People Workflow Automation (PWA)**: Differentiating in the market by building PWA as a category.

To support these objectives, the project involves two key tasks:

1. **Data Cleaning and Merging using SQL**: Data from different sources (e.g., MRR, NPS) is cleaned, processed, and merged to form a unified dataset for analysis. This includes handling downgrades, removing duplicates, and creating detailed tables for MRR and customer satisfaction (NPS).
2. **Data Visualization using Tableau**: The cleaned dataset is visualized to track key trends related to customer MRR, NPS scores, and segmentation. Tableau visualizations offer insights into revenue movements, customer churn, and the overall business impact of strategic objectives. A PowerPoint presentation summarizes the findings and recommendations.

The objective of this analysis is to provide data-driven insights that align with Personio’s broader strategic goals.

## Part 1: SQL Data Cleaning and Merging

### Steps Performed:

1. **Left Join - Customer, MRR New, and NPS**:
    - The SQL script starts by performing a left join to merge the customer data with MRR (Monthly Recurring Revenue) movements and NPS (Net Promoter Score) information. This combines important customer attributes with financial and performance metrics.
2. **Handling Downgrades as Negative Values**:
    - Downgrades in MRR are treated as negative values. The SQL script updates the relevant tables to reflect this, ensuring that decreases in MRR are accurately captured.
3. **Removing Duplicate Rows**:
    - Duplicate rows in the dataset were removed to ensure that each company ID had only one entry. Aggregation functions such as `ANY_VALUE`, `MAX`, and `SUM` were used to retain the most relevant values and sums for each company.
4. **Creating Month Columns**:
    - New columns were added to track the month for key dates (e.g., Activation, Churn, Movement, and NPS). These columns allow for easier time-based analysis and future visualization.
5. **Adding Segment Categories**:
    - Company size categories (Small, Medium, Large) were added based on the size of each company. This segmentation helps in grouping companies for analysis.
6. **Creating the `mrr_detailed` Table**:
    - A new detailed table was created by merging the MRR movements with customer NPS data. This detailed table provides granular information on each customer’s revenue movements and performance metrics.
7. **Creating Payroll Columns**:
    - Additional columns were created to track payroll data, checking if the revenue doubled and whether the customer was associated with payroll services. Ratios were calculated to track MRR movement in relation to initial MRR.
8. **Creating the `nps_detailed` Table**:
    - A new table was created to merge the NPS data with the MRR movements. Additional columns were added to track if the customer was using People Workflow Automation (PWA) and whether MRR movements occurred before, after, or on the same day as NPS data was received. This table allows for detailed analysis of how customer satisfaction (as measured by NPS) correlates with revenue movements.

### SQL Scripts:

The scripts contain all of the SQL queries used for data cleaning and merging, ensuring accurate and actionable data.

## Part 2: Data Visualization (Tableau)

The data from the SQL process was used to create visualizations and analyse data in Tableau. 

The conclusions and insights derived from these visualizations were presented in a PowerPoint presentation, which can also be referred to on ([https://www.notion.so/clarabeldarrain/Analyzing-Personio-s-Strategic-Priorities-to-Develop-a-Data-Driven-Action-Plan-ba0eac37099240889b0227460f43ac4e](https://www.notion.so/ba0eac37099240889b0227460f43ac4e?pvs=21)).

## Installation and Setup:

- To run the SQL scripts, you can use any SQL database such as MySQL, PostgreSQL, or any other relational database system.
- For Tableau visualizations, the dataset generated through the SQL queries can be imported into Tableau Desktop.
