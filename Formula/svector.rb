class Svector < Formula
  desc "Official SVECTOR AI CLI - Advanced conversational AI and language models"
  homepage "https://www.svector.co.in"
  url "https://registry.npmjs.org/svector-sdk/-/svector-sdk-1.0.4.tgz"
  sha256 "24265152ac672b3b9d32a00b5cd3b7b9b513704a823e1ecf4d71c55020a0a367"
  license "MIT"
  version "1.0.4"

  depends_on "node"

  def install
    # Extract the tarball
    system "tar", "-xzf", cached_download

    # Find the package directory
    package_dir = Dir.glob("package").first

    if package_dir.nil?
      odie "Could not find package directory in tarball"
    end

    cd package_dir

    # Install npm dependencies
    system "npm", "install", "--production"

    # Install to prefix
    libexec.install Dir["*"]

    # Make the CLI available globally by installing just what we need
    # Copy svector-sdk module to a local location
    (lib/"node_modules").mkpath
    (lib/"node_modules").install libexec => "svector-sdk"

    # Create the CLI wrapper script
    (bin/"svector").write <<~EOS
      #!/usr/bin/env node

      const { SVECTOR } = require('#{lib}/node_modules/svector-sdk');
      const fs = require('fs');
      const path = require('path');
      const os = require('os');

      const CONFIG_FILE = path.join(os.homedir(), '.svector', 'config.json');

      // Ensure config directory exists
      function ensureConfigDir() {
        const configDir = path.dirname(CONFIG_FILE);
        if (!fs.existsSync(configDir)) {
          fs.mkdirSync(configDir, { recursive: true });
        }
      }

      // Load config
      function loadConfig() {
        try {
          if (fs.existsSync(CONFIG_FILE)) {
            return JSON.parse(fs.readFileSync(CONFIG_FILE, 'utf8'));
          }
        } catch (error) {
          console.error('Error loading config:', error.message);
        }
        return {};
      }

      // Save config
      function saveConfig(config) {
        try {
          ensureConfigDir();
          fs.writeFileSync(CONFIG_FILE, JSON.stringify(config, null, 2));
        } catch (error) {
          console.error('Error saving config:', error.message);
        }
      }

      // Show help
      function showHelp() {
        console.log(`
      🚀 SVECTOR CLI - Official AI command line interface

      USAGE:
        svector <command> [options]

      COMMANDS:
        chat <message>              Send a chat message to SVECTOR AI
        stream <message>            Stream a chat response in real-time
        models                      List available models
        config set-key <api-key>    Set your SVECTOR API key
        config show                 Show current configuration
        help                        Show this help message

      EXAMPLES:
        svector config set-key sk-your-api-key-here
        svector chat "Hello, how are you?"
        svector stream "Tell me about AI"
        svector models

      For more information, visit: https://www.svector.co.in
        `);
      }

      // Main CLI logic
      async function main() {
        const args = process.argv.slice(2);
        const command = args[0];
        const config = loadConfig();

        if (!command || command === 'help' || command === '--help' || command === '-h') {
          showHelp();
          return;
        }

        // Handle config commands
        if (command === 'config') {
          const subcommand = args[1];

          if (subcommand === 'set-key') {
            const apiKey = args[2];
            if (!apiKey) {
              console.error('❌ Please provide an API key');
              console.log('Usage: svector config set-key <your-api-key>');
              process.exit(1);
            }

            config.apiKey = apiKey;
            saveConfig(config);
            console.log('✅ API key saved successfully');
            return;
          }

          if (subcommand === 'show') {
            console.log('Current configuration:');
            console.log(JSON.stringify(config, null, 2));
            return;
          }

          console.error('❌ Unknown config command. Use: set-key or show');
          return;
        }

        // Check for API key
        if (!config.apiKey) {
          console.error('❌ No API key configured');
          console.log('Please set your API key first:');
          console.log('  svector config set-key <your-api-key>');
          process.exit(1);
        }

        // Initialize SVECTOR client
        const client = new SVECTOR({
          apiKey: config.apiKey,
        });

        try {
          if (command === 'chat') {
            const message = args.slice(1).join(' ');
            if (!message) {
              console.error('❌ Please provide a message');
              console.log('Usage: svector chat <your-message>');
              process.exit(1);
            }

            console.log('SVECTOR AI Response:');
            const response = await client.chat.create({
              model: 'spec-3-turbo:latest',
              messages: [{ role: 'user', content: message }],
            });

            console.log(response.choices[0].message.content);

          } else if (command === 'stream') {
            const message = args.slice(1).join(' ');
            if (!message) {
              console.error('❌ Please provide a message');
              console.log('Usage: svector stream <your-message>');
              process.exit(1);
            }

            console.log('🌊 SVECTOR AI Streaming Response:');
            const stream = await client.chat.createStream({
              model: 'spec-3-turbo:latest',
              messages: [{ role: 'user', content: message }],
              stream: true,
            });

            for await (const event of stream) {
              if (event.choices?.[0]?.delta?.content) {
                process.stdout.write(event.choices[0].delta.content);
              }
            }
            console.log('\\n');

          } else if (command === 'models') {
            console.log('📋 Available SVECTOR Models:');
            const models = await client.models.list();

            if (models.models && models.models.length > 0) {
              models.models.forEach((model, index) => {
                console.log(`  ${index + 1}. ${model}`);
              });
            } else {
              console.log('  No models available');
            }

          } else {
            console.error(`❌ Unknown command: ${command}`);
            console.log('Run "svector help" for usage information');
            process.exit(1);
          }

        } catch (error) {
          console.error('❌ Error:', error.message);
          process.exit(1);
        }
      }

      // Run the CLI
      main().catch((error) => {
        console.error('❌ Unexpected error:', error.message);
        process.exit(1);
      });
    EOS

    chmod 0755, bin/"svector"
  end

  test do
    # Test that the binary exists and is executable
    assert_predicate bin/"svector", :exist?
    assert_predicate bin/"svector", :executable?

    # Test help command
    output = shell_output("#{bin}/svector help 2>&1")
    assert_match "SVECTOR CLI", output
    assert_match "USAGE:", output
  end
end
