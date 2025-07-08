#!/bin/bash

# Smart Bike Client Deployment Script

echo "🌐 Deploying Smart Bike Client..."

# Check if we're in the correct directory
if [ ! -f "client/package.json" ]; then
    echo "❌ Error: client/package.json not found. Please run this script from the project root."
    exit 1
fi

cd client

echo "📦 Installing dependencies..."
npm install

echo "🔧 Setting environment variables..."
# Create .env file if it doesn't exist
if [ ! -f ".env" ]; then
    cat > .env << EOL
VITE_API_URL=http://localhost:3001
VITE_APP_NAME=Smart Bike Dashboard
EOL
    echo "✅ Created .env file"
    echo "⚠️  Please update VITE_API_URL with your deployed server URL"
fi

echo "🏗️ Building client..."
npm run build

echo "✅ Client build complete!"
echo "📁 Built files are in the 'dist' directory"
echo "🚀 You can now deploy the 'dist' folder to:"
echo "   - Netlify (drag & drop)"
echo "   - Vercel (CLI or GitHub integration)"
echo "   - Any static hosting service"

echo ""
echo "📋 Next steps:"
echo "1. Update .env with your server URL"
echo "2. Rebuild: npm run build"
echo "3. Deploy dist/ folder to your hosting provider"
