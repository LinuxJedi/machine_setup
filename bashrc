alias ls='ls -G'
alias grep='grep --color=auto -n'
unamestr=`uname`
if [[ "$unamestr" == 'Darwin' ]]; then
    alias vim='/usr/local/bin/mvim'
    alias git=/usr/local/git/bin/git
fi

set_prompt () {
    local last_command=$?  # Must come first!
    PS1=""
    # Add a bright white exit status for the last command
    PS1+='\[\e[01;37m\]$? '
    # If it was successful, print a green check mark. Otherwise, print
    # a red X.
    if [[ $last_command == 0 ]]; then
        PS1+='\[\e[01;32m\]\342\234\223 '
    else
        PS1+='\[\e[01;31m\]\342\234\227 '
    fi
    # If root, just print the host in red. Otherwise, print the current user
    # and host in green.
    # in 
    if [[ $EUID == 0 ]]; then
        PS1+='\[\e[01;31m\]\h '
    else
        PS1+='\[\e[01;32m\]\u@\h '
    fi
    # Print the working directory and prompt marker in blue, and reset
    # the text color to the default.
    PS1+='\[\e[01;34m\] \w \$\[\e[00m\] '
}
PROMPT_COMMAND='set_prompt'

export PATH=$PATH:/Applications/microchip/xc8/v1.33/bin
