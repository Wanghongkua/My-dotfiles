
# set -g default-terminal "screen-256color"
set -g default-terminal "xterm-256color"

# force tmux to use utf-8
setw -gq utf8 on

######################
######################
set -ga terminal-overrides ',*:Ss=\E[%p1%d q:Se=\E[2 q'
######################
set -g history-limit 20000

# automatically renumber tmux windows
set -g renumber-windows on

# unbind default prefix and set it to Ctrl+a
unbind C-b
set -g prefix C-a
bind C-a send-prefix

# for nested tmux sessions
bind-key a send-prefix

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

# quickly open a new window
bind N new-window

# split window and fix path for tmux 1.9
bind | split-window -h -c "#{pane_current_path}"
bind - split-window -v -c "#{pane_current_path}"

# synchronize all panes in a window
bind y setw synchronize-panes

# Smart pane switching with awareness of Vim splits.
# See: https://github.com/christoomey/vim-tmux-navigator
is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
    | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"
bind-key -n C-h if-shell "$is_vim" "send-keys C-h"  "select-pane -L"
bind-key -n C-j if-shell "$is_vim" "send-keys C-j"  "select-pane -D"
bind-key -n C-k if-shell "$is_vim" "send-keys C-k"  "select-pane -U"
bind-key -n C-l if-shell "$is_vim" "send-keys C-l"  "select-pane -R"
bind-key -n C-\ if-shell "$is_vim" "send-keys C-\\" "select-pane -l"

# Select pane in copy mode
bind-key -T copy-mode-vi C-h select-pane -L
bind-key -T copy-mode-vi C-j select-pane -D
bind-key -T copy-mode-vi C-k select-pane -U
bind-key -T copy-mode-vi C-l select-pane -R
bind-key -T copy-mode-vi C-\ select-pane -l

bind -r C-h select-window -t :-
bind -r C-l select-window -t :+

# bind -r C-h select-window -t :-
# bind -r C-l select-window -t :+

# Resize pane shortcuts
bind -r H resize-pane -L 10
bind -r J resize-pane -D 10
bind -r K resize-pane -U 10
bind -r L resize-pane -R 10

# enable mouse support for switching panes/windows
setw -g mouse on

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
bind -Tcopy-mode-vi 'v' send -X begin-selection
bind -Tcopy-mode-vi 'y' send -X copy-pipe-and-cancel "tmux save-buffer - | reattach-to-user-namespace pbcopy"

# Buffers to/from Mac clipboard, yay tmux book from pragprog
bind C-c run "tmux save-buffer - | reattach-to-user-namespace pbcopy"
bind C-v run "tmux set-buffer $(reattach-to-user-namespace pbpaste); tmux paste-buffer"
##############################


##############################
### Color & Style Settings ###
##############################
source ~/Documents/dotfile/theme.sh
