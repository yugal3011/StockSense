import psycopg2

DB_CONFIG = {
    "host": "localhost",
    "database": "stocksense",
    "user": "postgres",
    "password": "postgres",
    "port": 5432,
}

def create_table():
    connection = psycopg2.connect(**DB_CONFIG)
    cursor = connection.cursor()

    cursor.execute("""
        DROP TABLE IF EXISTS inventory;

        CREATE TABLE inventory (
            product_id INTEGER PRIMARY KEY,
            brand VARCHAR(100),
            model VARCHAR(100),
            tyre_size VARCHAR(50),
            category VARCHAR(50),
            vehicle_compatibility TEXT,
            stock INTEGER,
            daily_sales INTEGER,
            price NUMERIC(10, 2)
        );
    """)

    connection.commit()

    cursor.close()
    connection.close()

    print("Tyre inventory table created successfully.")


if __name__ == "__main__":
    create_table()