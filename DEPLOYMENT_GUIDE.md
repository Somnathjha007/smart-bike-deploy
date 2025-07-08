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

In your ESP32 code (`esp32__code/ESP32 Code.ino`), update these lines:

```cpp
// Replace this:
const char* DEFAULT_SERVER_HOST = "your-deployed-server.herokuapp.com";
const int DEFAULT_SERVER_PORT = 80;

// With your Railway URL (remove https:// and port):
const char* DEFAULT_SERVER_HOST = "your-app-name.up.railway.app";
const int DEFAULT_SERVER_PORT = 443;  // Use 443 for HTTPS
```

### Step 3.2: Update buildServerUrl Function

Also update the `buildServerUrl` function to use HTTPS:

```cpp
String buildServerUrl(const char* endpoint) {
  return "https://" + config.serverHost + endpoint;  // Changed to https://
}
```

### Step 3.3: Flash Updated Code to ESP32

1. Connect your ESP32 to your computer
2. Open Arduino IDE
3. Upload the updated code
4. Monitor Serial output to verify connection

## 🎯 Alternative Free Platforms

### For Server Deployment:

1. **Railway** 🚂 (Recommended)
   - Free: $5/month credit
   - Very beginner-friendly
   - Auto-deployments from GitHub

2. **Render** 🎨
   - Free tier available
   - Auto-deployments
   - Easy setup

3. **Fly.io** ✈️
   - Generous free tier
   - Global deployment
   - Docker-based

4. **Cyclic** 🔄
   - Free tier
   - Serverless
   - Simple deployment

### For Client Deployment:

1. **Netlify** 🌐 (Recommended)
   - 100GB bandwidth free
   - Drag & drop deployment
   - Custom domains

2. **Vercel** ⚡
   - Unlimited bandwidth
   - Perfect for React apps
   - GitHub integration

3. **GitHub Pages** 📄
   - Free for public repos
   - Built into GitHub
   - Custom domains

4. **Surge.sh** 🌊
   - Simple CLI deployment
   - Free custom domains
   - Fast setup

## 🧪 Testing Your Deployment

### Step 1: Test Server
```bash
# Test health endpoint
curl https://your-railway-url.up.railway.app/health

# Should return:
# {"status":"healthy","timestamp":"...","uptime":...}
```

### Step 2: Test Client
1. Visit your Netlify URL
2. Try logging in with test credentials:
   - Email: `amit.sharma@example.in`
   - Password: `password123`

### Step 3: Test ESP32 Data Flow
1. Power on your ESP32
2. Check Serial Monitor for connection messages
3. Verify data appears in your client dashboard

## 🔧 Troubleshooting

### ESP32 Not Connecting?
- Check WiFi credentials
- Verify server URL (no `https://` prefix in ESP32 code)
- Check firewall settings
- Ensure server is running

### Client Not Loading?
- Check environment variables
- Verify API URL in .env file
- Check browser console for errors
- Ensure CORS is configured correctly

### Server Errors?
- Check Railway logs
- Verify environment variables
- Check JSON file permissions
- Monitor server health endpoint

## 📱 Quick Setup Commands

Here are the complete commands to deploy everything:

```bash
# 1. Prepare for deployment
git add .
git commit -m "Ready for deployment"
git push origin main

# 2. Build client locally (optional - for testing)
cd client
echo "VITE_API_URL=https://your-railway-url.up.railway.app" > .env
npm install
npm run build
cd ..

# 3. Test server locally (optional)
cd server
npm install
npm start
```

## 🎉 Success Checklist

- [ ] Server deployed on Railway
- [ ] Client deployed on Netlify
- [ ] ESP32 code updated with new server URL
- [ ] ESP32 successfully sending data
- [ ] Client receiving real-time updates
- [ ] Authentication working
- [ ] All endpoints responding correctly

## 💡 Pro Tips

1. **Use environment variables** for all configuration
2. **Monitor your free tier usage** to avoid surprises
3. **Set up GitHub Actions** for automatic deployments
4. **Use custom domains** for better branding
5. **Monitor server logs** regularly
6. **Keep backups** of your data files

## 📞 Need Help?

If you encounter issues:
1. Check the troubleshooting section above
2. Review platform documentation
3. Check GitHub Issues for similar problems
4. Join platform Discord communities (Railway, Netlify have great ones!)

---

**Congratulations! Your Smart Bike system should now be deployed and running in the cloud! 🎊**

