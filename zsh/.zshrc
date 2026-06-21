export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="duellj"

if [ -d "$HOME/.opencode/bin" ]; then
  export PATH="$HOME/.opencode/bin:$PATH"
fi

HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000

setopt append_history
setopt share_history
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt auto_cd
setopt correct

if command -v dircolors >/dev/null 2>&1; then
  eval "$(dircolors -b)"
fi

fpath=(/usr/share/zsh/site-functions $fpath)
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

plugins=(
  git
  sudo
  command-not-found
  colored-man-pages
  extract
  fzf
)

source "$ZSH/oh-my-zsh.sh"

autoload -U colors && colors


export CLICOLOR=1
export LESS='-R --use-color -Dd+r -Du+b'
export MANPAGER='less -R --use-color -Dd+r -Du+b'
export BAT_THEME='ansi'

if command -v eza >/dev/null 2>&1; then
  alias ls='eza --group-directories-first --color=always'
  alias ll='eza -lah --group-directories-first --git --color=always'
  alias la='eza -A --group-directories-first --color=always'
  alias lt='eza --tree --level=2 --group-directories-first --color=always'
else
  alias ls='ls --color=auto'
  alias ll='ls -lah --color=auto'
  alias la='ls -A --color=auto'
fi

alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias ip='ip --color=auto'

if command -v bat >/dev/null 2>&1; then
  alias cat='bat --paging=never --style=plain'
fi

if [ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
  ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=242'
fi

if [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  ZSH_HIGHLIGHT_STYLES[command]='fg=221'
  ZSH_HIGHLIGHT_STYLES[builtin]='fg=221'
  ZSH_HIGHLIGHT_STYLES[alias]='fg=179'
  ZSH_HIGHLIGHT_STYLES[path]='fg=223'
  ZSH_HIGHLIGHT_STYLES[arg0]='fg=221'
  ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=143'
  ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=143'
  ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=203'
fi

# cmatrix wrapper — reads ~/.cmatrixrc
cmatrix() {
  local cfg="$HOME/.cmatrixrc"
  local color=magenta delay=4 bold="-n" async="-a" extra=()
  [[ -f "$cfg" ]] && source "$cfg"
  [[ -n "$CMATRIX_COLOR" ]] && color="$CMATRIX_COLOR"
  [[ -n "$CMATRIX_DELAY" ]] && delay="$CMATRIX_DELAY"
  [[ "$CMATRIX_BOLD" == "0" ]] && bold=""
  [[ "$CMATRIX_BOLD" == "1" ]] && bold="-b"
  [[ "$CMATRIX_BOLD" == "2" ]] && bold="-B"
  [[ "$CMATRIX_BOLD" == "-1" ]] && bold="-n"
  [[ "$CMATRIX_ASYNC" != "1" ]] && async=""
  [[ "$CMATRIX_RAINBOW" == "1" ]] && extra+=("-r")
  [[ "$CMATRIX_LAMBDA" == "1" ]] && extra+=("-m")
  [[ "$CMATRIX_OLDSTYLE" == "1" ]] && extra+=("-o")
  command cmatrix -C "$color" -u "$delay" $bold $async $extra "$@"
}

export PATH="$HOME/.local/bin:$HOME/.npm-global/bin:$PATH"

# Claude Code proxy (free NVIDIA NIM backend)
export ANTHROPIC_BASE_URL="http://localhost:8082"
export ANTHROPIC_API_KEY="placeholder"

alias claude-proxy='uv run --directory ~/free-claude-code uvicorn server:app --host 0.0.0.0 --port 8082'
function tgpt() {
  command tgpt --provider openai --url "https://opencode.ai/zen/v1/chat/completions" --model "deepseek-v4-flash-free" --key "sk-MlPs8MjswvNxpZqPwFxeCePTqgnEjQqJBr8Y43UUYAIGeXC9tz650Ce1dENCwPL2" "$@"
}

alias vps='ssh antigravity'

export PATH=$PATH:/home/joyboy/.spicetify


alias w="/home/joyboy/Desktop/mov-cli-arabic/cinepro/bin/w"
export LS_COLORS='di=38;2;223;200;109;1:fi=38;2;180;180;176:ln=38;2;135;122;75:ex=38;2;164;147;85;1:pi=38;2;223;200;109;1:so=38;2;164;147;85:bd=38;2;223;200;109;1:cd=38;2;223;200;109;1:or=38;2;218;68;83:mi=38;2;218;68;83:*.tar=38;2;89;82;55:*.tgz=38;2;89;82;55:*.arc=38;2;89;82;55:*.arj=38;2;89;82;55:*.taz=38;2;89;82;55:*.lha=38;2;89;82;55:*.lz4=38;2;89;82;55:*.lzh=38;2;89;82;55:*.lzma=38;2;89;82;55:*.tlz=38;2;89;82;55:*.txz=38;2;89;82;55:*.tzo=38;2;89;82;55:*.t7z=38;2;89;82;55:*.zip=38;2;89;82;55:*.z=38;2;89;82;55:*.dz=38;2;89;82;55:*.gz=38;2;89;82;55:*.lrz=38;2;89;82;55:*.lz=38;2;89;82;55:*.lzo=38;2;89;82;55:*.xz=38;2;89;82;55:*.zst=38;2;89;82;55:*.tzst=38;2;89;82;55:*.bz2=38;2;89;82;55:*.bz=38;2;89;82;55:*.tbz=38;2;89;82;55:*.tbz2=38;2;89;82;55:*.tz=38;2;89;82;55:*.deb=38;2;89;82;55:*.rpm=38;2;89;82;55:*.jar=38;2;89;82;55:*.war=38;2;89;82;55:*.ear=38;2;89;82;55:*.sar=38;2;89;82;55:*.rar=38;2;89;82;55:*.alz=38;2;89;82;55:*.ace=38;2;89;82;55:*.zoo=38;2;89;82;55:*.cpio=38;2;89;82;55:*.7z=38;2;89;82;55:*.rz=38;2;89;82;55:*.cab=38;2;89;82;55:*.jpg=38;2;164;147;85:*.jpeg=38;2;164;147;85:*.mjpg=38;2;164;147;85:*.mjpeg=38;2;164;147;85:*.gif=38;2;164;147;85:*.bmp=38;2;164;147;85:*.pbm=38;2;164;147;85:*.pgm=38;2;164;147;85:*.ppm=38;2;164;147;85:*.tga=38;2;164;147;85:*.xbm=38;2;164;147;85:*.xpm=38;2;164;147;85:*.tif=38;2;164;147;85:*.tiff=38;2;164;147;85:*.png=38;2;164;147;85:*.svg=38;2;164;147;85:*.svgz=38;2;164;147;85:*.mng=38;2;164;147;85:*.pcx=38;2;164;147;85:*.mov=38;2;164;147;85:*.mpg=38;2;164;147;85:*.mpeg=38;2;164;147;85:*.m2v=38;2;164;147;85:*.mkv=38;2;164;147;85:*.webm=38;2;164;147;85:*.webp=38;2;164;147;85:*.ogm=38;2;164;147;85:*.mp4=38;2;164;147;85:*.m4v=38;2;164;147;85:*.mp4v=38;2;164;147;85:*.vob=38;2;164;147;85:*.qt=38;2;164;147;85:*.nuv=38;2;164;147;85:*.wmv=38;2;164;147;85:*.asf=38;2;164;147;85:*.rm=38;2;164;147;85:*.rmvb=38;2;164;147;85:*.flc=38;2;164;147;85:*.avi=38;2;164;147;85:*.fli=38;2;164;147;85:*.flv=38;2;164;147;85:*.gl=38;2;164;147;85:*.dl=38;2;164;147;85:*.xcf=38;2;164;147;85:*.xwd=38;2;164;147;85:*.yuv=38;2;164;147;85:*.cgm=38;2;164;147;85:*.emf=38;2;164;147;85:*.ogv=38;2;164;147;85:*.ogx=38;2;164;147;85:*.aac=38;2;135;122;75:*.au=38;2;135;122;75:*.flac=38;2;135;122;75:*.m4a=38;2;135;122;75:*.mid=38;2;135;122;75:*.midi=38;2;135;122;75:*.mka=38;2;135;122;75:*.mp3=38;2;135;122;75:*.mpc=38;2;135;122;75:*.ogg=38;2;135;122;75:*.ra=38;2;135;122;75:*.wav=38;2;135;122;75:*.oga=38;2;135;122;75:*.opus=38;2;135;122;75:*.spx=38;2;135;122;75:*.xspf=38;2;135;122;75:*.c=38;2;180;180;176:*.cpp=38;2;180;180;176:*.h=38;2;180;180;176:*.hpp=38;2;180;180;176:*.py=38;2;180;180;176:*.js=38;2;180;180;176:*.ts=38;2;180;180;176:*.rs=38;2;180;180;176:*.sh=38;2;180;180;176:*.fish=38;2;180;180;176:*.zsh=38;2;180;180;176:*.bash=38;2;180;180;176:*.html=38;2;180;180;176:*.css=38;2;180;180;176:*.json=38;2;180;180;176:*.xml=38;2;180;180;176:*.yaml=38;2;180;180;176:*.yml=38;2;180;180;176:*.toml=38;2;180;180;176:*.md=38;2;180;180;176:*.txt=38;2;180;180;176:*.conf=38;2;180;180;176'
export EZA_COLORS='di=38;2;223;200;109;1:fi=38;2;180;180;176:ln=38;2;135;122;75:ex=38;2;164;147;85;1:pi=38;2;223;200;109;1:so=38;2;164;147;85:bd=38;2;223;200;109;1:cd=38;2;223;200;109;1:or=38;2;218;68;83:mi=38;2;218;68;83:*.tar=38;2;89;82;55:*.tgz=38;2;89;82;55:*.arc=38;2;89;82;55:*.arj=38;2;89;82;55:*.taz=38;2;89;82;55:*.lha=38;2;89;82;55:*.lz4=38;2;89;82;55:*.lzh=38;2;89;82;55:*.lzma=38;2;89;82;55:*.tlz=38;2;89;82;55:*.txz=38;2;89;82;55:*.tzo=38;2;89;82;55:*.t7z=38;2;89;82;55:*.zip=38;2;89;82;55:*.z=38;2;89;82;55:*.dz=38;2;89;82;55:*.gz=38;2;89;82;55:*.lrz=38;2;89;82;55:*.lz=38;2;89;82;55:*.lzo=38;2;89;82;55:*.xz=38;2;89;82;55:*.zst=38;2;89;82;55:*.tzst=38;2;89;82;55:*.bz2=38;2;89;82;55:*.bz=38;2;89;82;55:*.tbz=38;2;89;82;55:*.tbz2=38;2;89;82;55:*.tz=38;2;89;82;55:*.deb=38;2;89;82;55:*.rpm=38;2;89;82;55:*.jar=38;2;89;82;55:*.war=38;2;89;82;55:*.ear=38;2;89;82;55:*.sar=38;2;89;82;55:*.rar=38;2;89;82;55:*.alz=38;2;89;82;55:*.ace=38;2;89;82;55:*.zoo=38;2;89;82;55:*.cpio=38;2;89;82;55:*.7z=38;2;89;82;55:*.rz=38;2;89;82;55:*.cab=38;2;89;82;55:*.jpg=38;2;164;147;85:*.jpeg=38;2;164;147;85:*.mjpg=38;2;164;147;85:*.mjpeg=38;2;164;147;85:*.gif=38;2;164;147;85:*.bmp=38;2;164;147;85:*.pbm=38;2;164;147;85:*.pgm=38;2;164;147;85:*.ppm=38;2;164;147;85:*.tga=38;2;164;147;85:*.xbm=38;2;164;147;85:*.xpm=38;2;164;147;85:*.tif=38;2;164;147;85:*.tiff=38;2;164;147;85:*.png=38;2;164;147;85:*.svg=38;2;164;147;85:*.svgz=38;2;164;147;85:*.mng=38;2;164;147;85:*.pcx=38;2;164;147;85:*.mov=38;2;164;147;85:*.mpg=38;2;164;147;85:*.mpeg=38;2;164;147;85:*.m2v=38;2;164;147;85:*.mkv=38;2;164;147;85:*.webm=38;2;164;147;85:*.webp=38;2;164;147;85:*.ogm=38;2;164;147;85:*.mp4=38;2;164;147;85:*.m4v=38;2;164;147;85:*.mp4v=38;2;164;147;85:*.vob=38;2;164;147;85:*.qt=38;2;164;147;85:*.nuv=38;2;164;147;85:*.wmv=38;2;164;147;85:*.asf=38;2;164;147;85:*.rm=38;2;164;147;85:*.rmvb=38;2;164;147;85:*.flc=38;2;164;147;85:*.avi=38;2;164;147;85:*.fli=38;2;164;147;85:*.flv=38;2;164;147;85:*.gl=38;2;164;147;85:*.dl=38;2;164;147;85:*.xcf=38;2;164;147;85:*.xwd=38;2;164;147;85:*.yuv=38;2;164;147;85:*.cgm=38;2;164;147;85:*.emf=38;2;164;147;85:*.ogv=38;2;164;147;85:*.ogx=38;2;164;147;85:*.aac=38;2;135;122;75:*.au=38;2;135;122;75:*.flac=38;2;135;122;75:*.m4a=38;2;135;122;75:*.mid=38;2;135;122;75:*.midi=38;2;135;122;75:*.mka=38;2;135;122;75:*.mp3=38;2;135;122;75:*.mpc=38;2;135;122;75:*.ogg=38;2;135;122;75:*.ra=38;2;135;122;75:*.wav=38;2;135;122;75:*.oga=38;2;135;122;75:*.opus=38;2;135;122;75:*.spx=38;2;135;122;75:*.xspf=38;2;135;122;75:*.c=38;2;180;180;176:*.cpp=38;2;180;180;176:*.h=38;2;180;180;176:*.hpp=38;2;180;180;176:*.py=38;2;180;180;176:*.js=38;2;180;180;176:*.ts=38;2;180;180;176:*.rs=38;2;180;180;176:*.sh=38;2;180;180;176:*.fish=38;2;180;180;176:*.zsh=38;2;180;180;176:*.bash=38;2;180;180;176:*.html=38;2;180;180;176:*.css=38;2;180;180;176:*.json=38;2;180;180;176:*.xml=38;2;180;180;176:*.yaml=38;2;180;180;176:*.yml=38;2;180;180;176:*.toml=38;2;180;180;176:*.md=38;2;180;180;176:*.txt=38;2;180;180;176:*.conf=38;2;180;180;176'
