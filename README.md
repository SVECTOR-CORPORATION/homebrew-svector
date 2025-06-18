# 🍺 Spec Chat CLI Homebrew (Experimental)

Official Homebrew tap for installing the SVECTOR AI CLI globally on macOS.

[![Homebrew](https://img.shields.io/badge/Homebrew-Ready-orange.svg)](https://brew.sh)
[![Version](https://img.shields.io/badge/Version-1.1.3-blue.svg)](https://github.com/SVECTOR-CORPORATION/homebrew-svector)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

## 🚀 Quick Installation

```bash
# Add the SVECTOR tap
brew tap svector-corporation/svector

# Install SVECTOR CLI
brew install svector
```

## 📦 What's Included

The SVECTOR CLI provides:

- **🤖 Chat Commands** - Direct conversation with SVECTOR AI models
- **🌊 Streaming Support** - Real-time response streaming
- **📋 Model Management** - List and select from available models
- **⚙️ Configuration** - Easy API key management
- **🔄 Auto-updates** - Stay current with latest features

## 🛠️ Usage

### First Time Setup

```bash
# Set your SVECTOR API key (get one from https://platform.svector.co.in)
svector config set-key YOUR_API_KEY_HERE
```

### Basic Commands

```bash
# Simple chat
svector chat "Hello, what is artificial intelligence?"

# Streaming response (real-time)
svector stream "Tell me a story about the future of AI"

# List available models
svector models

# Show current configuration
svector config show

# Help and usage
svector --help
```

### Advanced Usage

```bash
# Chat with specific model
svector chat "Explain quantum computing" --model spec-3-turbo:latest

# Stream with temperature control
svector stream "Write a poem" --temperature 0.8

# Chat with file context
svector chat "Summarize this document" --file /path/to/document.pdf

# Set max tokens
svector chat "Brief explanation" --max-tokens 100
```

## 🔧 Configuration

SVECTOR CLI stores configuration in `~/.svector/config.json`:

```json
{
  "apiKey": "your-api-key",
  "defaultModel": "spec-3-turbo:latest",
  "maxTokens": 150,
  "temperature": 0.7
}
```

## 📚 Models Available

- **spec-3-turbo:latest** - Fast, efficient for most tasks
- **spec-3:latest** - High-quality responses
- **theta-35:latest** - Advanced reasoning and analysis
- **theta-35-mini:latest** - Lightweight, fast responses

## 🔄 Updates

Update to the latest version:

```bash
brew update
brew upgrade svector
```

## 🗑️ Uninstall

```bash
brew uninstall svector
brew untap svector-corporation/svector
```

## 📝 Examples

### Creative Writing
```bash
svector stream "Write a short story about a robot learning to paint"
```

### Code Help
```bash
svector chat "Explain this TypeScript code: async function fetchData() { ... }"
```

### Research Assistant
```bash
svector chat "What are the latest developments in renewable energy?"
```

### Interactive Learning
```bash
svector stream "Teach me about quantum physics, step by step"
```

## 🛡️ Environment Variables

You can also set configuration via environment variables:

```bash
export SVECTOR_API_KEY="your-api-key"
export SVECTOR_MODEL="spec-3-turbo:latest"
export SVECTOR_MAX_TOKENS="200"
export SVECTOR_TEMPERATURE="0.7"
```

## 🐛 Troubleshooting

### API Key Issues
```bash
# Check current configuration
svector config show

# Reset API key
svector config set-key NEW_API_KEY
```

### Connection Issues
```bash
# Test connectivity
svector chat "test"

# Check your API key at https://platform.svector.co.in
```

### Formula Issues
```bash
# Reinstall formula
brew uninstall svector
brew install svector

# Update tap
brew tap --repair svector-corporation/svector
```

## 🔗 Links

- **🌐 SVECTOR Website**: https://www.svector.co.in
- **📖 API Documentation**: https://platform.svector.co.in
- **💬 Support**: support@svector.co.in
- **🐛 Issues**: https://github.com/SVECTOR-CORPORATION/homebrew-svector/issues
- **📦 npm Package**: https://www.npmjs.com/package/svector-sdk
- **🐍 Python SDK**: https://pypi.org/project/svector-sdk/

## 📄 License

MIT License - see [LICENSE](LICENSE) file for details.

## 🏢 About SVECTOR

SVECTOR is a technology-driven organization focused on AI, Mathematics, and Computational research, developing high-performance AI models, mathematical reasoning systems, and next-gen automation.

---

**Made with ❤️ by the SVECTOR Team**
