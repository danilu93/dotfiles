# ============================

#  Habilitar colores en Zsh
autoload -U colors && colors
setopt prompt_subst
export COLORTERM=truecolor

#  Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# ============================
# Sakura Syntax Highlighting
# ============================

# Ajustes de colores Sakura
ZSH_HIGHLIGHT_STYLES[default]='fg=#f8f8f2'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=#ff66cc'       # if, then, else
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#cba6f7'            # cd, echo, etc.
ZSH_HIGHLIGHT_STYLES[alias]='fg=#99ffff'              # alias
ZSH_HIGHLIGHT_STYLES[function]='fg=#ffc0cb'           # funciones
ZSH_HIGHLIGHT_STYLES[command]='fg=#ff66cc'            # comandos Git y otros
ZSH_HIGHLIGHT_STYLES[valid-command]='fg=#ffb3d9'
ZSH_HIGHLIGHT_STYLES[invalid-command]='fg=#ff3366'
ZSH_HIGHLIGHT_STYLES[path]='fg=#cba6f7'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=#ff4d6d'
ZSH_HIGHLIGHT_STYLES[comment]='fg=#a1a1aa'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#ff3366'
ZSH_HIGHLIGHT_STYLES[export]='fg=#ff99ff'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=#f4a7ff'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#f7c6ff'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#ffc0cb'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=#ff99cc'
ZSH_HIGHLIGHT_STYLES[assignment]='fg=#f9a7ff'
ZSH_HIGHLIGHT_STYLES[reduction]='fg=#ff66b2'
ZSH_HIGHLIGHT_STYLES[process-substitution]='fg=#ff99ff'
ZSH_HIGHLIGHT_STYLES[job]='fg=#cc99ff'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=#ffb7dc'

#  Aliases personalizados
alias ls='ls --color=auto'
alias ll='ls -lh --color=auto'
alias la='ls -lha'
alias gs='git status'
alias gp='git push'
alias flower='echo 🌸🌸🌸'
alias boom='echo 💥💥💥'

#  Cargar Powerlevel10k Sakura Cute
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

#  Cargar zsh-syntax-highlighting AL FINAL
# (para que resalte los comandos correctamente)
if [[ -f ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
    source ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi


# ============================
# Fondo charcoal para toda la terminal#2e2e2e
# ============================
print -Pn "\e]11;#2E2E2E\a"  # gris suave

#  Variables de terminal
export TERM=xterm-256color

