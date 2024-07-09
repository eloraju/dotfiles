{ pkgs, ... }: {
  programs.starship = {
    enable = true;
    # just use this for testing purposes
    enableBashIntegration = true;
    enableTransience = true;
    settings = {
      format = pkgs.lib.concatStrings [
        "$directory"
        "$git_branch"
        "$git_status"
        "$line_break"
        "$hostname"
        "$character"
      ];

      scan_timeout = 10;

      hostname = {
        ssh_only = true;
        format = "\([$hostname](green bold)\): ";
      };

      directory = {
        truncation_symbol = "../";
        truncation_length = 4;
      };

      git_branch = {
        format = "[$branch]($style)";
      };

      git_status = { };
    };
  };
}
