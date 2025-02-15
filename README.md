Zsh Configuration

This repository contains my customized Zsh configuration with powerlevel10k, useful aliases, functions, and plugins.

## Features
- **Powerlevel10k Prompt**: A fast and customizable prompt.
- **Aliases**: Common Git, Docker, and system shortcuts.
- **Plugins**: Includes autosuggestions, syntax highlighting, and more.
- **Custom Functions**: IP address lookup, file extraction, server startup, and more.
- **Environment Variables**: Pre-configured PATH, Java, Node.js, and FZF.

## Installation
1. Install Zsh and Oh My Zsh:
   \`\`\`sh
   sudo apt install zsh -y
   install ouh my zsh
   \`\`\`
2. Clone this repository:
   \`\`\`sh
   git clone https://github.com/0Bleak/zsh-config.git ~/.zsh-config
   \`\`\`
3. Symlink the configuration:
   \`\`\`sh
   ln -s ~/.zsh-config/.zshrc ~/.zshrc
   \`\`\`
4. Restart Zsh:
   \`\`\`sh
   exec zsh
   \`\`\`

## Aliases
Some handy aliases included:
- \`ll\` → \`ls -alF\`
- \`ga\` → \`git add\`
- \`gp\` → \`git push\`
- \`dcu\` → \`docker-compose up\`
- \`devserver\` → Starts a Python HTTP server

## Functions
- \`myip\`: Displays all IP addresses.
- \`mkcd\`: Creates and enters a directory.
- \`extract\`: Extracts compressed files based on format.
- \`randompass\`: Generates a random password.
