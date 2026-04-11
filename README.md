# 📊 n8n Performance Tracker Workflow

This project contains an **n8n workflow** that automates performance tracking using **Google Drive**, **Google Sheets**, and **AI-based data extraction**.

---

## 🚀 Overview

This workflow helps you:

* Track daily work updates
* Extract structured task data using AI
* Maintain and update tracking sheets automatically

---

## 📥 Required Files

Download the following files from this repository:

* **Workflow JSON** → `Full Automated Work Performance Tracker.json`
* **Excel Template** → `work_performance_tracker.xlsx`
* **Docker File** → `DockerFile`

---

## 🔄 Workflow Process (Short)

1. 📩 Receive Message
2. 📁 Check File in Google Drive (create if not exists)
3. 🤖 AI Extraction
4. 🧠 Code Processing
5. 🔁 Loop Tasks
6. 📝 Update Master Sheet & Daily Log

---

## 🐳 Run n8n using Docker Desktop

### 1. Install Docker Desktop

* Install Docker Desktop and ensure it is running

---

### 2. Run n8n

```bash id="t2k9df"
docker run -it --rm \
  -p 5678:5678 \
  -v ~/.n8n:/home/node/.n8n \
  n8nio/n8n
```

---

### 3. Open n8n

```id="g7m2sl"
http://localhost:5678
```

---

### 4. Run in Background (Optional)

```bash id="k8s3lp"
docker run -d \
  --name n8n \
  -p 5678:5678 \
  -v ~/.n8n:/home/node/.n8n \
  n8nio/n8n
```

---

## ⚙️ How to Use This Workflow

1. Open n8n
2. Import `Full Automated Work Performance Tracker.json`
3. Upload or connect `work_performance_tracker.xlsx`
4. Configure credentials
5. Activate workflow
6. Trigger via webhook

---

## 🔐 Google API Credentials Setup

### 1. Create Project

* https://console.cloud.google.com/
* New Project → Create

---

### 2. Enable APIs

* Google Drive API
* Google Sheets API

---

### 3. OAuth Consent Screen

* Type: External
* Add scopes:

  * `https://www.googleapis.com/auth/drive`
  * `https://www.googleapis.com/auth/spreadsheets`

---

### 4. Create OAuth Client

* Type: Web Application

---

### 5. Add Redirect URL

Local:

```id="d9c3pq"
http://localhost:5678/rest/oauth2-credential/callback
```

Hugging Face:

```id="w4z8rx"
https://your-space-name.hf.space/rest/oauth2-credential/callback
```

---

### 6. Copy Credentials

* Client ID
* Client Secret

---

## 🔗 Connect in n8n

1. Go to Credentials
2. Add:

   * Google Drive OAuth2 API
   * Google Sheets OAuth2 API
3. Paste credentials
4. Login with Google

---

## 🚀 Deployment (Hugging Face)

### 1. Create a Space

* Go to Hugging Face → Create New Space
* Select:

  * SDK: Docker
  * Visibility: Public/Private

---

### 2. Upload Files

* `DockerFile`
* (Optional) Workflow JSON

---

### 3. Add Environment Variables

* `N8N_HOST=0.0.0.0`
* `N8N_PORT=7860`
* `N8N_PROTOCOL=https`
* `N8N_EDITOR_BASE_URL=https://<your-space-name>.hf.space`
* `WEBHOOK_URL=https://<your-space-name>.hf.space`
* `N8N_PROXY_HOPS=1`
* `N8N_TRUST_PROXY=true`

---

### 4. Deploy

* Hugging Face will build and run automatically

---

### 5. Access n8n

```id="z5l1vb"
https://<your-space-name>.hf.space
```

---

### 6. Import Workflow

* Open n8n
* Import `Full Automated Work Performance Tracker.json`
* Configure credentials
* Activate workflow

---

## 🚀 Ready to Use

You can now run your workflow locally and deploy it to Hugging Face for public access.

---
