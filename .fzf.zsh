# Setup fzf
# ---------
if [[ ! "$PATH" == */home/pauliadmin/.fzf/bin* ]]; then
  export PATH="$PATH:/home/pauliadmin/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/pauliadmin/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
[ -f ~/.fzf/shell/key-bindings.zsh ] && source "~/.fzf/shell/key-bindings.zsh"
# AG works everywhere and is faster than FZF built-in, so we will default to
# that if it exists
if hash ag
then
  export FZF_DEFAULT_COMMAND='ag -S -l -g ""'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
fi
unameOut="$(uname -s)"
if [[ $unameOut = "Linux*" ]] || [[ $unameOut = "Darwin*" ]]
then
  if hash fd
  then
    export FZF_DEFAULT_COMMAND='fd --type file'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  elif hash rg
  then
    export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  fi
fi
