# Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"

# Homebrew
alias brewup='brew update; brew upgrade; brew cleanup; brew doctor'

# Dev shortcuts
alias c='code .'
alias g="git"
alias typora="open -a typora"
alias yb='yarn build'
alias yd='yarn dev'
alias yl='yarn lint'
alias ys='yarn start'
alias ysd='yarn start:dev'
alias yt='yarn test'

# Bun
alias br='bun run --watch'
alias bt='bun test --watch'

# Directory shortcuts
alias l='ls -lF -G'
alias la='ls -a -lF -G'
alias lr='ls -laht -G | head -n 20'

# Do NOT correct
alias kubectl="nocorrect kubectl"
