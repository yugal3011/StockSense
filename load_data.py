import pandas as pd
import psycopg2

DB_CONFIG = {
    "host": "localhost",
    "database": "stocksense",
    "user": "postgres",
    "password": "postgres",
    "port": 5432,
}

CSV_FILE = "data/inventory.csv"


def load_data():
    df = pd.read_csv(CSV_FILE)

    connection = psycopg2.connect(**DB_CONFIG)
    cursor = connection.cursor()

    cursor.execute("DELETE FROM inventory;")

    insert_query = """
        INSERT INTO inventory (
            product_id,
            brand,
            model,
            tyre_size,
            category,
            vehicle_compatibility,
            stock,
            daily_sales,
            price
        )
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)
    """

    for _, row in df.iterrows():
        cursor.execute(
            insert_query,
            (
                int(row["product_id"]),
                row["brand"],
                row["model"],
                row["tyre_size"],
                row["category"],
                row["vehicle_compatibility"],
                int(row["stock"]),
                int(row["daily_sales"]),
                float(row["price"]),
            ),
        )

    connection.commit()

    cursor.close()
    connection.close()

    print(f"Successfully loaded {len(df)} tyre records into PostgreSQL.")


if __name__ == "__main__":
    load_data()