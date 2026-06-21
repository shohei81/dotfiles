{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    prefix = "C-a"; # ergonomic prefix (was C-b)
    baseIndex = 1;
    escapeTime = 0;
    historyLimit = 50000;
    keyMode = "vi";
    mouse = true;
    terminal = "tmux-256color";

    plugins = with pkgs.tmuxPlugins; [
      sensible
      resurrect
      {
        # auto-save sessions and restore them on start (works with auto-attach)
        plugin = continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-save-interval '5'
        '';
      }
    ];

    extraConfig = ''
      # vim-style pane navigation
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      # splits keep the current path
      bind | split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"

      # quick config reload
      bind r source-file ~/.config/tmux/tmux.conf \; display "tmux config reloaded"

      set -g renumber-windows on
      set -g focus-events on
    '';
  };
}
