 <div align="center">
  <img src="docs/images/devconnect-logo.png" width="110" alt="DevConnect Logo" />
  <h1>DevConnect</h1>
  <p><strong>Cloud-Native Microservices Social Platform</strong></p>
  <p>
    An end-to-end DevOps project demonstrating microservices architecture,
    containerization, Kubernetes orchestration, GitOps, CI/CD, security scanning,
    and observability.
  </p>
</div>

<div align="center">

![Python](https://img.shields.io/badge/Python-3.12-3776AB?logo=python&logoColor=white)
![React](https://img.shields.io/badge/React-Frontend-61DAFB?logo=react&logoColor=black)
![Docker](https://img.shields.io/badge/Docker-Containerization-2496ED?logo=docker&logoColor=white)
![Kubernetes](https://img.shields.io/badge/Kubernetes-k3s-326CE5?logo=kubernetes&logoColor=white)
![GitHub Actions](https://img.shields.io/badge/GitHub_Actions-CI%2FCD-2088FF?logo=githubactions&logoColor=white)
![Argo CD](https://img.shields.io/badge/Argo_CD-GitOps-EF7B4D?logo=argo&logoColor=white)
![Prometheus](https://img.shields.io/badge/Prometheus-Monitoring-E6522C?logo=prometheus&logoColor=white)
![Grafana](https://img.shields.io/badge/Grafana-Observability-F46800?logo=grafana&logoColor=white)

</div>

---

## Dashboard

<div align="center">
  <img src="docs/images/devconnect-dashboard.png" width="100%" alt="DevConnect Dashboard" />
</div>

## Overview

DevConnect is a cloud-native developer social platform where users can register, share technical posts, interact through likes and comments, and explore application analytics.

The application is built using independent FastAPI microservices behind an Nginx-routed React frontend. Redis Queue and a dedicated Worker Service handle asynchronous post creation, while PostgreSQL provides persistent data storage.

The project also demonstrates a complete DevOps delivery workflow, from automated testing and security scanning to Kubernetes deployment through ArgoCD GitOps.

## Architecture

```text
                     Developer
                         |
                    GitHub Push
                         |
                  GitHub Actions
                         |
              Tests & Security Scans
                         |
                  Docker Build
                         |
                    Trivy Scan
                         |
                     DockerHub
                         |
                  GitOps Update
                         |
                      ArgoCD
                         |
                 Kubernetes / k3s
                         |
                  Nginx Ingress
                         |
                  React Frontend
                         |
                 FastAPI Services
                         |
          +--------------+--------------+
          |              |              |
       PostgreSQL      Redis         Analytics
          |              |
          |          Redis Queue
          |              |
          +---------- Worker
                         |
                   Application Data

                 Observability Stack
             Prometheus | Grafana | Loki
                       Alloy
```

## Microservices

| Service | Responsibility |
|---|---|
| Frontend | React-based social feed and user interface |
| Auth Service | Registration, login, JWT authentication |
| User Service | User profiles and account data |
| Post Service | Post creation and queue publishing |
| Like Service | Post likes |
| Comment Service | Comments and interactions |
| Analytics Service | Application analytics and metrics |
| Worker Service | Asynchronous Redis Queue processing |

**Infrastructure services:** PostgreSQL and Redis.

## Technology Stack

| Category | Technologies |
|---|---|
| Frontend | React, JavaScript, Nginx |
| Backend | Python, FastAPI |
| Database | PostgreSQL |
| Queue / Cache | Redis, Redis Queue |
| Containers | Docker, Docker Compose |
| Orchestration | Kubernetes, k3s |
| CI/CD | GitHub Actions |
| Container Registry | DockerHub |
| GitOps | ArgoCD |
| Infrastructure as Code | Terraform |
| Security | Trivy, OWASP Dependency-Check |
| Code Quality | SonarQube integration |
| Monitoring | Prometheus, Grafana |
| Logging | Loki, Grafana Alloy |
| Infrastructure Metrics | node-exporter, cAdvisor, kube-state-metrics |

## CI/CD Pipeline

The GitHub Actions workflow automates the application delivery lifecycle.

1. Run Python tests and frontend validation.
2. Build the React frontend.
3. Scan the repository filesystem using Trivy.
4. Check dependencies using OWASP Dependency-Check.
5. Run optional SonarQube analysis.
6. Build Docker images for the frontend and backend services.
7. Scan container images using Trivy.
8. Push approved images to DockerHub.
9. Update Kubernetes image tags with the Git commit SHA.
10. Let ArgoCD synchronize the GitOps repository state.
11. Verify Kubernetes rollout and application health.

## Kubernetes & GitOps

The application is deployed on Kubernetes using k3s.

- Independent Deployments and Services for application components.
- StatefulSets and persistent storage for PostgreSQL and Redis.
- Kubernetes manifests organized with Kustomize.
- ArgoCD continuously monitors the Git repository.
- Automated synchronization and self-healing.
- Git commit SHA-based image versioning.

## Security

Security is integrated throughout the delivery pipeline.

- Trivy filesystem vulnerability scanning.
- Trivy container image scanning.
- OWASP Dependency-Check.
- Optional SonarQube code analysis.
- JWT-based application authentication.
- Kubernetes RBAC and service accounts.
- Restricted infrastructure access and secret management.

## Monitoring & Observability

The monitoring stack provides visibility into application and infrastructure health.

| Component | Purpose |
|---|---|
| Prometheus | Metrics collection |
| Grafana | Monitoring dashboards |
| Loki | Centralized log storage |
| Grafana Alloy | Log collection |
| node-exporter | Host-level metrics |
| cAdvisor | Container metrics |
| kube-state-metrics | Kubernetes resource metrics |

Application metrics are exposed through Prometheus-compatible endpoints, including FastAPI services and the background Worker Service.

## Infrastructure as Code

Terraform provisions the EC2 infrastructure required for the Kubernetes environment.

The infrastructure configuration includes:

- Ubuntu EC2 instance.
- Configurable instance type and storage.
- Security group rules.
- SSH access restrictions.
- Optional AWS Systems Manager support.

## Repository Structure

```text
end-to-end-microservice-project/
├── .github/
│   └── workflows/
│       └── ci-cd.yml
├── docs/
│   └── images/
├── frontend/
├── services/
│   ├── auth-service/
│   ├── user-service/
│   ├── post-service/
│   ├── like-service/
│   ├── comment-service/
│   ├── analytics-service/
│   └── worker-service/
├── k8s/
│   ├── base/
│   └── overlays/
├── scripts/
├── terraform/
├── tests/
├── docker-compose.yml
├── requirements-dev.txt
└── README.md
```

## Local Development

Clone the repository:

```bash
git clone https://github.com/tanahmeeedsx/end-to-end-microservice-project.git
cd end-to-end-microservice-project
```

Configure the environment:

```bash
cp .env.example .env
```

Start the application:

```bash
docker compose up --build -d
```

Open the application:

```text
http://localhost:3000
```

Check running containers:

```bash
docker compose ps
```

Run tests:

```bash
python -m pip install -r requirements-dev.txt
pytest
```

## Key Engineering Concepts

This project demonstrates practical experience with:

- Designing and integrating independent microservices.
- Building containerized applications.
- Implementing asynchronous background processing.
- Automating CI/CD pipelines.
- Integrating container security gates.
- Deploying applications with Kubernetes.
- Managing GitOps workflows using ArgoCD.
- Provisioning cloud infrastructure using Terraform.
- Implementing metrics, centralized logging, and observability.
- Managing application deployments through version-controlled manifests.

---

<div align="center">

**Built to explore modern DevOps, Cloud Engineering, and Microservices.**

</div>
