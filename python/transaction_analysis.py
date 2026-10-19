import pandas as pd
import matplotlib.pyplot as plt

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

# -----------------------------
# 9. DATA VISUALISATION
# -----------------------------

transaction_counts.plot(
    kind ="bar",
    title ="Transaction Count by Type"

)

plt.tight_layout()

plt.savefig("../charts/transaction_count_by_type.png")

plt.show()

transaction_values.plot(
    kind ="bar",
    title ="Total Transaction Value by Type"
)

plt.ylabel("Transaction Value (R)")
plt.xlabel("Transaction Type")
plt.tight_layout()

plt.savefig("../charts/transaction_value_by_type.png")

plt.show()

channel_counts.plot(
    kind ="bar",
    title ="Transaction Count by Banking Channel"
)

plt.xlabel("Banking Channel")
plt.ylabel("Number of Transactions")
plt.tight_layout()

plt.savefig("../charts/banking_channel_usage.png")

plt.show()

monthly_values.sort_index().plot(
    kind ="line",
    marker ="o",
    title ="Monthly Transaction Value"
)

plt.xlabel("Month")
plt.ylabel("Transaction Value (R)")
plt.tight_layout()

plt.savefig("../charts/monthly_transaction_value.png")

plt.show()