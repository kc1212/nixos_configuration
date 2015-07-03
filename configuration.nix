# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix # auto generated
    ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "/dev/sda";

  networking.hostName = "nixie"; # Define your hostname.
  networking.hostId = "625a80f7";
  # networking.wireless.enable = true;  # Enables wireless.

  # Select internationalisation properties.
  i18n = {
    consoleFont = "lat9w-16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    # tools
    gcc
    gdb
    autoconf
    automake
    gnumake
    cmake
    git
    binutils
    ctags
    cscope
    bc
    file
    wget
    curl
    man
    silver-searcher
    rsync
    xsel
    xclip
    gnupg
    cryptsetup
    cifs_utils
    keepass
    pass
    truecrypt # should be 7.1a
    duplicity

    # libs
    libsodium
    zlib
    ncurses

    # editors
    vim
    neovim
    emacs

    # terminals
    tmux
    xterm
    rxvt_unicode

    # browsers
    firefox
    chromium

    # haskell stuff
    haskellPackages.ghc
    haskellPackages.cabalInstall
    haskellPackages.hlint
  ];

  fonts = {
    enableFontDir = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [
      corefonts  # Micrsoft free fonts
      inconsolata  # monospaced
      ubuntu_font_family  # Ubuntu fonts
      dejavu_fonts
    ];
  };

  services.openssh.enable = true;

  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome3.enable = true;
  };

  # hardware-configuration.nix should generate the following line
  # services.virtualboxGuest.enable = true;

}


