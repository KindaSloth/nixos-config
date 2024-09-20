{ config, pkgs, ... }:

{
  home.username = "kindasilly";
  home.homeDirectory = "/home/kindasilly";

  home.packages = with pkgs; [
    # personal usage
    discord

    # command line tools
    neofetch
    nnn

    # archives
    zip
    xz
    unzip
    p7zip

    # utils
    ripgrep
    jq
    eza
    fzf
    obs-studio
    libreoffice
    blender

    # networking tools
    mtr
    iperf3
    dnsutils
    ldns
    aria2
    socat
    nmap
    ipcalc

    # misc
    cowsay
    file
    which
    tree
    gnused
    gnutar
    zstd
    gnupg

    # nix
    nix-output-monitor

    # productivity
    glow
    btop
    iotop
    iftop

    # development
    insomnia
    docker
    docker-compose
    beekeeper-studio

    # system call monitoring
    strace
    ltrace
    lsof

    # system tools
    sysstat
    lm_sensors
    pciutils
    usbutils
    gparted
  ];

  programs.git = {
    enable = true;
    userName = "KindaSloth";
    userEmail = "guilhermereis28122002@gmail.com";
  };

  programs.alacritty = {
    enable = true;
    # custom settings
    settings = {
      env.TERM = "xterm-256color";
      font = {
        size = 12;
        draw_bold_text_with_bright_colors = true;
      };
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
    };
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -l";
      update = "sudo nixos-rebuild switch";
    };
    history.size = 10000;
    history.path = "${config.xdg.dataHome}/zsh/history";
  
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "z" ];
      theme = "robbyrussell";
    };
  };

  programs.vscode = {
    enable = true;
  };

  home.stateVersion = "23.11";

  programs.home-manager.enable = true;
}
