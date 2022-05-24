### If not running interactively, don't do anything
[[ $- != *i* ]] && return

### Git branch in prompt and autocompletion
source /usr/share/git/completion/git-prompt.sh
source /usr/share/git/completion/git-completion.bash
PS1='\n[\e[1;32m\u@\h\e[m \e[1;34m\W\e[m]\e[1;31m $(__git_ps1)\e[m \$ '

### Environment variables
## Common
export PATH=$PATH:$HOME/.local/share/gem/ruby/3.0.0/bin:$HOME/tools/scripts/bash:$HOME/.local/bin
export XDG_RUNTIME_DIR='/tmp/runtime-ashed'
export FZF_DEFAULT_COMMAND="rg --files -i"
export EDITOR="nvim"
export VISUAL="nvim"
## WSL2 specific
export host_ip=$(grep nameserver /etc/resolv.conf|awk '{print $2}')
export http_proxy="http://${host_ip}:3128"
export https_proxy="http://${host_ip}:3128"
export all_proxy="http://${host_ip}:3128"
export DISPLAY="${host_ip}:0"

### Aliases
##Common
alias ls='ls --color=auto'
alias l='ls -lhFB --color=none --group-directories-first'
alias ll='ls -alhFB --color=none --group-directories-first'
alias ..='cd ..'
alias log="git log --pretty=format:'%C(red)%h%Creset %C(auto)%d%Creset %s %C(green)(%ar) %C(bold blue)<%an>%Creset'"
alias logg="git logg --all --pretty=format:'%C(red)%h%Creset %C(auto)%d%Creset %s %C(green)(%ar) %C(bold blue)<%an>%Creset'"
alias tag="git tag --sort=creatordate|grep -v build"
alias vi='nvim'
alias vimdiff='nvim -d'
alias v='nvim ~/.config/nvim/init.vim'
alias b='nvim ~/.vim/.bashrc'
#Project specific
alias fpm2='cd ~/docs/fpm2_development'
alias int='cd ~/docs/Integration'
alias desktop='cd /mnt/c/Users/SW5VXVD/Desktop'

### Functions
## Common
path() {
    echo "${PATH//:/$'\n'}"
}

f() {
    find . -maxdepth 1 -type f -name "$1" 
}

ff() {
    find . -type f -name "$1" 
}

# Git
 co() {
     CLEAN=1
     git diff --exit-code --quiet || CLEAN=0
     git diff --cached --exit-code --quiet || CLEAN=0
     if [ $CLEAN -ne 1 ]
     then
         echo "Working directory is not clean. See 'git status'. Clean working directory and try again."
         return 0
     fi

     branch_list=$(git branch | grep $1)
     git switch $branch_list 2>/dev/null

     if [ $? -ne 0 ]
     then
         n=$(git branch | grep $1 |wc -l)
         if [ $n -eq 1 ]
         then
             echo "Already on desired branch"
             return 0
         elif [ $n -eq 0 ]
         then
             echo "No branch found"
             return 0
         else
             echo "$branch_list" |awk '{print NR  ":" $0}' 
             read -p "Enter selection 1-n: " choice
             selection=$(echo "$branch_list" | awk -v var="$choice" 'NR==var')
             git switch $selection
         fi
     fi
 }

gpu() {
    git branch --show-current|xargs git push -u origin 
}

delete_branch() {
    git branch -d $1
    git push origin --delete $1
}

checkout_all_branches() {
    git branch -r | sed "s_origin/__" > _remotes
    git branch -l > _local
    grep -Fxvf _local _remotes | while read name; do git checkout $name; done
    rm _local
    rm _remotes
}

delete_submodule() {
    echo "Step 1:\n"
    git submodule deinit -f -- $1
    echo "Step 2:\n"
    rm -rf .git/modules/$1
    echo "Step 3:\n"
    git rm -rf $1
    echo "...Done!"
}
