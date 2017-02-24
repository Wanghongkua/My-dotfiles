#
# unbind default prefix and set it to Ctrl+a 
unbind C-b
set -g prefix C-a
bind C-a send-prefix

# for nested tmux sessions
bind-key a send-prefix

#set -g default-terminal "screen-256color"
set -g default-terminal "tmux-256color"
set -as terminal-overrides ',xterm*:sitm=\E[3m'
##############################
# set -g default-command "login-shell"
# tmux display things in 256 colors
#set -g default-terminal "tmux-256color-italic"

set -g history-limit 20000

# automatically renumber tmux windows
set -g renumber-windows on

# Activity Monitoring
setw -g monitor-activity off
set -g visual-activity off

# Rather than constraining window size to the maximum size of any client
# connected to the *session*, constrain window size to the maximum size of any
# client connected to *that window*. Much more reasonable.
setw -g aggressive-resize on

# make delay shorter
set -sg escape-time 0

# tile all windows
unbind =
bind = select-layout tiled

# cycle through panes
# unbind C-a
# unbind o # this is the default key for cycling panes
# bind ^A select-pane -t:.+

# make window/pane index start with 1
set -g base-index 1
setw -g pane-base-index 1

set-option -g set-titles on
set-option -g set-titles-string "#T - #W"
# set-window-option -g automatic-rename on

######################
#### Key Bindings ####
######################

# reload config file
bind r source-file ~/.tmux.conf \; display "Config Reloaded!"
# bind D source-file ~/.tmux/dev \; display "New Session"

# quickly open a new window
bind N new-window

# split window and fix path for tmux 1.9
bind | split-window -h -c "#{pane_current_path}"
bind - split-window -v -c "#{pane_current_path}"

# synchronize all panes in a window
bind y setw synchronize-panes

# pane movement shortcuts
# setw -g mode-keys vi
# bind h select-pane -L
# bind j select-pane -D
# bind k select-pane -U
# bind l select-pane -R
# Smart pane switching with awareness of Vim splits.
# See: https://github.com/christoomey/vim-tmux-navigator
is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
    | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"
bind-key -n C-h if-shell "$is_vim" "send-keys C-h"  "select-pane -L"
bind-key -n C-j if-shell "$is_vim" "send-keys C-j"  "select-pane -D"
bind-key -n C-k if-shell "$is_vim" "send-keys C-k"  "select-pane -U"
bind-key -n C-l if-shell "$is_vim" "send-keys C-l"  "select-pane -R"
bind-key -n C-\ if-shell "$is_vim" "send-keys C-\\" "select-pane -l"
bind -r C-h select-window -t :-
bind -r C-l select-window -t :+

# Resize pane shortcuts
bind -r H resize-pane -L 10
bind -r J resize-pane -D 10
bind -r K resize-pane -U 10
bind -r L resize-pane -R 10

# enable mouse support for switching panes/windows
setw -g mouse on
# setw -g mode-mouse on
# set-option -g -q mouse on
# set -g mouse-mode on

bind-key -T root PPage if-shell -F "#{alternate_on}" "send-keys PPage" "copy-mode -e; send-keys PPage"
bind-key -t vi-copy PPage page-up
bind-key -t vi-copy NPage page-down

bind -T root WheelUpPane if-shell -F -t = "#{alternate_on}" "select-pane -t =; send-keys -M" "select-pane -t =; copy-mode -e; send-keys -M"
bind -T root WheelDownPane if-shell -F -t = "#{alternate_on}" "select-pane -t =; send-keys -M" "select-pane -t =; send-keys -M"
bind-key -t vi-copy WheelUpPane halfpage-up
bind-key -t vi-copy WheelDownPane halfpage-down

# maximizing and restoring windows
unbind Up
bind Up new-window -d -n fullscreen \; swap-pane -s fullscreen.1 \; select-window -t fullscreen
unbind Down
bind Down last-window \; swap-pane -s fullscreen.1 \; kill-window -t fullscreen

# set vi mode for copy mode
setw -g mode-keys vi
# more settings to make copy-mode more vim-like
unbind [
bind Escape copy-mode
unbind p
bind p paste-buffer
bind -t vi-copy 'v' begin-selection
#bind -t vi-copy 'y' copy-selection
bind -t vi-copy 'y' copy-pipe "reattach-to-user-namespace pbcopy"

# Buffers to/from Mac clipboard, yay tmux book from pragprog
bind ] run "reattach-to-user-namespace pbpaste | tmux load-buffer - && tmux paste-buffer"
#bind C-c run "tmux save-buffer - | reattach-to-user-namespace pbcopy"
#bind C-v run "tmux set-buffer $(reattach-to-user-namespace pbpaste); tmux paste-buffer"

##############################
### Color & Style Settings ###
##############################

tm_icon="🙊"
tm_color_active=colour51
tm_color_inactive=colour241
tm_color_feature=colour198
tm_color_music=colour41
tm_active_border_color=colour51

# separators
tm_separator_left_bold="◀"
tm_separator_left_thin="❮"
tm_separator_right_bold="▶"
tm_separator_right_thin="❯"

set -g status-left-length 32
set -g status-right-length 150
set -g status-interval 5


# default statusbar colors
# set-option -g status-bg colour0
set-option -g status-fg $tm_color_active
set-option -g status-bg default
set-option -g status-attr default

# default window title colors
set-window-option -g window-status-fg $tm_color_inactive
set-window-option -g window-status-bg default
set -g window-status-format "#I #W"

# active window title colors
set-window-option -g window-status-current-fg $tm_color_active
set-window-option -g window-status-current-bg default
set-window-option -g  window-status-current-format "#[bold]#I #W"

# pane border
set-option -g pane-border-fg $tm_color_inactive
set-option -g pane-active-border-fg $tm_active_border_color

# message text
set-option -g message-bg default
set-option -g message-fg $tm_color_active

# pane number display
set-option -g display-panes-active-colour $tm_color_active
set-option -g display-panes-colour $tm_color_inactive

# clock
set-window-option -g clock-mode-colour $tm_color_active

tm_tunes="#[fg=$tm_color_music]#(osascript ~/.dotfiles/applescripts/tunes.scpt)"
tm_battery="#(~/.dotfiles/bin/battery_indicator.sh)"

tm_date="#[fg=$tm_color_inactive] %R %d %b"
tm_host="#[fg=$tm_color_feature,bold]#h"
tm_session_name="#[fg=$tm_color_feature,bold]$tm_icon #S"

set -g status-left $tm_session_name' '
set -g status-right $tm_tunes' '$tm_date' '$tm_host


##############################
# powerline
##############################
#!/bin/bash

tm_icon="♟"
tm_color_background=colour234
tm_color_active=colour118
tm_color_inactive=colour241
tm_color_feature=colour4
tm_color_music=colour203

# separators
tm_left_separator=''
tm_left_separator_black=''
tm_right_separator=''
tm_right_separator_black=''
tm_session_symbol=''

set -g status-left-length 32
set -g status-right-length 150
set -g status-interval 5


# default statusbar colors
# set-option -g status-bg colour0
set-option -g status-fg $tm_color_active
set-option -g status-bg default
set-option -g status-attr default

# default window title colors
set-window-option -g window-status-fg $tm_color_inactive
set-window-option -g window-status-bg default
set -g window-status-format "#I #W"

# active window title colors
set-window-option -g  window-status-current-format "#[fg=$tm_color_background,bg=$tm_color_active]$tm_left_separator_black #[fg=colour0,bg=$tm_color_active,bold]#I #W #[bg=$tm_color_background,fg=$tm_color_active]$tm_left_separator_black "

# pane border
set-option -g pane-border-fg $tm_color_inactive
set-option -g pane-active-border-fg $tm_color_active

# message text
set-option -g message-bg default
set-option -g message-fg $tm_color_active

# pane number display
set-option -g display-panes-active-colour $tm_color_active
set-option -g display-panes-colour $tm_color_inactive

tm_spotify="#[fg=$tm_color_background,bg=$tm_color_music]#(osascript ~/.dotfiles/applescripts/spotify.scpt)"
tm_itunes="#[fg=$tm_color_music,bg=$tm_color_background]$tm_right_separator_black#[fg=$tm_color_background,bg=$tm_color_music]#(osascript ~/.dotfiles/applescripts/itunes.scpt)"
tm_rdio="#[fg=$tm_color_background,bg=$tm_color_music]#(osascript ~/.dotfiles/applescripts/rdio.scpt)"
tm_battery="#[fg=colour255,bg=$tm_color_music]$tm_right_separator_black#[bg=colour255]#(~/.dotfiles/bin/battery_indicator.sh)"

tm_date="#[bg=colour255,fg=$tm_color_inactive]$tm_right_separator_black#[bg=$tm_color_inactive,fg=$tm_color_background] %R %d %b"
tm_host="#[bg=$tm_color_inactive,fg=$tm_color_feature]$tm_right_separator_black#[bg=$tm_color_feature,fg=$tm_color_background,bold] #h "
tm_session_name="#[bg=$tm_color_feature,fg=$tm_color_background,bold]$tm_icon #S #[fg=$tm_color_feature,bg=default,nobold]$tm_left_separator_black"

set -g status-left $tm_session_name
set -g status-right $tm_itunes' '$tm_rdio' '$tm_battery' '$tm_date' '$tm_host
