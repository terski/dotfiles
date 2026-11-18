# Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"

# Claude 
alias cc="claude"

# Homebrew
alias brewup='brew update; brew upgrade; brew cleanup; brew doctor'

# Dev shortcuts
alias c='code .'
alias g="git"
alias typora="open -a typora"

# Bun
alias br='bun run --watch'
alias bt='bun test --watch'

# Directory shortcuts
alias l='ls -lF -G'
alias la='ls -a -lF -G'
alias lr='ls -laht -G | head -n 20'

# Do NOT correct
alias kubectl="nocorrect kubectl"
