# Archived Dotfiles

This directory contains configuration files and directories that are no longer actively used but have been preserved for reference.

## Contents

### plugin-managers/

#### zplug/
- **Archived:** 2026-01-30
- **Reason:** Migrated to zinit plugin manager
- **Details:** The `.zshrc` configuration now exclusively uses zinit for plugin management. The zplug directory and its configurations are no longer loaded or referenced.

### nvm-configs/

#### nvm-standard.zsh
- **Original Path:** `.zsh/custom/nvm.zsh`
- **Archived:** 2026-01-30
- **Reason:** Duplicate NVM configuration conflicting with lazy-loading implementation
- **Details:** This file contained standard NVM initialization that loads immediately on shell startup. It conflicts with the optimized lazy-loading implementation in `.zsh/helper/nvm-lazy.zsh`, which significantly improves shell startup time (from ~2s to ~0.8s). The lazy-loading approach is preferred.

### peco/

#### config.json
- **Original Path:** `.fzf/config.json`
- **Archived:** 2026-01-30
- **Reason:** Using fzf instead of peco
- **Details:** This configuration file was intended for the peco fuzzy finder, but the dotfiles have standardized on fzf. All fuzzy finding functionality now uses fzf integration scripts.

#### install.sh
- **Original Path:** `.fzf/install.sh`
- **Archived:** 2026-01-30
- **Reason:** Unused installation script
- **Details:** This installation script is not referenced or used in the current setup process. FZF installation is handled through the main setup.sh script.

## Restoration

If you need to restore any of these files, you can copy them back to their original locations. However, be aware that:

1. **zplug:** You'll need to modify `.zshrc` to load zplug instead of zinit
2. **nvm-standard.zsh:** This will disable lazy-loading and increase shell startup time
3. **peco files:** You'll need to reconfigure your shell to use peco instead of fzf

## Notes

- All files were archived as part of a dotfiles cleanup and refactoring project
- The current dotfiles configuration uses: zinit, nvm (lazy-loaded), and fzf
- These archived files are kept for historical reference and potential future use
