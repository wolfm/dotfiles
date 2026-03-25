# wolfm's dotfiles

> [!NOTE]
> This repo is managed by [chezmoi](https://github.com/twpayne/chezmoi).

## Installation

0. *(macOS only)* Install [Homebrew](https://brew.sh)
1. [Install chezmoi](https://www.chezmoi.io/install/) for your system
2. Apply dotfiles:
   - **Fresh machine (no existing dotfiles):** `chezmoi init --apply wolfm`
   - **Existing dotfiles you want to keep:**
     1. `chezmoi init wolfm`
     2. `chezmoi diff` to review what would change
     3. `chezmoi apply` to apply all changes, or `chezmoi merge <file>` to interactively merge specific files

## Platforms

- macOS (primary)
- Linux
- WSL

## Features

- **Shell**: Bash & Zsh with shared aliases, functions, and platform-specific configs
- **Git**: Aliases, custom log view, global gitignore
- **Neovim**: LSP, completion, Telescope, Treesitter, git integration, nvim-tree, Nord theme
- **Tmux**: Mouse support, Nord theme, tpm plugins, directory-aware pane splitting
- **Programming Language Support**: Lazy-loaded pyenv, nvm, and cargo environments
- **Package management**: Declarative package list in YAML, auto-installed via detected package manager

## Concepts

### RC File Sourcing Order

Shell rc (`~/.zshrc` or `~/.bashrc`) → `~/.commonrc` → `~/.commonrc.local`

Shell-agnostic aliases, functions, and environment setup live in `.commonrc`. Machine-specific overrides go in `.commonrc.local` (not tracked by chezmoi).
