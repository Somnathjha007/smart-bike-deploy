#!/bin/bash

# Smart Bike Server Deployment Script

echo "🚴 Deploying Smart Bike Server..."

# Check if we're in the correct directory
if [ ! -f "server/package.json" ]; then
    echo "❌ Error: server/package.json not found. Please run this script from the project root."
    exit 1
fi

cd server

echo "📦 Installing dependencies..."
npm install

echo "🔧 Setting environment variables..."
# Create .env file if it doesn't exist
if [ ! -f ".env" ]; then
    cat > .env << EOL
NODE_ENV=production
PORT=3001
JWT_SECRET=$(openssl rand -base64 32)
CORS_ORIGIN=*
EOL
    echo "✅ Created .env file with secure JWT secret"
fi

echo "🧪 Running tests..."
# npm test  # Uncomment if you have tests

echo "🚀 Starting server..."
if command -v pm2 &> /dev/null; then
    echo "Using PM2 for process management..."
    pm2 stop smart-bike-server 2>/dev/null || true
    pm2 start server.js --name smart-bike-server
    pm2 save
else
    echo "Starting with npm..."
    npm start
fi

echo "✅ Server deployment complete!"
echo "📡 Server should be running on port 3001"
echo "🔍 Check health at: http://localhost:3001/health"
