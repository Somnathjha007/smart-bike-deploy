# 🚀 Smart Bike Deployment Guide for Beginners

This guide will help you deploy your Smart Bike application using **free** and **beginner-friendly** platforms.

## 📋 Overview

- **Server**: Deploy on Railway (free tier)
- **Client**: Deploy on Netlify (free tier)
- **ESP32**: Update to connect to deployed server

## 🚂 Part 1: Deploy Server on Railway

Railway is perfect for beginners and offers:
- ✅ Free tier with $5/month credit
- ✅ Automatic deployments from GitHub
- ✅ Built-in environment variables
- ✅ Easy domain management

### Step 1.1: Prepare Your Repository

1. **Push your code to GitHub** (if not already done):
   ```bash
   git add .
   git commit -m "Prepare for deployment"
   git push origin main
   ```

### Step 1.2: Deploy on Railway

1. **Go to Railway**: Visit [railway.app](https://railway.app)
2. **Sign up** with your GitHub account
3. **Create New Project** → **Deploy from GitHub repo**
4. **Select your repository**: `smart-bike-deploy`
5. **Configure the service**:
   - **Root Directory**: `server`
   - **Start Command**: `npm start`

### Step 1.3: Set Environment Variables

In Railway dashboard, go to your service → **Variables** tab:

```env
NODE_ENV=production
PORT=3001
JWT_SECRET=your-super-secret-jwt-key-replace-this
CORS_ORIGIN=*
```

### Step 1.4: Get Your Server URL

After deployment, Railway will give you a URL like:
`https://your-app-name.up.railway.app`

**Save this URL** - you'll need it for the ESP32 and client!

## 🌐 Part 2: Deploy Client on Netlify

Netlify is perfect for frontend apps:
- ✅ Free tier with 100GB bandwidth
- ✅ Automatic deployments
- ✅ Custom domains
- ✅ Form handling

### Step 2.1: Build the Client

1. **Navigate to client directory**:
   ```bash
   cd client
   ```

2. **Create environment file**:
   ```bash
   # Create .env file
   echo "VITE_API_URL=https://your-app-name.up.railway.app" > .env
   echo "VITE_APP_NAME=Smart Bike Dashboard" >> .env
   ```
   
   **Replace `your-app-name.up.railway.app` with your actual Railway URL!**

3. **Install dependencies and build**:
   ```bash
   npm install
   npm run build
   ```

### Step 2.2: Deploy on Netlify

**Option A: Drag & Drop (Easiest)**
1. Go to [netlify.com](https://netlify.com)
2. Sign up with GitHub
3. Drag the `client/dist` folder to Netlify
4. Done! You'll get a URL like `https://amazing-name-123456.netlify.app`

**Option B: GitHub Integration (Automatic updates)**
1. In Netlify dashboard → **New site from Git**
2. Choose GitHub → Select your repository
3. Set **Base directory**: `client`
4. Set **Build command**: `npm run build`
5. Set **Publish directory**: `client/dist`
6. Add environment variables:
   - `VITE_API_URL`: `https://your-railway-url.up.railway.app`

## 🔧 Part 3: Update ESP32 Configuration

### Step 3.1: Update Server URL in ESP32 Code

