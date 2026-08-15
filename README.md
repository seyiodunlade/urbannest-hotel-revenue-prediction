# UrbanNest Hospitality Analytics — Hotel Revenue Prediction

An end-to-end data science capstone project analysing hotel booking demand data to identify key revenue drivers and build a predictive model for hotel booking revenue.

---

## Project Overview

This project answers the question:
> *"What factors drive hotel booking revenue, and can we build a reliable model to predict booking value based on guest and booking characteristics?"*

**Client:** UrbanNest Hospitality Analytics  
**Data Period:** July 2015 – August 2017  
**Model:** Optimised Linear Regression  
**Final R² Score:** 0.7844 | **MAE:** $86.63

---

## Suggested Repo Name

```
urbannest-hotel-revenue-prediction
```

---

## Repository Structure

```
urbannest-hotel-revenue-prediction/
│
├── README.md                                    # Project documentation
├── hotel_bookings.csv                           # Raw dataset (119,390 records)
├── Hospitality_1.ipynb                          # Jupyter Notebook (full analysis)
├── urbannest.sql                                # SQL queries for business analysis
├── UrbanNest_Capstone_Report_Updated.docx       # Full project report
└── UrbanNest_Capstone_Slides_Updated.pptx       # Presentation slides
```

> ⚠️ **Important:** Keep `hotel_bookings.csv` and `Hospitality_1.ipynb` in the **same root directory**. The notebook loads the dataset using `pd.read_csv('hotel_bookings.csv')`. Any other folder structure will break the data loading step.

> ⚠️ **SQL note:** The SQL file uses `hotel_bookings` as the table name. If you import the CSV into a database, ensure the table is named `hotel_bookings` exactly, otherwise all 8 queries will fail.

---

## Dataset

| Attribute | Details |
|---|---|
| Source | Hotel Booking Demand Dataset (publicly available) |
| Time Period | July 2015 to August 2017 |
| Raw Records | 119,390 bookings |
| Clean Records | 77,678 bookings |
| Original Features | 33 columns |
| Hotel Types | City Hotel and Resort Hotel |
| Target Variable | Total Revenue (ADR × Total Nights) |

> Note: 2015 and 2017 are partial years. Year-level comparisons should be interpreted with caution.

---

## Project Workflow

```
1. Data Loading & Inspection
2. Data Cleaning
   - Missing value handling (company dropped, agent filled with 0)
   - Duplicate removal (31,933 rows)
   - Ghost booking removal (180 rows)
   - Zero-night stay removal (715 rows)
   - Outlier detection & removal (IQR method)
3. Exploratory Data Analysis (EDA)
   - Univariate analysis (ADR, revenue distributions)
   - Time & seasonality patterns
   - Cancellation analysis by segment and lead time
   - Revenue analysis by room type, market segment, customer type
   - Key insight: room changes reduce cancellation by 26 percentage points
4. Feature Engineering
   - total_revenue = ADR × total_nights
   - total_nights = week nights + weekend nights
   - room_changes = binary flag for room assignment changes
5. SQL Analysis (8 business queries)
6. Model Building
   - Baseline Linear Regression (R² 0.7747, MAE $89.00)
   - Optimised Model with interaction features (R² 0.7844, MAE $86.63)
7. Business Recommendations
```

---

## SQL Queries Included

| # | Query |
|---|---|
| 1 | Highest average revenue by room type |
| 2 | Booking activity by month and season |
| 3 | Average revenue by market segment |
| 4 | Revenue and bookings by hotel type |
| 5 | Cancellation rate by market segment |
| 6 | Average revenue by distribution channel |
| 7 | Average lead time: cancelled vs non-cancelled |
| 8 | Top 10 countries by total revenue |

---

## Key Findings

- **Total nights stayed** is the strongest revenue predictor (correlation: 0.70)
- **Online TA** dominates bookings (60%+) but has the highest cancellation rate (34.2%)
- **Room changes** reduce cancellation from 31.6% to just 4.8% — a 7× difference
- **Contract customers** generate the highest average revenue ($409) with low cancellation risk
- **Room C** generates the highest average revenue (~$630) despite not having the highest nightly rate

---

## Tools & Technologies

| Tool | Purpose |
|---|---|
| Python (Pandas, NumPy) | Data cleaning & wrangling |
| Matplotlib & Seaborn | Data visualisation |
| Scikit-learn | Linear Regression model |
| SQL | Business analysis queries |
| Jupyter Notebook | Analysis environment |
| PowerPoint | Presentation |

---

## How to Run

1. Clone the repository
```bash
git clone https://github.com/seyiodunlade/urbannest-hotel-revenue-prediction.git
cd urbannest-hotel-revenue-prediction
```

2. Install dependencies
```bash
pip install pandas numpy matplotlib seaborn scikit-learn jupyter
```

3. Launch the notebook
```bash
jupyter notebook Hospitality_1.ipynb
```

4. Run SQL queries
- Import `hotel_bookings.csv` into your SQL database as a table named `hotel_bookings`
- Run queries from `urbannest.sql` in your preferred SQL client (MySQL, PostgreSQL, or SQL Server)

---

## Deliverables

- ✅ Jupyter Notebook (.ipynb)
- ✅ Raw Dataset (.csv)
- ✅ SQL Analysis (.sql)
- ✅ Capstone Report (.docx)
- ✅ Presentation Slides (.pptx)

---

## Author

**Oluwaseyi Franklyn Odunlade**  
Banking Professional | Data Science Diplomat  
[LinkedIn](https://www.linkedin.com/in/oluwaseyi-oluwaseyi-784a66191) | seyiodunlade1@gmail.com  
[GitHub](https://github.com/seyiodunlade)
