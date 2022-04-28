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
    bitwarden-cli
    biber # for latex
    cmus # Music player
    doctl # DO CLI
    docker 
    docker-compose
    jq # Json manipulation
    kitty # terminal
    kubectl
    nodejs
    git
    python3
    wget
    vscodium
    yarn
  ];

  # Keyboard
  home.keyboard.options = [ "caps:swapescape" ];

  # Terminal

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
      " Appearance
      syntax on "highlight syntax
      set number "Side bar line numbers
      colorscheme nordfox "Nordfox colorscheme

      " Functionality
      set backspace=indent,eol,start "Logical backspaces
      filetype plugin indent on "Smart indents
      imap jk <Esc> "jk also works a esc
      set wrap linebreak nolist "soft-wrap but don't break in the middle of a word

      " Spell check
      setlocal spell spelllang=en_us "local region
      set spelllang=en_us "spell check
      set spellsuggest=best,9 "9 Best Choices
    '';

    # Neovim plugins
    plugins = with pkgs.vimPlugins; [
      nightfox-nvim # Color scheme
      vim-nix # Nix Editing
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
