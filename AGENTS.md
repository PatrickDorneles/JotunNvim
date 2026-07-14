# Agent Knowledge Base: Jotun Nvim

This document provides the necessary context and guidelines for AI agents to maintain and extend the Jotun Nvim configuration.

## Project Overview
Jotun Nvim is a personal Neovim configuration based on `kickstart.nvim` and inspired by `LunarVim`. It is designed for a high-performance development environment, with a strong focus on TypeScript and Godot development.

## Architecture & Structure

### Core Entry Point
- `init.lua`: The main entry point. Handles basic Vim options, leader key definition, and initializes the `lazy.nvim` plugin manager. It also contains specific logic for Neovide and Godot integration.

### Custom Configuration (`lua/jotun/`)
The configuration is modularized under the `lua/jotun/` directory to keep `init.lua` clean.

#### Keymaps (`lua/jotun/keymaps/`)
- `init.lua`: Loads all keymap modules.
- `default.lua`: General purpose keybindings.
- `utils.lua`: Bindings for utility functions.
- `prohibitions.lua`: Overrides or disables certain default behaviors.

#### Plugins (`lua/jotun/plugins/`)
Plugins are split into logical files. To add a new plugin, identify the most relevant file or create a new one if it doesn't fit.
- `ai.lua`: AI-related plugins (e.g., Copilot).
- `debug.lua`: DAP and debugging tools.
- `folke.lua`: Plugins authored by folke (e.g., which-key, telescope).
- `gitsigns.lua`: Git gutter and signs.
- `langs.lua`: Language-specific LSP and Treesitter configurations.
- `looks.lua`: Theme, statusline, and UI enhancements.
- `test.lua`: Test runner integrations.
- `utils.lua`: General productivity plugins.
- `init.lua`: Core essential plugins (e.g., oil.nvim, nvim-origami).

### Utility Modules (`lua/utils/`)
General helper functions used across the configuration.
- `check-file.lua`: Provides utility functions to check for the existence of config files (e.g., `biome.jsonc`) to conditionally load plugins.
- `bufferline.lua`: Custom logic for buffer management.
- `tmux-rename-tab.lua`: Integration with tmux for automatic tab renaming.

## Development Conventions

### Adding a New Plugin
1. Create or open the relevant file in `lua/jotun/plugins/`.
2. Add the plugin specification as a table return (or part of the returned list).
3. Use `opts = {}` for simple configurations or `config = function() ... end` for complex setups.
4. If the plugin depends on a specific file existing in the project root, use `require('utils.check-file')`.

### Adding New Keymaps
1. Open `lua/jotun/keymaps/default.lua` (or the appropriate category file).
2. Use `vim.keymap.set(mode, lhs, rhs, opts)`.
3. Always provide a `desc` (description) in the `opts` table to ensure `which-key` can display it.

### Code Style
- Use 2-space indentation.
- Prefer `require` over global variables.
- Follow the `kickstart.nvim` pattern of using `lazy.nvim` for all plugin management.
- Avoid adding comments unless they explain *why* a non-obvious configuration choice was made.

## Integration Specifics
- **Godot**: The config checks for `project.godot` in the CWD or parent directory to enable the GDScript LSP and start a server pipe for Neovide.
- **Neovide**: GUI-specific settings (like fonts) are wrapped in `if vim.g.neovide then` blocks in `init.lua`.
- **VSCode**: If detected, it loads `lua/code/init.lua` and skips the rest of the Neovim config.
