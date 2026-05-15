# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Repository Is

This is a [homeshick](https://github.com/andsens/homeshick) **castle** — a dotfiles management repository. Files under `home/` are symlinked into `~` when homeshick links the castle.

```
home/.zshrc        → ~/.zshrc
home/.gitconfig    → ~/.gitconfig
home/.Brewfile     → ~/.Brewfile
home/.config/...   → ~/.config/...
```

## homeshick Workflow

```bash
# Apply changes after editing files in this repo
homeshick link my_castle

# Pull updates from remote on another machine
homeshick pull my_castle

# Navigate to the castle directory
homeshick cd my_castle
```

There are no build, test, or lint commands — this is a configuration-only repository.

## Managed Files

| File | Purpose |
|---|---|
| `home/.zshrc` | zsh config: keybindings (emacs), aliases, PATH, Go/Java/Volta/mise setup, ghq+fzf repo switcher (`^g`) |
| `home/.gitconfig` | Git user info, aliases, LFS, mergepbx for Xcode `.pbxproj` merging |
| `home/.Brewfile` | Homebrew formulae and VS Code extensions to install via `brew bundle` |
| `home/.config/gh/config.yml` | GitHub CLI settings (ssh protocol, `co` alias for `pr checkout`) |
| `home/.config/mise/config.toml` | Runtime versions: Node.js latest, Ruby 3.2.2, Gemini CLI |

## Key Conventions

- **Apple Silicon paths**: Use `/opt/homebrew/bin` (not `/usr/local/bin`) for Homebrew binaries.
- **mise for runtimes**: Node, Ruby, and npm-global tools are managed via mise — add new runtimes to `home/.config/mise/config.toml`.
- **Brewfile for packages**: New CLI tools go in `home/.Brewfile` as `brew "..."` entries; VS Code extensions as `vscode "..."`.
- **No secrets**: If the GitHub CLI ever stores an OAuth token in `~/.config/gh/hosts.yml`, do not commit it. The current file in this repo contains only the username.
