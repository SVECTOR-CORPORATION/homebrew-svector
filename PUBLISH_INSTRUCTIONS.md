# SVECTOR Homebrew Tap - Public Release Instructions

## Step 1: Create GitHub Repository

1. Go to GitHub and create a new repository:
   - Repository name: `homebrew-svector`
   - Owner: `svector-corporation`
   - Description: "Official Homebrew tap for SVECTOR AI CLI tools"
   - Make it **Public**
   - Do NOT initialize with README (we already have one)

## Step 2: Add Remote and Push

```bash
# Add the GitHub remote
git remote add origin https://github.com/svector-corporation/homebrew-svector.git

# Push to GitHub
git branch -M main
git push -u origin main
```

## Step 3: Verify Public Access

Once pushed, users worldwide can install SVECTOR CLI with:

```bash
# Add the tap
brew tap svector-corporation/svector

# Install SVECTOR CLI
brew install svector
```

## Step 4: Alternative Installation Methods

Users can also install directly without tapping:

```bash
# Install directly from GitHub
brew install svector-corporation/svector/svector
```

## Repository Structure

The public repository will contain:
```
homebrew-svector/
├── Formula/
│   └── svector.rb          # Main formula file
├── README.md               # Installation instructions
├── LICENSE                 # MIT License
└── .git/                   # Git repository
```

## Important Notes

1. **Naming Convention**: Repository MUST be named `homebrew-svector` for Homebrew to recognize it as a tap
2. **Formula Location**: Formula MUST be in `Formula/` directory
3. **Public Access**: Repository MUST be public for global access
4. **GitHub URL**: Will be accessible at `https://github.com/svector-corporation/homebrew-svector`

## Post-Publication Commands

After publishing, users can install with:

```bash
# Method 1: Via tap (recommended)
brew tap svector-corporation/svector
brew install svector

# Method 2: Direct install
brew install svector-corporation/svector/svector

# Method 3: One-line install
brew install https://raw.githubusercontent.com/svector-corporation/homebrew-svector/main/Formula/svector.rb
```

## Formula Features

The published formula includes:
- Professional CLI interface
- Automatic dependency management (Node.js)
- Clean installation process
- Proper error handling
- Cross-platform compatibility (macOS, Linux)
- Integration with SVECTOR AI API

## Testing Installation

After publication, test with:

```bash
# Uninstall local version
brew uninstall svector

# Install from GitHub
brew tap svector-corporation/svector
brew install svector

# Test CLI
svector help
svector config set-key your-api-key
svector chat "Hello from Homebrew!"
```

This will make SVECTOR CLI available to millions of Homebrew users worldwide!
