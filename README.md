# Olist Brazilian E-Commerce — Data Analytics Project

End-to-end data analytics project on the **Brazilian E-Commerce Public Dataset by Olist**,
covering the full analyst workflow: data cleaning, exploratory analysis (EDA), SQL analysis,
machine learning, and a Power BI dashboard.

> **Data source:** [Brazilian E-Commerce Public Dataset by Olist](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)
> **License:** CC BY-NC-SA 4.0 (non-commercial, attribution, share-alike)

**🔗 Live project page:** [todorvankov.com/olist-brazilian-e-commerce](https://todorvankov.com/olist-brazilian-e-commerce)

## Chapters

| Chapter | Status | Link |
| --- | --- | --- |
| 01 · Exploratory Data Analysis | ✅ Done | [notebooks/01_EDA.ipynb](notebooks/01_EDA.ipynb) · [Live report](https://todorvankov.com/olist-brazilian-e-commerce) |
| 02 · SQL Analysis | 🚧 In progress | [sql/](sql/) |
| 03 · ML Model (predict negative reviews) | ⏳ Planned | — |
| Power BI Dashboard | ✅ Done | [Jump to section](#power-bi-dashboard) · [powerbi/olist_dashboard.pbix](powerbi/olist_dashboard.pbix) |

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

## Power BI Dashboard

A 4-page interactive dashboard built in Power BI, digging into the same data from four angles:
sales performance, customer satisfaction, and delivery logistics — tying back to the EDA finding
that delivery time drives reviews.

> Live web version isn't available (personal Power BI account can't enable public "Publish to Web").
> Download **[olist_dashboard.pbix](powerbi/olist_dashboard.pbix)** and open it in Power BI Desktop
> to explore it interactively — filters, drilldowns and the reset button all work.

### Overview
Revenue, order count, review score and delivery time at a glance, a revenue trend line, an
order-density map of Brazil, and the first look at the delivery-time-vs-review-score relationship.

![Overview page](powerbi/overview.png)

### Sales
Revenue broken down by product category and by month (seasonal pattern, peaking in May), plus
the split of payment methods (credit card dominates at ~78%).

![Sales page](powerbi/sales.png)

### Customer
Review score distribution (skewed toward 5★, but 1★ still outnumbers 2★), and how review score
relates to both delivery time and freight cost — both get worse for low-rated orders.

![Customer page](powerbi/customers.png)

### Logistics
92% of orders arrive on time. Freight cost by category (bulky items like computers and furniture
cost the most to ship), and average delivery time by state — the slowest states are all in the
Amazon region (RR, AP, AM), consistent with the geographic concentration found in the EDA.

![Logistics page](powerbi/logistics.png)

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
├── powerbi/            # Power BI dashboard (.pbix + screenshots)
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
- [x] Power BI dashboard

---

*Data © Olist, licensed under CC BY-NC-SA 4.0. This project is for educational / portfolio use only.*
