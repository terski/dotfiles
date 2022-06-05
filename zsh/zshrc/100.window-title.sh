function precmd () {
    window_title="\\033]0;${PWD##*/}\\007"
    echo -ne "$window_title"
}

function preexec () {
    window_title="\\033]0;${1##*/}\\007"
    echo -ne "$window_title"
}
