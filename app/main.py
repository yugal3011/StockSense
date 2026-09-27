import json
import pandas as pd

from fastapi import FastAPI, HTTPException
from fastapi.responses import FileResponse
from fastapi.staticfiles import StaticFiles

from app.analytics import calculate_inventory_metrics
from app.database import get_connection


app = FastAPI(
    title="StockSense - Tyre Inventory Management",
    description="Smart tyre inventory and reorder monitoring system",
    version="2.0.0"
)


# --------------------------------------------------
# Static dashboard
# --------------------------------------------------

app.mount("/static", StaticFiles(directory="app/static"), name="static")


@app.get("/")
def dashboard():
    return FileResponse("app/static/index.html")


# --------------------------------------------------
# Database
# --------------------------------------------------

def load_inventory():
    connection = get_connection()

    query = """
        SELECT
            product_id,
            brand,
            model,
            tyre_size,
            category,
            vehicle_compatibility,
            stock,
            daily_sales,
            price
        FROM inventory
        ORDER BY product_id;
    """

    df = pd.read_sql(query, connection)

    connection.close()

    return df


# --------------------------------------------------
# Health
# --------------------------------------------------

@app.get("/api/health")
def health():
    try:
        connection = get_connection()
        connection.close()

        return {
            "status": "healthy",
            "database": "connected"
        }

    except Exception as e:
        return {
            "status": "unhealthy",
            "database": "disconnected",
            "error": str(e)
        }


# --------------------------------------------------
# Products / Tyres
# --------------------------------------------------

@app.get("/products")
def get_products():

    df = load_inventory()

    df = calculate_inventory_metrics(df)

    return json.loads(
        df.to_json(orient="records")
    )


@app.get("/products/{product_id}")
def get_product(product_id: int):

    df = load_inventory()

    product = df[
        df["product_id"] == product_id
    ]

    if product.empty:
        raise HTTPException(
            status_code=404,
            detail="Tyre not found"
        )

    product = calculate_inventory_metrics(product)

    return json.loads(
        product.to_json(orient="records")
    )[0]


# --------------------------------------------------
# Inventory Summary
# --------------------------------------------------

@app.get("/inventory/summary")
def inventory_summary():

    df = load_inventory()

    df = calculate_inventory_metrics(df)

    return {
        "total_products": int(len(df)),
        "total_inventory_value": float(
            df["inventory_value"].sum()
        ),
        "critical_products": int(
            (df["status"] == "CRITICAL").sum()
        ),
        "low_stock_products": int(
            (df["status"] == "LOW").sum()
        ),
        "warning_products": int(
            (df["status"] == "WARNING").sum()
        ),
        "healthy_products": int(
            (df["status"] == "HEALTHY").sum()
        )
    }


# --------------------------------------------------
# Inventory Alerts
# --------------------------------------------------

@app.get("/inventory/alerts")
def inventory_alerts():

    df = load_inventory()

    df = calculate_inventory_metrics(df)

    alerts = df[
        df["status"].isin(
            ["CRITICAL", "LOW"]
        )
    ]

    return json.loads(
        alerts.to_json(orient="records")
    )


# --------------------------------------------------
# Fast Moving Tyres
# --------------------------------------------------

@app.get("/inventory/fast-moving")
def fast_moving():

    df = load_inventory()

    df = calculate_inventory_metrics(df)

    result = df.sort_values(
        "daily_sales",
        ascending=False
    ).head(10)

    return json.loads(
        result.to_json(orient="records")
    )


# --------------------------------------------------
# Reorder Recommendations
# --------------------------------------------------

@app.get("/inventory/recommendations")
def reorder_recommendations():

    df = load_inventory()

    df = calculate_inventory_metrics(df)

    result = df[
        df["reorder_required"]
    ].copy()

    return json.loads(
        result.to_json(orient="records")
    )


@app.get("/inventory/reorder-recommendations")
def reorder_recommendations_alias():

    return reorder_recommendations()