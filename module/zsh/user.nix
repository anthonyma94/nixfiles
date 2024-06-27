{ lib, ... }:

{
	programs = {
    zsh = {
      enable = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      antidote = {
        enable = true;
        plugins = [
          "zsh-users/zsh-syntax-highlighting"
          "agkozak/zsh-z"
        ];
      };

      initExtra = "${builtins.readFile ./config.zsh}";
    };
    starship = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        format = lib.concatStrings [
          "[](#9A348E)"
          "$os"
          "$username"
          "[@](bg:#9A348E)"
          "$hostname"
          "[](bg:#DA627D fg:#9A348E)"
          "$directory"
          "[](fg:#DA627D bg:#FCA17D)"
          "$git_branch"
          "$git_status"
          "[](fg:#FCA17D bg:#86BBD8)"
          "$c"
          "$elixir"
          "$elm"
          "$golang"
          "$gradle"
          "$haskell"
          "$java"
          "$julia"
          "$nodejs"
          "$nim"
          "$rust"
          "$scala"
          "[](fg:#86BBD8 bg:#06969A)"
          "$docker_context"
          "[](fg:#06969A bg:#33658A)"
          "$time"
          "[ ](fg:#33658A)"
        ];
        # disable the blank line at the start of the prompt
        add_newline = false;

        # username module
        username = {
          show_always = true;
          style_user = "bg:#9a348e";
          style_root = "bg:#9a348e";
          format = "[$user]($style)";
          disabled = false;
        };

        hostname = {
          ssh_only = false;
          disabled = false;
          style = "bg:#9a348e";
          format = "[$hostname $ssh_symbol]($style)";
        };

        # os module
        os = {
          style = "bg:#9a348e";
          disabled = true; # disabled by default
        };

        # directory module
        directory = {
          style = "bg:#da627d";
          format = "[ $path ]($style)";
          truncation_length = 3;
          truncation_symbol = "…/";

          # substitutions for directory paths
          substitutions = {
            "documents" = "󰈙 ";
            "downloads" = " ";
            "music" = " ";
            "pictures" = " ";
            # keep in mind that the order matters.
            # "important documents" = " 󰈙 "; 
            # "important 󰈙 " = " 󰈙 ";
          };
        };

        # c module
        c = {
          symbol = " ";
          style = "bg:#86bbd8";
          format = "[ $symbol ($version) ]($style)";
        };

        # docker context module
        docker_context = {
          symbol = " ";
          style = "bg:#06969a";
          format = "[ $symbol $context ]($style) $path";
        };

        # elixir module
        elixir = {
          symbol = " ";
          style = "bg:#86bbd8";
          format = "[ $symbol ($version) ]($style)";
        };

        # elm module
        elm = {
          symbol = " ";
          style = "bg:#86bbd8";
          format = "[ $symbol ($version) ]($style)";
        };

        # git branch module
        git_branch = {
          symbol = "";
          style = "bg:#fca17d";
          format = "[ $symbol $branch ]($style)";
        };

        # git status module
        git_status = {
          style = "bg:#fca17d";
          format = "[$all_status$ahead_behind ]($style)";
        };

        # golang module
        golang = {
          symbol = " ";
          style = "bg:#86bbd8";
          format = "[ $symbol ($version) ]($style)";
        };

        # gradle module
        gradle = {
          style = "bg:#86bbd8";
          format = "[ $symbol ($version) ]($style)";
        };

        # haskell module
        haskell = {
          symbol = " ";
          style = "bg:#86bbd8";
          format = "[ $symbol ($version) ]($style)";
        };

        # java module
        java = {
          symbol = " ";
          style = "bg:#86bbd8";
          format = "[ $symbol ($version) ]($style)";
        };

        # julia module
        julia = {
          symbol = " ";
          style = "bg:#86bbd8";
          format = "[ $symbol ($version) ]($style)";
        };

        # node.js module
        nodejs = {
          symbol = "";
          style = "bg:#86bbd8";
          format = "[ $symbol ($version) ]($style)";
        };

        # nim module
        nim = {
          symbol = "󰆥 ";
          style = "bg:#86bbd8";
          format = "[ $symbol ($version) ]($style)";
        };

        # rust module
        rust = {
          symbol = "";
          style = "bg:#86bbd8";
          format = "[ $symbol ($version) ]($style)";
        };

        # scala module
        scala = {
          symbol = " ";
          style = "bg:#86bbd8";
          format = "[ $symbol ($version) ]($style)";
        };

        # time module
        time = {
          disabled = false;
          time_format = "%r"; # hour:minute format
          style = "bg:#33658a";
          format = "[ ♥ $time ]($style)";
        };
      };
    };
  };
}
