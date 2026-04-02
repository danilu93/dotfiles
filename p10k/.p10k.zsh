# ==============================
# Prompt Powerlevel10k – Sakura Blooming
# ==============================

# --- Colores Sakura ---
SAKURA_LILAC='#cba6f7'
SAKURA_PINK='#ff66cc'
SAKURA_CYAN='#99ffff'
SAKURA_LIGHT_PINK='#ffc0cb'
SAKURA_TEXT='#f8f8f2'
SAKURA_ERROR='#ff3366'
SAKURA_WARNING='#ffb347'

# --- Elementos del prompt ---
typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(user dir vcs)
typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs time)

# --- Usuario ---
typeset -g POWERLEVEL9K_USER_FOREGROUND=$SAKURA_LILAC
typeset -g POWERLEVEL9K_USER_BACKGROUND='237'
typeset -g POWERLEVEL9K_USER_ICON='🌸'

# --- Directorio ---
typeset -g POWERLEVEL9K_DIR_FOREGROUND=$SAKURA_CYAN
typeset -g POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND=$SAKURA_LIGHT_PINK
typeset -g POWERLEVEL9K_DIR_ETC_FOREGROUND=$SAKURA_CYAN
typeset -g POWERLEVEL9K_DIR_ICON='📂'

# --- Prompt char kawaii ---
typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_SYMBOL='🌸'
typeset -g POWERLEVEL9K_PROMPT_CHAR_ERROR_SYMBOL='💥'
typeset -g POWERLEVEL9K_PROMPT_CHAR_FOREGROUND=$SAKURA_LILAC
typeset -g POWERLEVEL9K_PROMPT_CHAR_BACKGROUND='237'

# --- Estado de comandos ---
typeset -g POWERLEVEL9K_STATUS_OK_FOREGROUND=$SAKURA_TEXT
typeset -g POWERLEVEL9K_STATUS_ERROR_FOREGROUND=$SAKURA_ERROR

# --- Git dinámico (gradiente optimizado) ---
typeset -g POWERLEVEL9K_VCS_BRANCH_ICON='🌿'
typeset -g POWERLEVEL9K_VCS_MODIFIED_ICON='✿'
typeset -g POWERLEVEL9K_VCS_UNTRACKED_ICON='✨'
typeset -g POWERLEVEL9K_VCS_STAGED_ICON='💮'
typeset -g POWERLEVEL9K_VCS_CONFLICT_ICON='💥'

function sakura_vcs_color() {
  local width=$COLUMNS
  local hour=$(date +%H)
  local color=""

  # Gradiente según hora
  if (( hour >= 0 && hour < 4 )); then
    color=$SAKURA_LIGHT_PINK
  elif (( hour >= 4 && hour < 8 )); then
    color=$SAKURA_PINK
  elif (( hour >= 8 && hour < 12 )); then
    color=$SAKURA_LILAC
  elif (( hour >= 12 && hour < 16 )); then
    color=$SAKURA_CYAN
  elif (( hour >= 16 && hour < 20 )); then
    color=$SAKURA_LILAC
  else
    color=$SAKURA_PINK
  fi

  # Ajuste según ancho de terminal
  if (( width < 80 )); then
    echo $color
  elif (( width < 120 )); then
    case $color in
      $SAKURA_PINK) echo $SAKURA_LIGHT_PINK ;;
      $SAKURA_LILAC) echo $SAKURA_PINK ;;
      $SAKURA_CYAN) echo $SAKURA_LILAC ;;
      *) echo $color ;;
    esac
  else
    echo $color
  fi
}

typeset -g POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='$(sakura_vcs_color)'
typeset -g POWERLEVEL9K_VCS_CLEAN_FOREGROUND='$(sakura_vcs_color)'
typeset -g POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='$(sakura_vcs_color)'

# --- Background jobs ---
typeset -g POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND=$SAKURA_LIGHT_PINK
typeset -g POWERLEVEL9K_BACKGROUND_JOBS_SYMBOL='✨'

# --- Hora (barra derecha segura) ---
typeset -g POWERLEVEL9K_TIME_FOREGROUND=$SAKURA_CYAN
typeset -g POWERLEVEL9K_TIME_BACKGROUND='237'
typeset -g POWERLEVEL9K_TIME_FORMAT='🌸 %D{%H:%M}'

# --- Multilínea ---
typeset -g POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX='🌸 '
typeset -g POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX='🌸 '

# --- Separadores y longitud de carpeta ---
typeset -g POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR='❀'
typeset -g POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR='❀'
typeset -g POWERLEVEL9K_SHORTEN_DIR_LENGTH=2

# --- Fuente Nerd Font para emojis ---
POWERLEVEL9K_MODE='nerdfont-complete'

# --- Gradiente Sakura extra en ruta ---
typeset -g POWERLEVEL9K_DIR_HOME_FOREGROUND=$SAKURA_PINK
typeset -g POWERLEVEL9K_DIR_HOME_BACKGROUND='237'
typeset -g POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND=$SAKURA_LILAC
typeset -g POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='237'
typeset -g POWERLEVEL9K_DIR_ETC_FOREGROUND=$SAKURA_CYAN
typeset -g POWERLEVEL9K_DIR_ETC_BACKGROUND='237'

# --- Hooks para ajustar el prompt al cambiar tamaño o iniciar línea ---
autoload -Uz add-zsh-hook

function sakura_resize_prompt() {
  # Solo en sesiones interactivas
  [[ -o interactive ]] || return

  # Solo resetear si ZLE está activo
  if ! (( $+widgets[zle_reset_prompt] )); then
    return
  fi

  # No resetear si estamos leyendo contraseña de sudo
  if [[ -n "$SUDO_PROMPT" ]] || [[ "$PS1" == *"sudo"* ]]; then
    return
  fi

  zle reset-prompt
}

# Hook precmd normal
add-zsh-hook precmd sakura_resize_prompt

# Hooks de ZLE
zle -N zle-line-init sakura_resize_prompt
zle -N zle-keymap-select sakura_resize_prompt

# Hook al cambiar tamaño de la terminal
TRAPWINCH() { zle reset-prompt }

