import duckdb
import pandas as pd

# Connect to local duckdb file
con = duckdb.connect("my_dbt.duckdb")

# Query models
monthly_sales = con.execute("SELECT * FROM fct_monthly_sales").df()
top_products = con.execute("SELECT * FROM fct_top_products").df()
customers = con.execute("SELECT * FROM dim_customers").df()
country_sales = con.execute("SELECT * FROM fct_country_sales").df()

# Show sample outputs
print("Monthly Sales:\n", monthly_sales.head(), "\n")
print("Top Products:\n", top_products.head(), "\n")
print("Customer Summary:\n", customers.head(), "\n")
print("Country Sales:\n", country_sales.head(), "\n")

# Converting to CSV
monthly_sales.to_csv("data/monthly_sales.csv", index=False)
top_products.to_csv("data/top_products.csv", index=False)
customers.to_csv("data/dim_customers.csv", index=False)
country_sales.to_csv("data/country_sales.csv", index=False)
