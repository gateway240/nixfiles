# Nix Home-Manger Config

## Install
1. Install [nix](https://nixos.org/download.html)
2. Install [home-manager](https://nixos.org/download.html#nix-install-macos)
3. clone to ~ directory and create symlink
```bash
cd ~/.config
ln -s ~/nixfiles nixpkgs
```

> Make sure to add any secrets or configs to `.zshenv` or `.bashenv`
based on [this](https://ghedam.at/24353/tutorial-getting-started-with-home-manager-for-nix) tutorial
