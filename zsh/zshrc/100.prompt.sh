PROMPT='%F{green}%1~%f %F{silver}→%f '

# https://superuser.com/questions/645599/why-is-a-percent-sign-appearing-before-each-prompt-on-zsh-in-windows
# unsetopt PROMPT_SP
setopt PROMPT_CR
setopt PROMPT_SP
export PROMPT_EOL_MARK=''
