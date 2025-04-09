# Devops
# 🧠 Flask Quiz App – DevOps Intern Case Study

## 📌 Table of Contents
- [Project Overview](#project-overview)
- [Tech Stack](#tech-stack)
- [Project Objectives](#project-objectives)
- [Folder Structure](#folder-structure)
- [Setup & Deployment Guide](#setup--deployment-guide)
  - [1. Prerequisites](#1-prerequisites)
  - [2. Clone the Repository](#2-clone-the-repository)
  - [3. Build & Run with Docker](#3-build--run-with-docker)
  - [4. Provision Infrastructure with Terraform](#4-provision-infrastructure-with-terraform)
  - [5. CI/CD with GitHub Actions](#5-cicd-with-github-actions)
  - [6. Application Monitoring](#6-application-monitoring)
  - [7. Rollback Mechanism (Bonus)](#7-rollback-mechanism-bonus)
- [Monitoring Dashboard](#monitoring-dashboard)
- [Secrets & Configuration](#secrets--configuration)
- [Demo Screenshots](#demo-screenshots)
- [Conclusion](#conclusion)
- [Author](#author)

---

## 📘 Project Overview

A Python Flask quiz application that returns `"Good"` or `"Bad"` depending on the user's answer. This case study demonstrates an end-to-end DevOps pipeline with CI/CD, containerization, infrastructure automation, and basic monitoring.

---

## 🧰 Tech Stack

| Category              | Tool/Technology            |
|-----------------------|----------------------------|
| Backend               | Python Flask               |
| Containerization      | Docker                     |
| CI/CD Pipeline        | GitHub Actions             |
| Infrastructure as Code| Terraform                  |
| Cloud                 | AWS (EC2)                  |
| Monitoring            | Prometheus + Grafana       |
| Code Scan             | SonarCloud, Trivy, Snyk    |
| Registry              | DockerHub                  |

---


## 🎯 Project Objectives

- ✅ Containerize a Flask-based quiz app using Docker.
- ✅ Deploy using GitHub Actions pipeline to an AWS EC2 instance.
- ✅ Automate infrastructure provisioning with Terraform.
- ✅ Implement basic monitoring and alerting with Prometheus & Grafana.
- ✅ Integrate security scanning tools (SonarCloud, Trivy, Snyk).
- ✅ Provide rollback support in case of failed deployment (Bonus).

---

## 🗂 Folder Structure

```plaintext
├── app_code/
│   ├── app.py
│   ├── requirements.txt
│   └── Dockerfile
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
├── .github/
│   └── workflows/
│       └── main.yml
├── monitoring/
│   └── setup.md
├── diagrams/
│   └── architecture.png
└── README.md


🚀 Setup & Deployment Guide
1. Prerequisites
Before getting started, ensure the following are installed/configured:

✅ An AWS account with IAM user and programmatic access

✅ Docker installed and running

✅ Terraform installed (terraform -v)

✅ AWS CLI installed and configured (aws configure)

✅ GitHub Secrets set (see 🔐 Secrets & Configuration)

2. Clone the Repository
bash
Copy
Edit
git clone https://github.com/your-username/flask-quiz-devops.git
cd flask-quiz-devops
3. Build & Run with Docker (Locally)
bash
Copy
Edit
cd app_code
docker build -t quiz-app .
docker run -p 5000:5000 quiz-app
Open your browser and visit: http://localhost:5000

4. Provision Infrastructure with Terraform
bash
Copy
Edit
cd terraform
terraform init
terraform apply
This launches an EC2 VM, configures security groups, and prepares the server to run Docker containers.

5. CI/CD with GitHub Actions
Every time you push to the main branch:

🏗️ Builds the Docker image

🚀 Pushes image to DockerHub

🔐 SSH into EC2 and pulls + runs the new image

📦 Replaces running container with new one (zero-downtime optional)

GitHub Actions workflow file is located at:

bash
Copy
Edit
.github/workflows/main.yml
6. Application Monitoring
You can monitor both system and application metrics:

📈 Prometheus Node Exporter installed on VM to track system stats

📊 Prometheus + Grafana setup for metrics aggregation and visualization

🚨 Alerts configured in Grafana when:

CPU usage > 70%

Optional: Memory or Disk spikes

🔐 Secrets & Configuration
Configure these GitHub repository secrets for secure automation:

Secret Name	Description
DOCKER_USERNAME	DockerHub username
DOCKER_PASSWORD	DockerHub password
VM_HOST	EC2 public IP (e.g., 13.234.56.78)
VM_USER	SSH user (usually ec2-user)
SSH_PRIVATE_KEY	PEM key contents (multi-line secret)
SNYK_TOKEN	Token for Snyk CLI vulnerability scan
Go to GitHub Repo → Settings → Secrets and variables → Actions → New repository secret

7. Rollback Mechanism (Bonus)
If the deployment fails:

The GitHub Actions workflow will fallback to the last stable image using the docker image ls and redeploy it.

Optionally tag successful builds with latest-stable for manual rollback.

🏁 Conclusion
This DevOps intern case study demonstrates the evolution of a basic Flask quiz app into a production-ready deployment pipeline using:

✅ Docker for containerization

✅ GitHub Actions for CI/CD

✅ Terraform for infrastructure provisioning

✅ Prometheus + Grafana for monitoring

✅ Snyk, Trivy, SonarCloud for DevSecOps scanning

✅ GitHub Secrets for secure automation
