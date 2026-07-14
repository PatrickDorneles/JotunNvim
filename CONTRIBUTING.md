# Contributing to Jotun Nvim

Thank you for considering contributing to Jotun Nvim! To keep the configuration clean and maintainable, please follow these guidelines.

## 🛠 Development Workflow

1. **Understand the Structure**: Review `AGENTS.md` for a map of the codebase.
2. **Modular Changes**: 
   - Add plugins to the corresponding file in `lua/jotun/plugins/`.
   - Add keymaps to the relevant category in `lua/jotun/keymaps/`.
   - Use `lua/utils/` for shared helper functions.
3. **Consistency**: 
   - Use 2-space indentation.
   - Maintain the `kickstart.nvim` pattern of using `lazy.nvim` for all plugins.
   - Use `opts = {}` for simple plugin configs; use `config = function() ... end` only when complex logic is required.

## ⌨️ Keymap Guidelines

When adding new keymaps:
- **Description**: Always provide a `desc` field in the options table. This is critical for `which-key` to function properly.
- **Conflict Check**: Ensure your keymap doesn't override a critical built-in or existing custom mapping. Check `lua/jotun/keymaps/prohibitions.lua` for disabled defaults.

## 🔌 Plugin Guidelines

- **Dependencies**: If a plugin requires a system-level dependency (e.g., `ripgrep`), document it in `README.md`.
- **Conditional Loading**: Use `require('utils.check-file')` to conditionally load plugins based on the presence of project-specific config files (e.g., loading Biome only if `biome.jsonc` exists).

## 🧪 Verification

After making changes:
1. Restart Neovim to ensure plugins load correctly.
2. Check `:Lazy` for any installation errors.
3. Verify keymaps using `<leader>+h` (or the `which-key` menu).
