# ゆめヴィム (yumevim)

A modular, extensible, and maintainable Neovim configuration system written in
pure Lua. yumevim-lua is designed for users who want a customizable and
portable Neovim setup, leveraging Lua for plugin management, language tooling,
and editor settings—no Nix required.

---

## ✨ Features
- **Pure Lua-based**: No Nix or external system dependencies required.
- **Highly Modular**: Organized by feature (UI, navigation, language support,
  utilities, etc.) for easy customization.
- **Plugin Management**: Uses [lazy.nvim](https://github.com/folke/lazy.nvim)
  or compatible Lua plugin managers.
- **Language Support**: Built-in LSP, DAP, Treesitter, snippets, and formatting
  for many languages.
- **Rich UI & Navigation**: Modern statusline, notifications, dashboard,
  Telescope, Harpoon, file tree, and more.
- **Easy Customization**: Edit Lua modules directly for your preferences.

---

## 🚀 Installation

1. **Clone the repository:**
   ```sh
   git clone https://github.com/c4patino/yumevim-lua.git ~/.config/nvim
   ```

2. **Start Neovim:**
   Open Neovim. On first launch, plugins will be installed automatically (if using lazy.nvim). If you use another plugin manager, run its sync/install command (e.g., `:PackerSync`).

---

## 🗂️ Project Structure

```
lua/               - Main configuration modules (all Lua)
  languages/       - Language support (LSP, DAP, snippets, treesitter, etc.)
  navigation/      - Navigation plugins (telescope, nvim-tree, harpoon)
  ui/              - UI plugins (lualine, alpha, notify, etc.)
  utils/           - Utility plugins (lazygit, todo-comments, etc.)
  autocmds.lua     - Neovim autocommands
  mappings.lua     - Key mappings
  options.lua      - Editor options
  plugins.lua      - Plugin definitions
init.lua           - Entry point
```

---

## 🛠️ Development & Contribution

### Customization
- Edit or extend modules in `lua/` to add plugins, languages, or settings.
- Each feature (LSP, UI, navigation, etc.) is organized in its own Lua module
  for clarity and maintainability.

### Contributing
- PRs and issues are welcome! Please keep code modular and well-documented.

---

## 👤 Authors
- [@c4patino](https://github.com/c4patino)

---

## 📄 License
This project is licensed under the GNU Affero General Public License v3.0
(AGPL-3.0). See the [LICENSE](./LICENSE) file for details.
