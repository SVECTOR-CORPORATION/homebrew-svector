# SVECTOR Homebrew Tap

Official Homebrew tap for SVECTOR AI tools.

## Installation

```bash
# Add the tap
brew tap svector-corporation/tap

# Install SVECTOR CLI
brew install svector
```

## Quick Start

```bash
# Set your API key
svector config set-key your-api-key-here

# Start chatting
svector chat "Hello, how are you?"

# Stream responses
svector stream "Tell me about artificial intelligence"

# List available models
svector models
```

## What is SVECTOR?

SVECTOR is an advanced AI platform providing cutting-edge conversational AI and language models. Our CLI tool brings the power of SVECTOR AI directly to your terminal.

### Features

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
- **Documentation**: https://www.svector.co.in/docs
- **Support**: support@svector.co.in
- **Issues**: https://github.com/svector-corporation/homebrew-svector/issues

## License

MIT License - see LICENSE file for details.
