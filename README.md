# 🚀 Automated Nginx Deployment

![GitHub Actions](https://github.com/YOUR_USERNAME/YOUR_REPO_NAME/workflows/Build,%20Test%20and%20Push%20Docker%20Image/badge.svg)
![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=flat&logo=docker&logoColor=white)
![Nginx](https://img.shields.io/badge/nginx-%23009639.svg?style=flat&logo=nginx&logoColor=white)
![GitHub Actions](https://img.shields.io/badge/github%20actions-%232671E5.svg?style=flat&logo=githubactions&logoColor=white)

> 🎯 **DevOps Project Step 1** - ავტომატიზირებული Nginx Deployment CI/CD Pipeline-ით

## 📋 პროექტის აღწერა

ეს პროექტი წარმოადგენს სრულად ავტომატიზირებულ deployment სისტემას, რომელიც იყენებს Docker-ს, GitHub Actions-ს და Docker Hub-ს. პროექტი აჩვენებს თანამედროვე DevOps პრაქტიკებს და CI/CD pipeline-ის იმპლემენტაციას.

## 🏗️ არქიტექტურა

```
┌─────────────────┐
│   GitHub Repo   │
│  (Source Code)  │
└────────┬────────┘
         │
         │ git push
         ▼
┌─────────────────┐
│ GitHub Actions  │
│   (CI/CD)       │
│  ┌───────────┐  │
│  │  Build    │  │
│  │  Test     │  │
│  │  Push     │  │
│  └───────────┘  │
└────────┬────────┘
         │
         │ docker push
         ▼
┌─────────────────┐
│   Docker Hub    │
│ (Image Registry)│
└────────┬────────┘
         │
         │ docker pull
         ▼
┌─────────────────┐
│  Nginx Alpine   │
│   (Container)   │
└─────────────────┘
```

### 🔧 გამოყენებული ტექნოლოგიები

- **🐳 Docker** - კონტეინერიზაცია
- **⚡ Nginx Alpine** - მსუბუქი web server
- **🔄 GitHub Actions** - CI/CD automation
- **📦 Docker Hub** - container registry
- **📝 HTML/CSS** - frontend

## ✨ ფუნქციონალი

- ✅ ავტომატური Docker image build
- ✅ ავტომატური testing pipeline-ში
- ✅ ავტომატური deployment Docker Hub-ზე
- ✅ ვერსიონირება git tags-ით
- ✅ მსუბუქი Alpine-based image
- ✅ CI/CD integration

## 🚀 როგორ გავუშვა

### წინაპირობები

- Docker დაინსტალირებული ([Install Docker](https://docs.docker.com/get-docker/))
- Docker Hub account (ოფციონალური, თუ გინდა საკუთარი image-ის push)

### სწრაფი დაწყება

#### 1️⃣ Docker Hub-იდან გაშვება

```bash
# Image-ის გადმოწერა და გაშვება
docker run -d -p 8080:80 YOUR_DOCKER_USERNAME/my-devops-app:latest

# გახსენი ბრაუზერი
open http://localhost:8080
```

#### 2️⃣ წყაროდან Build და გაშვება

```bash
# რეპოზიტორის clone
git clone https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git
cd YOUR_REPO_NAME

# Docker image-ის build
docker build -t my-devops-app:latest .

# Container-ის გაშვება
docker run -d -p 8080:80 --name nginx-app my-devops-app:latest

# შემოწმება
curl http://localhost:8080
```

#### 3️⃣ Container-ის მენეჯმენტი

```bash
# Container-ის სტატუსის ნახვა
docker ps

# Logs-ის ნახვა
docker logs nginx-app

# Container-ის გაჩერება
docker stop nginx-app

# Container-ის წაშლა
docker rm nginx-app

# Image-ის წაშლა
docker rmi my-devops-app:latest
```

## 🔄 CI/CD Pipeline

GitHub Actions ავტომატურად უშვებს pipeline-ს ყოველი `main` branch-ზე push-ის შემდეგ:

1. **Checkout** - კოდის ჩამოწერა
2. **Docker Login** - Docker Hub authentication
3. **Build** - Docker image-ის აშენება
4. **Test** - Container-ის ტესტირება
5. **Push** - Image-ის upload Docker Hub-ზე
6. **Cleanup** - დროებითი რესურსების გაწმენდა

### Pipeline-ის დასაყენებლად:

1. **GitHub Secrets-ის კონფიგურაცია:**
   - `Settings` → `Secrets and variables` → `Actions`
   - დაამატე:
     - `DOCKER_USERNAME` - შენი Docker Hub username
     - `DOCKER_PASSWORD` - შენი Docker Hub token

2. **Push კოდი:**
   ```bash
   git add .
   git commit -m "Setup CI/CD pipeline"
   git push origin main
   ```

3. **მონიტორინგი:**
   - GitHub → `Actions` tab
   - ნახე workflow-ის პროგრესი real-time

## 📁 პროექტის სტრუქტურა

```
.
├── .github/
│   └── workflows/
│       └── docker-build.yml    # CI/CD pipeline
├── index.html                  # Main HTML file
├── Dockerfile                  # Docker configuration
└── README.md                   # ეს ფაილი
```

## 🐳 Dockerfile დეტალები

```dockerfile
FROM nginx:alpine              # მსუბუქი base image (~23MB)
COPY index.html /usr/share/nginx/html/
EXPOSE 80                      # HTTP port
```

**უპირატესობები:**
- ✅ Alpine-based - უმცირესი ზომა
- ✅ Production-ready nginx
- ✅ სწრაფი startup დრო
- ✅ უსაფრთხოება და სტაბილურობა

## 🎨 კასტომიზაცია

### HTML-ის შეცვლა

დაარედაქტირე `index.html` ფაილი შენი კონტენტით:

```html
<h1>შენი სახელი</h1>
<p>DevOps Project Step 1</p>
```

### სხვა პორტზე გაშვება

```bash
docker run -d -p 3000:80 YOUR_DOCKER_USERNAME/my-devops-app:latest
```

ახლა მიუწვდება: `http://localhost:3000`

## 🔐 უსაფრთხოება

- ✅ არ დააკომიტო Docker Hub credentials
- ✅ გამოიყენე GitHub Secrets
- ✅ გამოიყენე Access Tokens პაროლის ნაცვლად
- ✅ რეგულარულად განაახლე base images

## 📊 მონიტორინგი

```bash
# Container-ის resource usage
docker stats nginx-app

# Real-time logs
docker logs -f nginx-app

# Container-ის inspection
docker inspect nginx-app
```

## 🤝 Contribution

1. Fork the repository
2. შექმენი feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit შენი ცვლილებები (`git commit -m 'Add some AmazingFeature'`)
4. Push branch-ზე (`git push origin feature/AmazingFeature`)
5. Open Pull Request

## 📝 License

ეს პროექტი გახსნილია საჯარო გამოყენებისთვის - იხილე [MIT License](LICENSE)

## 👨‍💻 ავტორი

**შენი სახელი**

- 🐱 GitHub: [@YOUR_USERNAME](https://github.com/YOUR_USERNAME)
- 🐳 Docker Hub: [YOUR_DOCKER_USERNAME](https://hub.docker.com/u/YOUR_DOCKER_USERNAME)
- 📧 Email: your.email@example.com

## 🙏 მადლობა

- [Nginx](https://nginx.org/) - მშვენიერი web server
- [Docker](https://www.docker.com/) - კონტეინერიზაციისთვის
- [GitHub Actions](https://github.com/features/actions) - CI/CD-სთვის

---

<div align="center">

**⭐ თუ პროექტი მოგეწონა, მიეცი Star! ⭐**

Made with ❤️ and ☕

</div>
