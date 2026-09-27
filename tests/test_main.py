from fastapi.testclient import TestClient

from app.main import app


client = TestClient(app)


def test_inventory_summary_endpoint_returns_json():
    response = client.get("/inventory/summary")
    assert response.status_code == 200
    payload = response.json()
    assert set(payload) == {
        "total_products",
        "total_inventory_value",
        "critical_products",
        "low_stock_products",
        "warning_products",
        "healthy_products",
    }
    assert isinstance(payload["total_products"], int)
    assert isinstance(payload["total_inventory_value"], float)


def test_products_endpoint_returns_serializable_records():
    response = client.get("/products")
    assert response.status_code == 200
    payload = response.json()
    assert isinstance(payload, list)
    assert payload[0]["product_id"] == 101
