#!/bin/bash
set -e

echo "🚀 Setting up Microhack Trustworthy AI development environment..."
echo "📦 Creating Python virtual environment (.evalenv)..."

# Install UV for faster pip installs
echo "⚡ Installing UV package manager..."
pip install --upgrade pip
pip install uv

python -m venv .venv

# Activate virtual environment
source .venv/bin/activate

# Install app requirements (Streamlit, FastAPI, etc.)
echo "📚 Installing app requirements..."
uv pip install -r ./app/requirements.txt

# Deactivate virtual environment
deactivate  

# Activate virtual environment
source .venv/bin/activate

# Create Python virtual environment
echo "📦 Creating Python virtual environment (.evalenv)..."
python -m venv .evalenv

# Activate virtual environment
source .evalenv/bin/activate

# Install scripts requirements (AI evaluation tools)
echo "📚 Installing scripts requirements..."
uv pip install -r ./scripts/requirements.txt

# Install PowerShell Az module (optional - can take a while)
echo "💻 Installing PowerShell Az module..."
pwsh -Command "Set-PSRepository -Name PSGallery -InstallationPolicy Trusted; Install-Module -Name Az -Scope CurrentUser -Force -AllowClobber" || echo "⚠️ Az module installation skipped (can be installed manually if needed)"

echo ""
echo "✅ =============================================="
echo "✅ Development environment setup complete!"
echo "✅ =============================================="
echo ""
echo "📋 Next steps:"
echo "   1. Activate the virtual environment:"
echo "      source .evalenv/bin/activate"
echo ""
echo "   2. Login to Azure:"
echo "      azd auth login"
echo "      az login"
echo ""
echo "   3. Create a new azd environment:"
echo "      azd env new"
echo ""
echo "   4. Deploy Azure resources:"
echo "      azd up"
echo ""
echo "🔗 See code/0_challenge/README.md for full setup instructions"
echo ""
