import pandas as pd

print("Banking Transaction Analytics")

# -----------------------------
# 1. LOAD DATA
# -----------------------------

df = pd.read_csv("../data/banking_transactions.csv")

df["transaction_date"] = pd.to_datetime(df["transaction_date"])

# -----------------------------
# 2. DATA INSPECTION
# -----------------------------

print(df.head())

print(df.shape)

print(df.dtypes)

# -----------------------------
# 3. DATA QUALITY CHECKS
# -----------------------------

print(df.isnull().sum())

print(df.duplicated().sum())

# -----------------------------
# 4. TRANSACTION SUMMARY
# -----------------------------

total_value = df["amount"].sum()

print(round(total_value, 2))

average_value = df["amount"].mean()

print(round(average_value, 2))

# -----------------------------
# 5. TRANSACTION TYPE ANALYSIS
# -----------------------------

transaction_counts = df.groupby("transaction_type").size()

print(transaction_counts)

transaction_values = (
    df.groupby("transaction_type")["amount"]
    .sum()
    .sort_values(ascending=False)

)

print(transaction_values)

# -----------------------------
# 6. CHANNEL ANALYSIS
# -----------------------------

channel_counts = (
    df.groupby("channel")
    .size()
    .sort_values(ascending=False)
)

print(channel_counts)

# -----------------------------
# 7. FAILED TRANSACTION ANALYSIS
# -----------------------------

failed_transactions = df[df["status"] == "Failed"]

print(failed_transactions)

failed_count = len(failed_transactions)

print(failed_count)

high_value_failed = df[
    (df["amount"] > 5000) &
    (df["status"] == "Failed")

]

print(high_value_failed)

# -----------------------------
# 8. MONTHLY ANALYSIS
# -----------------------------

monthly_counts = (
    df.groupby(df["transaction_date"].dt.to_period("M"))
    .size()
)
print(monthly_counts)

monthly_values = (
    df.groupby(df["transaction_date"].dt.to_period("M"))["amount"]
    .sum()
    .sort_values(ascending=False)
)

print(monthly_values)