# Terraform + Kubernetes (Local Cluster)

## Project Overview

This project demonstrates Infrastructure as Code (IaC) by using Terraform to manage and deploy resources on a local Kubernetes cluster (Minikube). The entire Kubernetes setup — including namespaces, deployments, services, and configuration — is automated and cloud-independent.

This project is designed to be resume-ready, interview-friendly, and runnable on Pop!_OS / Ubuntu-based Linux systems.

---

## Tech Stack

* Terraform – Infrastructure as Code
* Kubernetes – Container orchestration
* Minikube – Local Kubernetes cluster
* Docker – Containerization
* NGINX – Sample application server

---

## Architecture

```
Terraform
   ↓
Kubernetes Provider
   ↓
Namespace
   ↓
ConfigMap → Deployment → Service → Pods
```

---

## Project Structure

```
terraform-k8s-project/
│
├── app/
│   ├── Dockerfile
│   └── index.html
│
└── terraform/
    ├── provider.tf
    ├── namespace.tf
    ├── configmap.tf
    ├── deployment.tf
    └── service.tf
```

---

## Prerequisites

Ensure the following tools are installed:

```bash
docker --version
kubectl version --client
minikube version
terraform version
```

---

## Project Setup and Commands

### Start Minikube Cluster

```bash
minikube start --driver=docker
kubectl get nodes
```

---

### Build Docker Image (Inside Minikube)

```bash
cd app
eval $(minikube docker-env)
docker build -t terraform-k8s-app:1.0 .
```

Verify:

```bash
docker images | grep terraform-k8s-app
```

---

### Initialize Terraform

```bash
cd terraform
terraform init
```

---

### Deploy Kubernetes Resources Using Terraform

```bash
terraform apply
```

Type `yes` when prompted.

---

## Verification Commands

Check namespace:

```bash
kubectl get ns
```

Check pods:

```bash
kubectl get pods -n dev
```

Check services:

```bash
kubectl get svc -n dev
```

---

## Access the Application

```bash
minikube service terraform-service -n dev
```

This opens the application in your browser.

---

## How the Project Works

1. Docker builds a custom NGINX image containing a static web page.
2. Minikube runs a local Kubernetes cluster using Docker as the driver.
3. Terraform Kubernetes Provider connects to the cluster using kubeconfig.
4. Terraform creates:

   * A dedicated namespace (dev)
   * A ConfigMap for external configuration
   * A Deployment with multiple replicas
   * A NodePort Service to expose the app
5. Kubernetes schedules pods and serves traffic automatically.

---

## Cleanup (Destroy Infrastructure)

```bash
terraform destroy
```

---

## Resume Description

```
Terraform + Kubernetes Local Cluster Project
• Built a cloud-independent Kubernetes cluster using Minikube.
• Automated Kubernetes resources using Terraform (Namespaces, Deployments, Services, ConfigMaps).
• Containerized an application using Docker and deployed it via Infrastructure as Code.
• Demonstrated Kubernetes automation and Terraform lifecycle management.
```

---

## Future Enhancements

* Horizontal Pod Autoscaler (HPA)
* Kubernetes Ingress
* Secrets management
* CI/CD using GitHub Actions
* Helm integration with Terraform

---

## Author

Mayank
DevOps | Kubernetes | Terraform | Docker

---

Project completed successfully
