# The following lines were added by compinstall (commented out because of zsh-autocomplete-plugin)

zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' matcher-list ''
zstyle :compinstall filename '/home/luke/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Lines configured by zsh-newuser-install
HISTFILE=/home/luke/.histfile # this line is paired with Dockerfile
HISTSIZE=1000
SAVEHIST=5000
setopt SHARE_HISTORY
setopt autocd beep nomatch
bindkey -e
# End of lines configured by zsh-newuser-install

PROMPT="[%2~] c %# "
RPROMPT="%n %t"
ZSH_THEME=”random”

PATH="~/.local/bin:$PATH"

neofetch
