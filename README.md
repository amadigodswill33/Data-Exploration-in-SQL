# COVID-19 Data Exploration

## Table of Contents

- [Project Description](#project-description)
- [Project Focus](#project-focus)
- [Data Source](#data-source)
- [Tools](#tools)
- [Project Overview](#project-overview)
- [How to Use the Script](#how-to-use-the-script)
- [Results and Impact](#results-and-impact)
- [Skills Demonstrated](#skills-demonstrated)
- [Conclusion](#conclusion)

## Project Description
Welcome to the COVID-19 Data Exploration project! This impactful data analytics endeavor utilizes advanced SQL queries to unearth critical insights from the intricate web of COVID-19 data. By synergizing information from the 'Covid Vaccination$' and 'Covid death$' tables, this project seeks to significantly contribute to our understanding of the dynamic nature of the pandemic, with a primary focus on Nigeria and the broader West African region.

## Project Focus
The main geographical focus of this analysis revolves around Nigeria and the West African region.

## Data Source
The COVID-19 dataset used in this project was retrieved from Kaggle.

## Tools
Excel,
SQL Server,
Tableau

## Project Overview
### 1. Data Cleaning/Preparation (Excel)
In this stage, the COVID-19 dataset undergoes meticulous cleaning and preparation using Excel. By addressing the following:
- Missing Values
- Data cleaning and Standardizing formats

### 2. Exploration Data Analysis (SQL Server)
EDA involves thorough exploratory data analysis (EDA) techniques using advanced SQL queries to answer key questions, such as:
- What is the total number of cases recorded to date
- What is the Infection rate
- What is the perspective of COVID-19 in Nigeria (Death count, Infection rate) compared to other West African countries
- What is the global perspective of COVID-19 (Death count, people vaccinated, and percentage infected)
### 3. Data Analysis
In the final phase, the real power of the project emerges through advanced data analysis techniques. Key objectives encompass understanding:

- Infection rates
- Death counts
- Vaccination strategies, and
- Deriving meaningful insights contributing to our comprehension of the COVID-19 pandemic in West Africa and Nigeria.
  
## How to Use the Script
### 1. Clone the repository.
### 2. Execute the script in an SQL environment connected to the 'Portfolio_project1' database.

``` sql
SELECT *
FROM Portfolio_project1..['Covid Vaccination$']
WHERE location = 'Nigeria'
ORDER BY 3,4;
```

## Results and Impact
Our deep dive into COVID-19 data has uncovered some pretty interesting findings. They are as follows:

- Global Insight: The worldwide death count has reached a staggering 6,955,484, and about 9.71% of the global population has been infected.

- Country Spotlight: Nigeria leads the pack with 266,675 cases among other West African countries, while Sierra Leone trails behind with 7,762 cases.

- Infection Rates: The infection rate varies across countries. In West Africa, Cape Verde tops the list with 6.11% of its total population, while Niger reports the lowest at 0.02% of its total population.

- Nigeria's Situation: In Nigeria, we've got 266,675 cases, and sadly, 3,155 people have lost their lives, giving us a mortality rate of 1.18%.

For a deeper dive, check out our [dashboard Here](https://public.tableau.com/app/profile/godswill.amadi/viz/Covid-19DataProject_17044710666880/Dashboard1?publish=yes). It's got time-series graphs, a geo-map, and more to explore!

## Skills Demonstrated
- Advanced SQL querying
- Data analysis and interpretation
- Statistical analysis and modeling
- Time-series analysis
- Data visualization using Tableau

## Conclusion
Thank you for exploring the COVID-19 data with us! Here's a snapshot of what we've found:
- The global impact is huge, with significant death counts and infection percentages.
- Nigeria is faced with its own set of challenges, leading in case counts and mortality rates in West Africa.
- Infection rates across countries in West Africa show a diverse spread, with Cape Verde facing a considerable impact.
The dashboard is there for you to play around with, offering more insights into trends and geographical patterns. [View Dashboard](https://public.tableau.com/app/profile/godswill.amadi/viz/Covid-19DataProject_17044710666880/Dashboard1?publish=yes).

## Recommendation
This project is open to contributions. Feel free to suggest improvements, report issues, or propose extensions to the analysis.

#### Thanks for joining us on this exploration!
