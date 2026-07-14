# Jotun Nvim
### A high-performance Neovim configuration based on kickstart.nvim and LunarVim.

Jotun Nvim is a curated Neovim setup tailored for TypeScript and Godot development, blending the simplicity of [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) with the productivity patterns of LunarVim.

## ✨ Features

- **Language Support**: First-class support for TypeScript, Godot (GDScript), Lua, Rust, Python, and C/C++.
- **UI/UX**: Powered by `tokyonight-night` for a sleek look, `blink.cmp` for lightning-fast completions, and `which-key` for intuitive keymap discovery.
- **Productivity**: Integrated AI tools, advanced git gutter signs, and a modular plugin architecture.
- **Environment Aware**: Specialized configurations for Neovide (GUI) and automatic Godot project detection.
- **VSCode Integration**: Seamlessly switches to a minimal config when running inside VSCode.

## 🚀 Installation

### 1. Prerequisites
Ensure you have the following installed on your system:
- **Neovim**: Latest stable or nightly version.
- **Basic Utils**: `git`, `make`, `unzip`, `gcc`.
- **Search Tools**: [ripgrep](https://github.com/BurntSushi/ripgrep), [fd-find](https://github.com/sharkdp/fd).
- **Fonts**: A [Nerd Font](https://www.nerdfonts.com/) is highly recommended for icons.

### 2. Setup
Clone the repository into your Neovim configuration directory:

**Linux/MacOS:**
```sh
git clone https://github.com/PatrickDorneles/JotunNvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
```

**Windows (PowerShell):**
```sh
git clone https://github.com/PatrickDorneles/JotunNvim.git "${env:LOCALAPPDATA}\nvim"
```

### 3. Launch
Start Neovim. `lazy.nvim` will automatically install all required plugins.
```sh
nvim
```

## 🛠 Configuration Structure

The configuration is modularized to ensure maintainability and scalability.

```text
.
├── init.lua               # Entry point, core options, and lazy.nvim setup
├── lua/
│   ├── code/              # VSCode-specific configuration
│   ├── jotun/             # Custom Jotun configuration
│   │   ├── keymaps/       # Modular keybindings (default, utils, prohibitions)
│   │   └── plugins/       # Plugin specifications split by category (ai, debug, looks, etc.)
│   └── utils/             # General helper modules (bufferline, check-file, tmux)
└── scripts/               # External integration scripts (e.g., Godot bridge)
```

## ⌨️ Customization

### Adding Plugins
Plugins are organized in `lua/jotun/plugins/`. To add a new one:
1. Find the relevant file (e.g., `ai.lua` for AI tools, `looks.lua` for UI).
2. Add the plugin spec as a table. Example:
   ```lua
   { 'plugin-owner/plugin-name', opts = { ... } }
   ```

### Modifying Keymaps
Keymaps are defined in `lua/jotun/keymaps/`. Use `vim.keymap.set` and always include a `desc` for `which-key` integration.

## 🤖 AI-Driven Development
This project includes an `AGENTS.md` file designed to provide AI agents with the necessary context and conventions to help maintain and extend the configuration.

## 📜 License
See [LICENSE.md](LICENSE.md) for details.
