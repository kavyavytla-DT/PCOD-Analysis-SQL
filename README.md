
#  PCOD Patient Data Analysis Using SQL

This project presents an SQL-based analysis of patients diagnosed with Polycystic Ovarian Disease (PCOD). Using a normalized relational data model, the project investigates relationships between lifestyle, mental health, hormone levels, and treatment adherence.

##  Case Scenario

Metropolis Medical Center has launched a PCOD initiative to understand how lifestyle, hormones, and treatment effectiveness interact. This project models a comprehensive PCOD database and performs clinical SQL queries to support research and care optimization.


## Key SQL Queries & Reports

| # | Query Objective 
| 1 | Average age of PCOD patients and top reason for hospital visits |
| 2 | Average calorie intake by age group |
| 3 | BMI analysis across different age groups |
| 4 | Billing summary by diagnosis |
| 5 | Depression levels and their impact on treatment |
| 6 | Correlation between calorie intake and insulin levels |
| 7 | Estrogen levels in patients with infertility |
| 8 | Patients with irregular menstruation and high anxiety |
| 9 | Patients who adhere to meds and have low anxiety |
|10 | Patients with both irregular cycles and extreme anxiety |

 SQL File: `queries/queries_and_reports.sql`  

##  Entity-Relationship Structure

Key entities:
- `Patient`
- `Hormone`, `MentalStatus`, `Diet`, `Exercise`
- `MenstrualCycle`, `Medication`, `Disease`
- `Encounter`, `Billing`, `Physician`

 For detailed attributes and relationships, see [`docs/final_project_slides.pdf`].
 
##  Built Using

This project was developed as part of the Health Informatics curriculum at Northeastern University, leveraging the following tools and technologies:

- SQL (Structured Query Language) 
  Used to query and analyze relational data from simulated PCOD patient records.

- MySQL / PostgreSQL   
  Any standard RDBMS can be used to execute the queries and model the schema.

- Relational Data Modeling
  Normalized schema design representing clinical entities such as hormones, mental health, medication adherence, diet, menstrual cycles, and comorbid conditions.

- EER Diagrams
  Enhanced Entity-Relationship diagrams were used to visualize patient relationships, foreign key constraints, and one-to-many cardinalities.

## Goals

This project demonstrates:
- SQL-based patient data mining
- Use of normalized clinical schemas
- Queries focused on lifestyle, reproductive health, and mental health
- Foundations for building analytical dashboards or BI layers.

