import pandas as pd


def calculate_inventory_metrics(df: pd.DataFrame) -> pd.DataFrame:
    """
    Calculate useful inventory metrics for every product.
    """

    # Avoid division by zero
    df["days_remaining"] = df.apply(
        lambda row: (
            row["stock"] / row["daily_sales"]
            if row["daily_sales"] > 0
            else float("inf")
        ),
        axis=1
    )

    # Calculate total monetary value of current stock
    df["inventory_value"] = df["stock"] * df["price"]

    # Determine inventory health
    def get_status(days):
        if days < 1:
            return "CRITICAL"
        elif days < 3:
            return "LOW"
        elif days < 7:
            return "WARNING"
        else:
            return "HEALTHY"

    df["status"] = df["days_remaining"].apply(get_status)

    # Reorder if less than 3 days of stock remains
    df["reorder_required"] = df["days_remaining"] < 3

    # Target 7 days of inventory
    df["recommended_quantity"] = (
        (7 * df["daily_sales"]) - df["stock"]
    ).clip(lower=0)

    return df