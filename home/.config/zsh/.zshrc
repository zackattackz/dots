ZSH_THEME="robbyrussell"
plugins=( 
    # other plugins...
    zsh-autosuggestions
)
source ~/.config/oh-my-zsh/oh-my-zsh.sh
source <(go env)
export PATH=$PATH:$GOPATH/bin

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
# Not supported in the "fish" shell.
(cat ~/.cache/wal/sequences &)

# To add support for TTYs this line can be optionally added.
source ~/.cache/wal/colors-tty.sh
