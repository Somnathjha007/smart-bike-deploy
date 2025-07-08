# 🚴 Smart Bike IoT System

A complete IoT bike tracking system with real-time data streaming from ESP32 to a web dashboard.

## 🏗️ Architecture

- **ESP32**: Sends bike data (speed, location, battery) via HTTP
- **Server**: Node.js/Express backend with Socket.IO for real-time updates
- **Client**: React dashboard with live data visualization
- **Storage**: JSON files for user data and bike information

## 🚀 Quick Deploy (Free Platforms)

### 1. Deploy Server (Railway - Free $5/month credit)
1. Go to [railway.app](https://railway.app)
2. Connect GitHub and select this repository
3. Set root directory to `server`
4. Add environment variables:
   ```
   NODE_ENV=production
   JWT_SECRET=your-secret-key
   CORS_ORIGIN=*
   ```

### 2. Deploy Client (Netlify - Free 100GB bandwidth)
1. Go to [netlify.com](https://netlify.com)
2. Drag the `client/dist` folder to deploy
3. Or connect GitHub for auto-deployments

### 3. Update ESP32
```cpp
// In ESP32 Code.ino, update:
const char* DEFAULT_SERVER_HOST = "your-app.up.railway.app";
const int DEFAULT_SERVER_PORT = 443;
```

## 📱 One-Click Setup

Run the deployment script:
```powershell
# Windows PowerShell
.\deploy.ps1
```

## 🧪 Test Credentials

- **Email**: `amit.sharma@example.in`
- **Password**: `password123`

## 📊 Features

- Real-time bike tracking
- User authentication (JWT)
- Guardian-ward relationship management
- Live data visualization
- Battery monitoring
- Location tracking
- Historical data storage

## 🛠️ Local Development

### Server
```bash
cd server
npm install
npm start  # Runs on port 3001
```

### Client
```bash
cd client
npm install
npm run dev  # Runs on port 5173
```

### ESP32
1. Update WiFi credentials in `ESP32 Code.ino`
2. Flash to ESP32-S3
3. Monitor serial output

## 📖 Detailed Guide

See [DEPLOYMENT_GUIDE.md](DEPLOYMENT_GUIDE.md) for complete deployment instructions.

## 🔧 Tech Stack

- **Backend**: Node.js, Express, Socket.IO, JWT
- **Frontend**: React, TypeScript, Vite, Tailwind CSS
- **Hardware**: ESP32-S3, WiFi
- **Deployment**: Railway, Netlify
- **Storage**: JSON files (easily migrateable to databases)

## 📞 Support

- Check `DEPLOYMENT_GUIDE.md` for troubleshooting
- Review platform documentation (Railway, Netlify)
- Join community Discord servers for help

---

**🎯 Goal**: Deploy your IoT bike tracking system in under 15 minutes!
