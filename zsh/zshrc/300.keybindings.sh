# Alt-style bindings for terminals that send Option as Meta (e.g. Ghostty).
# Must load after oh-my-zsh, whose lib/key-bindings.zsh maps \el to "ls".
bindkey '\el' forward-word   # Ghostty Option+l
bindkey '\e;' end-of-line    # Ghostty Option+;
