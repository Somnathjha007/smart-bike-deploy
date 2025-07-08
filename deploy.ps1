# Smart Bike Deployment Script for Windows PowerShell
# Run this script to prepare your project for deployment

Write-Host "🚴 Smart Bike Deployment Preparation" -ForegroundColor Green
Write-Host "=====================================" -ForegroundColor Green

# Check if we're in the right directory
if (-not (Test-Path "server/package.json")) {
    Write-Host "❌ Error: Please run this script from the project root directory" -ForegroundColor Red
    exit 1
}

Write-Host "📦 Installing server dependencies..." -ForegroundColor Yellow
Set-Location "server"
npm install
if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Failed to install server dependencies" -ForegroundColor Red
    exit 1
}
Set-Location ".."

Write-Host "📦 Installing client dependencies..." -ForegroundColor Yellow
Set-Location "client"
npm install
if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Failed to install client dependencies" -ForegroundColor Red
    exit 1
}

Write-Host "🏗️ Building client..." -ForegroundColor Yellow
npm run build
if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Failed to build client" -ForegroundColor Red
    exit 1
}
Set-Location ".."

Write-Host "✅ Project prepared for deployment!" -ForegroundColor Green
Write-Host ""
Write-Host "📋 Next steps:" -ForegroundColor Cyan
Write-Host "1. Push your code to GitHub:" -ForegroundColor White
Write-Host "   git add ." -ForegroundColor Gray
Write-Host "   git commit -m 'Ready for deployment'" -ForegroundColor Gray
Write-Host "   git push" -ForegroundColor Gray
Write-Host "2. Deploy server on Railway: https://railway.app" -ForegroundColor White
Write-Host "3. Deploy client on Netlify: https://netlify.com" -ForegroundColor White
Write-Host "4. Update ESP32 code with your Railway URL" -ForegroundColor White
Write-Host ""
Write-Host "📖 See DEPLOYMENT_GUIDE.md for detailed instructions" -ForegroundColor Cyan
