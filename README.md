# Summary
This project contains a .bashrc, .vimrc and vim plugins to get started with C / C++ programming. Sensible defaults are used.

# Usage
1. Clone the repository
    >git clone <url>
2. [Optional] If you cloned the repository from bitbucket, checkout the 'bitbucket' branch
    >git switch bitbucket
3. Execute the setup.sh script. 
    >cd vim_config
    >./setup.sh

    Note: the script will replace your existing `.bashrc`, `.vimrc`  and `.vim` folder and backups of your existing configurations will be stored in `$HOME/.vim_config_backup` if needed. 

4. Afterward, execute :PlugInstall from inside of vim to install all plugins.
    >vi
    >:PlugInstall

