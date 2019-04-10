function ghq-fzf() {
  local target_dir=$(ghq list -p | fzf --query="$LBUFFER")

  if [ -n "$target_dir" ]; then
    BUFFER="cd ${target_dir}"
    zle accept-line
  fi

  zle reset-prompt
}

zle -N ghq-fzf
bindkey "^g" ghq-fzf
