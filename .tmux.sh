#create a new session using pwd
#or switch to session if exists
function nsesh {
    tmux has-session -t $( pwd | xargs basename )
    if [ $? != 0 ];
    then
        tmux new -s $( pwd | xargs basename ) -d
    fi
    if [ "$TERM_PROGRAM" = tmux ]; then
        tmux switch -t $( pwd | xargs basename )
    else
        tmux attach -t $( pwd | xargs basename )
    fi
}

#switch to or attach to another session using fzf
function  sesh {
    if [ "$TERM_PROGRAM" = tmux ]; then
        tmux switch -t $( tmux ls -F\#S | fzf )
    else
        tmux attach -t $( tmux ls -F\#S | fzf )
    fi
}

#kill all session or particular sesssion using fzf
function dsesh {
    if [ "$1" = all ]; then
        tmux kill-server
    else
        tmux kill-session -t $( tmux ls -F\#S | fzf )
    fi
}
