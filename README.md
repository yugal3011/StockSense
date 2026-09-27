# StockSense — Smart Tyre Inventory Management

StockSense is a containerized tyre inventory management application built with **FastAPI, PostgreSQL, Docker, and Kubernetes**.

The primary objective of this project is to demonstrate how a backend application can be **containerized with Docker and deployed, scaled, networked, and managed using Kubernetes**.

---

## 🏗️ Architecture

```text
                         Browser
                            │
                            ▼
                 ┌────────────────────┐
                 │  Kubernetes Service │
                 │   stocksense-api    │
                 │      :8000          │
                 └─────────┬──────────┘
                           │
             ┌─────────────┼─────────────┐
             ▼             ▼             ▼
        ┌─────────┐   ┌─────────┐   ┌─────────┐
        │ API Pod │   │ API Pod │   │ API Pod │
        │ FastAPI │   │ FastAPI │   │ FastAPI │
        └────┬────┘   └────┬────┘   └────┬────┘
             │             │             │
             └─────────────┼─────────────┘
                           ▼
                 ┌──────────────────┐
                 │ PostgreSQL       │
                 │ Kubernetes       │
                 │ Service         │
                 └────────┬─────────┘
                          │
                          ▼
                 ┌──────────────────┐
                 │ PostgreSQL Pod   │
                 └────────┬─────────┘
                          │
                          ▼
                 PersistentVolumeClaim
```

---

# 🐳 Docker

Docker is used to **containerize the FastAPI application** and package the application together with its Python runtime and dependencies.

Instead of depending on the configuration of the host machine, the application runs inside a consistent container environment.

### Dockerfile

The application image is built using:

```dockerfile
FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY app ./app

EXPOSE 8000

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
```

### Build the Docker image

```bash
docker build -t stocksense-api:latest .
```

### Run the container locally

```bash
docker run --rm -p 8000:8000 \
  -e DB_HOST=host.docker.internal \
  -e DB_NAME=stocksense \
  -e DB_USER=postgres \
  -e DB_PASSWORD=postgres \
  stocksense-api:latest
```

The application can then be accessed at:

```text
http://localhost:8000
```

### Why Docker?

Docker provides:

- Application isolation
- Consistent runtime environment
- Dependency packaging
- Portable application deployment
- Easy integration with Kubernetes
- Reproducible application builds

The Docker image created for StockSense is:

```text
stocksense-api:latest
```

---

# ☸️ Kubernetes

Kubernetes is used to **orchestrate and manage the Docker containerized application**.

While Docker packages and runs the application container, Kubernetes manages the application's deployment and lifecycle.

StockSense uses Kubernetes for:

- Container orchestration
- Multiple API replicas
- Service discovery
- Internal networking
- Horizontal scaling
- Self-healing
- Configuration management
- Secret management
- Persistent storage for PostgreSQL

The project uses **kind (Kubernetes IN Docker)** to run the Kubernetes cluster locally.

---

# 🔄 Kubernetes Deployment

The FastAPI application is managed using a Kubernetes Deployment.

The API is configured to run **3 replicas**:

```text
stocksense-api Deployment
          │
     ┌────┼────┐
     ▼    ▼    ▼
    Pod  Pod  Pod
     1    2    3
```

The Deployment ensures that the desired number of API replicas are maintained.

Check the deployment:

```bash
kubectl get deployments
```

Example:

```text
NAME             READY   UP-TO-DATE   AVAILABLE
postgres         1/1     1            1
stocksense-api   3/3     3            3
```

---

# 🌐 Kubernetes Services

Kubernetes Services provide stable network endpoints for the application components.

### FastAPI Service

```text
stocksense-api
```

The Service routes requests to the available FastAPI pods.

```text
Browser
   │
   ▼
stocksense-api Service
   │
   ├── API Pod 1
   ├── API Pod 2
   └── API Pod 3
```

### PostgreSQL Service

The API connects to PostgreSQL through the Kubernetes Service:

```text
DB_HOST=postgres
DB_PORT=5432
```

The API therefore does not depend on the IP address of an individual PostgreSQL pod.

Kubernetes DNS resolves the service name:

```text
postgres
```

to the PostgreSQL Service.

---

# 📈 Kubernetes Scaling

One of the main Kubernetes capabilities demonstrated by StockSense is **horizontal scaling**.

The API can be scaled using:

```bash
kubectl scale deployment stocksense-api --replicas=3
```

Kubernetes creates the required number of API pods.

For example:

```text
1 API Pod
   ↓
Scale to 3
   ↓
3 API Pods
```

The Kubernetes Service can then route traffic to the available replicas.

---

# ♻️ Kubernetes Self-Healing

StockSense also demonstrates Kubernetes **self-healing**.

If an API pod is deleted:

```bash
kubectl delete pod <pod-name>
```

the Deployment controller detects that the actual state no longer matches the desired state.

For example:

```text
Desired state:
3 API replicas

Current state:
2 API replicas

        ↓

Kubernetes detects the difference

        ↓

Replacement pod is created

        ↓

3 API replicas restored
```

Check the pods with:

```bash
kubectl get pods
```

This demonstrates Kubernetes' **desired-state management and automatic recovery**.

---

# 💾 Persistent Storage

PostgreSQL is deployed separately from the FastAPI application.

A Kubernetes **PersistentVolumeClaim (PVC)** is used for database storage.

```text
PostgreSQL Pod
      │
      ▼
PersistentVolumeClaim
      │
      ▼
Persistent Storage
```

This separates database storage from the lifecycle of the PostgreSQL pod.

The API and database therefore have independent lifecycles.

---

# 🔐 Kubernetes Configuration

Application configuration is separated from the container image using a Kubernetes **ConfigMap**.

Example configuration:

```text
DB_HOST=postgres
DB_NAME=stocksense
DB_USER=postgres
DB_PORT=5432
```

Sensitive information such as the database password is provided through a Kubernetes **Secret** rather than being hard-coded into the application configuration.

---

# 🚀 Kubernetes Deployment Workflow

The general deployment workflow is:

```text
Application Code
       │
       ▼
   Dockerfile
       │
       ▼
 Docker Image
       │
       ▼
stocksense-api:latest
       │
       ▼
   kind Cluster
       │
       ▼
Kubernetes Deployment
       │
       ▼
   API Pods
       │
       ▼
 Kubernetes Service
       │
       ▼
     Users
```

### Build the image

```bash
docker build -t stocksense-api:latest .
```

### Load the image into kind

```bash
kind load docker-image stocksense-api:latest --name stocksense
```

### Deploy Kubernetes resources

```bash
kubectl apply -f k8s/
```

### Check deployments

```bash
kubectl get deployments
```

### Check pods

```bash
kubectl get pods
```

### Check services

```bash
kubectl get services
```

---

# 🌐 Accessing the Application

For local Kubernetes access, the FastAPI Service can be accessed using port forwarding:

```bash
kubectl port-forward service/stocksense-api 8000:8000
```

The dashboard is then available at:

```text
http://localhost:8000
```

---

# 🔌 API

The Kubernetes-hosted FastAPI application exposes inventory APIs.

### Products

```http
GET /products
```

Returns the tyre inventory data.

### Inventory Summary

```http
GET /inventory/summary
```

Returns aggregated inventory metrics used by the dashboard.

---

# 📊 Application Features

The dashboard provides:

- Total inventory overview
- Stock health monitoring
- Critical and low-stock identification
- Reorder recommendations
- Inventory value
- Daily sales information
- Product filtering
- Product-level details
- Vehicle compatibility information

---

# 🧩 Kubernetes Components Used

| Component | Purpose |
|---|---|
| Deployment | Manages API replicas and desired state |
| Pod | Runs the FastAPI application |
| Service | Provides stable networking and routes traffic |
| ConfigMap | Stores non-sensitive configuration |
| Secret | Stores sensitive database credentials |
| PersistentVolumeClaim | Provides persistent PostgreSQL storage |
| kind | Runs the Kubernetes cluster locally |

---

# 🧠 Key Kubernetes Concepts Demonstrated

This project provides hands-on implementation of:

- Kubernetes Pods
- Deployments
- Services
- Service discovery
- Kubernetes DNS
- ConfigMaps
- Secrets
- PersistentVolumeClaims
- Replica management
- Horizontal scaling
- Desired-state management
- Self-healing
- Container orchestration

---

# 🐳 Docker + Kubernetes Relationship

The core relationship between Docker and Kubernetes in this project is:

```text
Docker
  │
  │ Containerizes
  ▼
FastAPI Application
  │
  │ Docker Image
  ▼
stocksense-api:latest
  │
  │ Deployed by
  ▼
Kubernetes
  │
  ├── Runs multiple API pods
  ├── Provides networking
  ├── Manages replicas
  ├── Performs self-healing
  └── Connects application components
```

### In simple terms

**Docker answers:**

> How do I package and run my application consistently?

**Kubernetes answers:**

> How do I manage, scale, network, and recover my application containers?

---

# 🎯 Project Objective

The primary objective of StockSense is to demonstrate the practical deployment of a Python-based application using modern containerization and orchestration technologies.

The project focuses particularly on:

**Docker → Containerization**

**Kubernetes → Orchestration**

**PostgreSQL → Persistent Data Storage**

**FastAPI → Backend API**

**Kubernetes Services → Networking**

**Deployments → Replica Management**

**PVC → Persistent Storage**

**Self-Healing → Automatic Recovery**

---

# 👨‍💻 Author

**Yugal Keerthan S**

Computer Science Engineering — Data Science

---

## License

This project is intended for educational and portfolio purposes.