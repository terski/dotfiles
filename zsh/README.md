# ZSH Setup

1. Update macOS to the latest version through system preferences
2. [Generate a new public and private SSH key](https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) by running:

   ```zsh
   curl https://raw.githubusercontent.com/driesvints/dotfiles/HEAD/ssh.sh | sh -s "<your-email-address>"
   ```

3. Clone this repo to `~/.dotfiles` with:

    ```zsh
    git clone git@github.com:terski/dotfiles.git ~/.dotfiles
    ```

4. Run the installation with:

    ```zsh
    ~/.dotfiles/fresh.sh
    ```

Commands under `.dotfiles/zsh/zprofile` are sourced on login.

Commands under `.dotfiles/zsh/zshrc` are sourced when interactive.

A nice [article series](https://scriptingosx.com/2019/06/moving-to-zsh/) on moving to zsh.

Details on setting up zsh can be found [here](https://unix.stackexchange.com/questions/71253/what-should-shouldnt-go-in-zshenv-zshrc-zlogin-zprofile-zlogout).
