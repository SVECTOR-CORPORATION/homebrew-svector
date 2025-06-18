# SVECTOR Homebrew Tap

Official Homebrew tap for SVECTOR AI CLI tools.

## About SVECTOR

**SVECTOR** is a technology-driven organization focused on AI, Mathematics, and Computational research, developing cutting-edge language models including:

- **Spec-3**, **Spec-3-Turbo**, **Spec-3.5** - Advanced reasoning models
- **Theta-35**, **Theta-35-Mini** - Large-scale enterprise models  
- **Mathematical Reasoning Systems** - Next-gen computational frameworks
- **Spec Chat** - Web interface at [spec-chat.tech](https://spec-chat.tech)

This CLI provides command-line access to SVECTOR's AI models for developers, automation, and application integration.

## Installation

```bash
# Add the tap
brew tap svector-corporation/svector

# Install SVECTOR CLI
brew install svector
```

## Quick Start

```bash
# Set your SVECTOR API key
svector config set-key your-api-key-here

# Use SVECTOR's models
svector chat "Hello, how are you?" --model spec-3-turbo:latest

# Stream responses in real-time
svector stream "Explain quantum computing" --model theta-35:latest

# List all available SVECTOR models
svector models
```

## SVECTOR's AI Models

Access SVECTOR's cutting-edge AI models via command line:

### Available Models:
- **`spec-3-turbo:latest`** - High-performance general-purpose model
- **`spec-3:latest`** - Advanced reasoning model for complex tasks
- **`spec-3.5:latest`** - Next-generation model with enhanced capabilities (coming soon)
- **`theta-35:latest`** - Large-scale model for enterprise applications  
- **`theta-35-mini:latest`** - Efficient model optimized for performance

### CLI Features

- **Advanced AI Models**: Access to SVECTOR's state-of-the-art language models
- **Real-time Streaming**: Get responses as they're generated
- **Easy Configuration**: Simple setup and API key management
- **Cross-platform**: Works on macOS, Linux, and Windows
- **Developer-friendly**: Perfect for automation and scripting

### Commands

- `svector chat <message>` - Send a chat message
- `svector stream <message>` - Stream a response in real-time
- `svector models` - List available models
- `svector config set-key <key>` - Set your API key
- `svector config show` - Show current configuration

## Support

- **Website**: https://www.svector.co.in
- **Documentation**: https://platform.svector.co.in
- **Support**: support@svector.co.in
- **Issues**: https://github.com/svector-corporation/homebrew-svector/issues

## License

MIT License - see LICENSE file for details.
