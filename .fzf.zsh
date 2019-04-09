# Setup fzf
# ---------
if [[ ! "$PATH" == */home/meuserj/.fzf/bin* ]]; then
  export PATH="$PATH:/home/meuserj/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/meuserj/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/meuserj/.fzf/shell/key-bindings.zsh"

