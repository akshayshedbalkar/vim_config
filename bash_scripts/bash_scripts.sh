#! /bin/bash
# Author: Shedbalkar, Akshay (GH2)

# To use functions in this file, source this file like so: . ./bash_scripts
# Then the functions in this file can be used by their names

# To always have these functions available, source this file in your ~/.bashrc. That is, 
# include the line: . <path to this file>/bash_scripts in your ~/.bashrc

####################################
## Utility
####################################

# Print path in human readable manner
path() {
    echo "${PATH//:/$'\n'}"
}

# Find a file in current folder
# First argument: filename to search
f() {
    find . -maxdepth 1 -type f -name "$1" 
}

# Find a file recursively in current folder
# First argument: filename to search
ff() {
    find . -type f -name "$1" 
}

# Cyclomatic complexity 
# Install required tool with: pip install lizard
ccn() {
    lizard -m -x "*test*" application >ccn.txt
    lizard -H -m -x "*test*" application >ccn.html
}

# Install ESR license
# First argument: first name
# Second argument: last name
# Third argument: password
# Fourth argument [optional]: input path where p12 certificate is stored (default: current directory)
install_esr_license() {
    openssl pkcs12 -in $${4:-.}/ext.$1.$2.p12 -clcerts -nokeys -out $HOME/.git/ext.$1.$2.crt -passin pass:$3
    openssl pkcs12 -in $${4:-.}/ext.$1.$2.p12 -cacerts -nokeys -out $HOME/.git/ext.$1.$2.ca -passin pass:$3
    openssl pkcs12 -in $${4:-.}/ext.$1.$2.p12 -nocerts -nodes -out $HOME/.git/ext.$1.$2.key -passin pass:$3
}

# Fix includes with include-what-you-use tool
# First argument [optional] : Input file, which is dumped by the IWYU tool (default: includes.txt)
fix_iwyu() {
    iwyu-fix-includes --comments --update_comments --nosafe_headers --reorder <${1:-includes.txt}
}

####################################
## Git
####################################

# Checkout branch based on incomplete pattern
# First argument: incomplete branch name (eg: ticket number)
co() {
    CLEAN=1
    git diff --exit-code --quiet || CLEAN=0
    git diff --cached --exit-code --quiet || CLEAN=0
    if [ $CLEAN -ne 1 ]
    then
        echo "Working directory is not clean. See 'git status'. Clean working directory and try again."
        return 0
    fi

    branch_list=$(git branch -a | grep $1 | sed s_remotes\/${2:-origin}\/__ | sed s_\*_\ _ | grep -v HEAD | sort -u)
    git switch $branch_list 2>/dev/null

    if [ $? -ne 0 ]
    then
        n=$(printf "$branch_list" | wc -l)
        if [ $n -eq 0 ]
        then
            echo "No branch found. Perhaps try git pull --all."
            return 0
        else
            echo "$branch_list" |awk '{print NR  ":" $0}' 
            read -p "Enter selection 1-n: " choice
            selection=$(echo "$branch_list" | awk -v var="$choice" 'NR==var')
            git switch $selection
        fi
    fi
}

# Create local copies of all branches
checkout_all_branches() {
    git branch -r | sed "s_origin/__" > _remotes
    git branch -l > _local
    grep -Fxvf _local _remotes | while read name; do git switch $name; done
    rm _local
    rm _remotes
}

# Create remote copy of current branch
# First argument [optional]: Remote name (default: origin)
gpu() {
    git branch --show-current|xargs git push -u ${2:-origin}
}

# Show log of commits for this branch (works only if ticket number is part of branch name)
logb() {
    ticket_number=$(git branch --show-current | grep -o "[0-9]*")
    git log --all --grep=$ticket_number --pretty=format:'%C(red)%h%Creset %C(auto)%d%Creset %s %C(green)(%ar) %C(bold blue)<%an>%Creset'
}

# Delete local and remote copies of specified branch
# First argument: Branch name
# Second argument [optional]: Remote name (default: origin)
delete_branch() {
    git branch -d $1
    git push ${2:-origin} --delete $1
}

# Delete local and remote copies of specified tag
# First argument: Tag name
# Second argument [optional]: Remote name (default: origin)
delete_tag() {
    git tag -d $1
    git push ${2:-origin} --delete $1
}

# Delete submodule cleanly
# First argument: submodule name
delete_submodule() {
    git submodule deinit -f -- $1
    rm -rf .git/modules/$1
    git rm -rf $1
    echo "...Done!"
}

# Rename local and remote branch
# first argument = old_name
# second argument = new_name
# third argument [optional] = remote name
rename_branch() {
    git branch -m $1 $2
    git push ${3:-origin} --delete $1
    git push ${3:-origin} -u  $2
}

# Rename all local and remote branches beginning with pattern
# First argument:  source pattern (eg: bugfix, feature etc)
# Second argument: destination pattern (eg: bugfix, feature etc.)
rename_all_branches() {
    for branch in $(git for-each-ref --format='%(refname:lstrip=3)' refs/heads/$1/); do
        git branch -m $1/$branch $2/$branch
        git push origin --delete $1/$branch
        git push origin -u  $2/$branch
    done
}
