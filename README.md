# Nix Home-Manger Config

## Install
1. Install [nix](https://nixos.org/download.html)
2. Install [home-manager](https://nixos.org/download.html#nix-install-macos)
3. clone to ~ directory and create symlink
```bash
cd ~/.config
ln -s ~/nixfiles nixpkgs
```
## Remote Server Install Easy
```bash
sh <(curl -L https://nixos.org/nix/install)
sudo reboot

. ~/.nix-profile/etc/profile.d/nix.sh
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install

rm -rf ~/.config/nixpkgs
git clone https://github.com/alexbeattie42/nixfiles.git ~
cd ~/.config
ln -s ~/nixfiles nixpkgs
home-manager switch
```

> Make sure to add any secrets or configs to `.zshenv` or `.bashenv`

based on [this](https://ghedam.at/24353/tutorial-getting-started-with-home-manager-for-nix) tutorial
## Apply new changes
```bash
home-manager switch
```

