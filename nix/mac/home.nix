{ userSettings, pkgs, ... }: {
  home = {
    stateVersion = userSettings.stateVersion;
    username = userSettings.username;
    homeDirectory = "/Users/" + userSettings.username;
    packages = with pkgs; [ ];
  };
  imports = [
    ../programs/starship/starship.nix
  ];

  programs = {
    # let home manager manage home manager 
    home-manager.enable = true;

    bash = {
      enable = true;
      shellAliases = {
        ls = "eza";
        la = "eza -la --group-directories-first --git";
        ll = "eza -l --group-directories-first --git";
        lt = "eza -l --tree --git";
        lta = "eza -la --tree --git-ignore --git";
      };
    };
  };
}
