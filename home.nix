{ config, pkgs, ... }:
{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "abeattie";
  home.homeDirectory = "/Users/abeattie";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  
  # Session
  home.sessionVariables = {
    EDITOR = "nvim";
    TERMINAL = "kitty";
  };

  # Packages
  home.packages = with pkgs; [
    biber # for latex
    buildkit #fancy docker
    docker 
    docker-compose
    kubectl
    nodejs
    git
    python3
    wget
    vscodium
    yarn
  ];
  # Kitty terminal

  # Keyboard
  home.keyboard.options = [ "caps:swapescape" ];

  # Git
  programs.git = {
    enable = true;
    userName = "alexbeattie42";
    userEmail = "alexander.beattie@quarkworks.co";
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
    };
  };

  # Vim 
  programs.neovim = {
    enable = true;
    # Sets alias vim=nvim
    vimAlias = true;

    extraConfig = ''
      :imap jk <Esc>
      :set number
      syntax on
      set backspace=indent,eol,start
      filetype plugin indent on
    '';

    # Neovim plugins
    plugins = with pkgs.vimPlugins; [
      vim-nix
    ];
  };

  # Latex
  programs.texlive.enable = true;
  programs.texlive.extraPackages = tpkgs: {
    inherit (tpkgs)
      scheme-medium
      float
      enumitem
      was
      csquotes
      multirow
      booktabs
      pgfplots
      caption
      titlesec
      etoolbox
      tocloft
      parskip
      nowidow
      url
      biblatex
      biblatex-bath
      lastpage
      xassoccnt
      setspace
      xpatch
      xstring
      latexmk;
  };
}
