alias ls='ls -G'
alias grep='grep --color=auto -n'
unamestr=`uname`
if [[ "$unamestr" == 'Darwin' ]]; then
    alias vim='/usr/local/bin/mvim'
    alias git='/usr/local/git/bin/git'
    alias grep='/usr/local/bin/ggrep --color=auto -n'
fi

set_prompt () {
    local last_command=$?  # Must come first!
    PS1=""
    # Add an exit status for the last command
    if [[ $last_command == 0 ]]; then
        PS1+='\[\e[01;32m\]$? '
    else
        PS1+='\[\e[01;33m\]$? '
    fi
    # If root, just print the host in red. Otherwise, print the current user
    # and host in cyan.
    # in
    if [[ $EUID == 0 ]]; then
        PS1+='\[\e[01;31m\]\u@\h '
    else
        PS1+='\[\e[01;36m\]\u@\h '
    fi
    # Print the working directory and prompt marker in purple, and reset
    # the text color to the default.
    PS1+='\[\e[01;35m\]\w '
    if [[ $EUID == 0 ]]; then
        PS1+='#'
    else
        PS1+='\$'
    fi
    PS1+='\[\e[00m\] '
    # Update Mac OS X terminal heading
    if [[ "`uname`" == 'Darwin' ]]; then
        update_terminal_cwd
    fi
}
PROMPT_COMMAND='set_prompt'
