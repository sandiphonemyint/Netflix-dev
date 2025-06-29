# 🎬 Netflix Clone DevSecOps Deployment
A professionally automated DevOps project that demonstrates a full CI/CD workflow using **Jenkins**, **Docker**, and **Google Cloud Platform**. This Netflix-style front-end application is containerized and deployed from source to production through a streamlined pipeline.

---

## 📌 Project Highlights

- 🔁 End-to-end **CI/CD pipeline** powered by Jenkins
- 🐳 **Dockerized** Apache web server serving static front-end
- ☁️ Deployed on a **Google Cloud Platform (GCP) Ubuntu VM**
- 🔍 Integrated **OWASP Dependency Check** for security scanning
- 📦 **Docker Scout** for vulnerability and recommendation analysis
- 🛠️ Production-ready `Dockerfile` and `Jenkinsfile`

---

## �� Tech Stack

| Category         | Technology                           |
|------------------|--------------------------------------|
| CI/CD            | Jenkins                              |
| Containerization | Docker                               |
| Cloud Infra      | Google Cloud Platform (GCP)          |
| Web Server       | Apache2                              |
| Security         | OWASP Dependency Check, Docker Scout |
| Version Control  | GitHub                               |

---
## 📁 Project Structure

```
netflix-clone/
├── Dockerfile               # Docker image with Apache and static site
├── Jenkinsfile              # Declarative Jenkins pipeline
├── index.html               # Entry point for Netflix-style UI
├── src/                     # Front-end assets (CSS, JS)
├── installation/
│   └── install.sh           # Bootstrap script for Jenkins & Java
├── k8s.yaml                 # (Optional) Kubernetes manifest
└── README.md                # Project documentation
```

