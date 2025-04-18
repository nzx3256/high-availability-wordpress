# High Availability Containerized Application Deployment

## Overview
This project was developed for **COP3604 – System Administration Using Unix**. It demonstrates the deployment of a highly available, containerized web application and database on **Google Cloud Platform (GCP)**. The setup incorporates **Docker**, **Linux LVM for persistent storage**, **load balancing**, and **automation scripting**.

## Project Structure

- **Application:** Open-source web app (e.g., WordPress/Node.js/etc.)
- **Database:** MySQL/PostgreSQL/MongoDB (containerized)
- **Containers:** 3 always-active containers (scalable to 6)
- **Platform:** Google Compute Engine (GCE)
- **Load Balancer:** Nginx/HAProxy
- **Automation:** Shell scripts or Terraform for deployment
- **Storage:** Persistent volumes via Linux LVM
- **Secrets:** Environment variables or Google Secret Manager

##  Technologies Used
- Google Cloud Platform (GCE, VPC, IAM)
- Docker
- Linux Logical Volume Manager (LVM)
- Nginx / HAProxy
- Git & GitHub
- Bash scripting / Terraform
- GCS / Secret Manager (optional)

## Setup Instructions

### 1. Clone the Repository
```bash
git clone https://github.com/your-username/your-repo-name.git
cd your-repo-name
```

### 2. Deploy Infrastructure (Manual or Automated)
- Manual setup via GCP Console OR
- Use provided Terraform/Script files under `/infra/`

```bash
cd infra/
bash deploy.sh   # or use terraform apply
```

### 3. Build & Deploy Containers
```bash
cd app/
docker build -t your-image-name .
docker run -d -p 80:80 your-image-name
```

### 4. Configure Load Balancer
- Instructions for Nginx or HAProxy setup located in `/load-balancer/`.

### 5. Connect Database & Set Up Persistent Storage
- Run `lvm-setup.sh` located in `/storage/` to create persistent volumes.
- Database container uses mounted volume from LVM.

## Directory Structure
```
/infra              → GCP setup & scripts
/app                → Application Dockerfiles
/db                 → Database Dockerfiles
/load-balancer      → Nginx/HAProxy configs
/storage            → LVM scripts & storage setup
/docs               → Diagrams, testing logs, report
/images             → Architecture & screenshots
```

## Security Note
No passwords are stored in the codebase. Environment variables or Secret Manager used for credential management.

## License
This project is for educational use under COP3604. Open-source components are cited accordingly.

