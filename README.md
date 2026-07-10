# Olist Brazilian E-Commerce — Data Analytics Project

End-to-end data analytics project on the **Brazilian E-Commerce Public Dataset by Olist**,
covering the full analyst workflow: data cleaning, exploratory analysis (EDA), SQL analysis,
machine learning, and a Power BI dashboard.

> **Data source:** [Brazilian E-Commerce Public Dataset by Olist](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)
> **License:** CC BY-NC-SA 4.0 (non-commercial, attribution, share-alike)

---

## Project Goal

Analyze ~100k real orders from a Brazilian marketplace to understand what drives customer
satisfaction, and build a machine learning model to **predict negative reviews (1–2 stars)**.

## Key Findings (from EDA)

- **Delivery time is the #1 driver of satisfaction** — 1-star customers wait on average 20.8 days
  vs 10.2 days for 5-star customers (correlation −0.30).
- **Heavy geographic concentration** — 60% of sellers and 42% of customers are in São Paulo state.
- **Polarized reviews** — 58% give 5 stars, 12% give 1 star; neutral scores (2–3) are rare.
- **Brazilian payment culture** — credit card 74%, but boleto (bank slip) accounts for 19%.

---

## Project Structure

```
Olist-Brazilian-E-Commerce/
├── data/
│   ├── raw/            # Kaggle CSVs + olist.sqlite (not in git — see setup)
│   └── processed/      # cleaned data
├── notebooks/
│   └── 01_EDA.ipynb    # Exploratory Data Analysis
├── sql/                # SQL queries
├── powerbi/            # Power BI dashboard
├── reports/            # exported HTML reports
├── requirements.txt
└── README.md
```

## Setup

**1. Clone and install dependencies**
```bash
git clone https://github.com/tvankov/olist-brazilian-ecommerce.git
cd olist-brazilian-ecommerce
pip install -r requirements.txt
```

**2. Download the data** (not included in the repo — ~228 MB)

Requires a free [Kaggle API token](https://www.kaggle.com/docs/api):
```bash
cd data/raw
kaggle datasets download -d olistbr/brazilian-ecommerce --unzip
kaggle datasets download -d terencicp/e-commerce-dataset-by-olist-as-an-sqlite-database --unzip
```

**3. Run the notebooks** in `notebooks/`.

---

## Tech Stack

Python · pandas · NumPy · Matplotlib · Seaborn · Plotly · SQLAlchemy · SQLite · Power BI

## Roadmap

- [x] `01_EDA.ipynb` — data cleaning & exploratory analysis
- [ ] `02_SQL_Analysis.ipynb` — business questions in SQL
- [ ] `03_ML_Model.ipynb` — predicting negative reviews
- [ ] Power BI dashboard

---

*Data © Olist, licensed under CC BY-NC-SA 4.0. This project is for educational / portfolio use only.*
