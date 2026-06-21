# ── Environment ──────────────────────────────────────────────
set -gx EDITOR nvim
set -gx BROWSER firefox
set -gx VISUAL nvim
set -gx PAGER less
set -gx MANPAGER "less -R --use-color -Dd+r -Du+b"
set -gx LESS "-R --use-color -Dd+r -Du+b"
set -gx CLICOLOR 1
set -gx BAT_THEME ansi

set -gx PATH $HOME/.local/bin $HOME/.npm-global/bin $PATH
set -gx PATH $HOME/.opencode/bin $PATH
set -gx PATH /home/joyboy/.spicetify $PATH

# ── Theme (bobthefish) ──────────────────────────────────────
set -g theme_powerline_fonts yes
set -g theme_nerd_fonts yes

# ── History ──────────────────────────────────────────────────
set -gx fish_history fish
set -g fish_history_length 10000

# ── aurscan (AUR malware scanner) ────────────────────────────
set -gx AURSCAN_BACKEND openai
set -gx AURSCAN_OPENAI_URL "https://opencode.ai/zen/v1/chat/completions"
set -gx AURSCAN_OPENAI_MODEL "deepseek-v4-flash-free"
set -gx AURSCAN_TIMEOUT 300
set -gx OPENAI_API_KEY "sk-1iyY8jdrCGNrW1uWD8feKQpMdLc7Z5hAhPez8vWK3eqYPtkQAhy9Eq2yaTn9XIEh"

# ── Aliases ──────────────────────────────────────────────────
if command -q eza
    alias ls "eza --group-directories-first --color=always"
    alias ll "eza -lah --group-directories-first --git --color=always"
    alias la "eza -A --group-directories-first --color=always"
    alias lt "eza --tree --level=2 --group-directories-first --color=always"
else
    alias ls "ls --color=auto"
    alias ll "ls -lah --color=auto"
    alias la "ls -A --color=auto"
end

alias grep "grep --color=auto"
alias diff "diff --color=auto"
alias ip "ip --color=auto"

if command -q bat
    alias cat "bat --paging=never --style=plain"
end

alias vps "ssh antigravity"
alias w "/home/joyboy/Desktop/mov-cli-arabic/cinepro/bin/w"
alias proxy "uv run --directory ~/free-claude-code uvicorn server:app --host 0.0.0.0 --port 8082"
alias cls "clear"
alias yay syay
alias .. "cd .."
alias ... "cd ../.."
alias .... "cd ../../.."

# ── Abbreviations ────────────────────────────────────────────
abbr -a g git
abbr -a ga "git add"
abbr -a gc "git commit -m"
abbr -a gp "git push"
abbr -a gl "git log --oneline --graph"
abbr -a gs "git status"
abbr -a gd "git diff"
abbr -a gco "git checkout"
abbr -a gb "git branch"
abbr -a gm "git merge"
abbr -a gr "git rebase"
abbr -a gst "git stash"
abbr -a yeet "sudo rm -rf"
abbr -a please "sudo !!"
abbr -a l "eza --group-directories-first --color=always"

abbr -a bf bfetch
abbr -a refresh "source $HOME/.config/fish/config.fish"
abbr -a vim nvim
abbr -a vi nvim
abbr -a python python3
abbr -a pip pip3

# ── Misc ─────────────────────────────────────────────────────
# OpenCode env
set -gx ANTHROPIC_BASE_URL "http://localhost:8082"
set -gx ANTHROPIC_API_KEY "placeholder"

# tgpt function
function tgpt -d "Query tgpt with custom provider"
    command tgpt --provider openai \
        --url "https://opencode.ai/zen/v1/chat/completions" \
        --model "deepseek-v4-flash-free" \
        --key "sk-MlPs8MjswvNxpZqPwFxeCePTqgnEjQqJBr8Y43UUYAIGeXC9tz650Ce1dENCwPL2" $argv
end

# Cmatrix wrapper
function cmatrix -d "Cmatrix with config support"
    set -l cfg "$HOME/.cmatrixrc"
    set -l color magenta
    set -l delay 4
    set -l bold "-n"
    set -l async "-a"
    set -l extra

    if test -f "$cfg"
        source "$cfg"
    end

    if set -q CMATRIX_COLOR
        set color "$CMATRIX_COLOR"
    end
    if set -q CMATRIX_DELAY
        set delay "$CMATRIX_DELAY"
    end
    if set -q CMATRIX_BOLD
        switch "$CMATRIX_BOLD"
            case "0"
                set bold ""
            case "1"
                set bold "-b"
            case "2"
                set bold "-B"
            case "-1"
                set bold "-n"
        end
    end
    if test "$CMATRIX_ASYNC" != "1"
        set async ""
    end
    if test "$CMATRIX_RAINBOW" = "1"
        set -a extra "-r"
    end
    if test "$CMATRIX_LAMBDA" = "1"
        set -a extra "-m"
    end
    if test "$CMATRIX_OLDSTYLE" = "1"
        set -a extra "-o"
    end

    command cmatrix -C "$color" -u "$delay" $bold $async $extra $argv
end

# ── Interactive behaviors ────────────────────────────────────
# No greeting
set -U fish_greeting

# Syntax highlighting
set -g fish_color_command DFC86D
set -g fish_color_param A49355
set -g fish_color_error brred
set -g fish_color_quote D7AF87
set -g fish_color_redirection DFC86D
set -g fish_color_end 877A4B
set -g fish_color_comment 615F5A

# Autosuggestions
set -g fish_color_autosuggestion brblack

# Completion
set -g fish_color_search_match --background=brblack

# ── Startup info ─────────────────────────────────────────────
if status is-interactive
    bfetch
end
fish_add_path ~/bin
set -gx LS_COLORS 'di=38;2;223;200;109;1:fi=38;2;180;180;176:ln=38;2;135;122;75:ex=38;2;164;147;85;1:pi=38;2;223;200;109;1:so=38;2;164;147;85:bd=38;2;223;200;109;1:cd=38;2;223;200;109;1:or=38;2;218;68;83:mi=38;2;218;68;83:*.tar=38;2;89;82;55:*.tgz=38;2;89;82;55:*.arc=38;2;89;82;55:*.arj=38;2;89;82;55:*.taz=38;2;89;82;55:*.lha=38;2;89;82;55:*.lz4=38;2;89;82;55:*.lzh=38;2;89;82;55:*.lzma=38;2;89;82;55:*.tlz=38;2;89;82;55:*.txz=38;2;89;82;55:*.tzo=38;2;89;82;55:*.t7z=38;2;89;82;55:*.zip=38;2;89;82;55:*.z=38;2;89;82;55:*.dz=38;2;89;82;55:*.gz=38;2;89;82;55:*.lrz=38;2;89;82;55:*.lz=38;2;89;82;55:*.lzo=38;2;89;82;55:*.xz=38;2;89;82;55:*.zst=38;2;89;82;55:*.tzst=38;2;89;82;55:*.bz2=38;2;89;82;55:*.bz=38;2;89;82;55:*.tbz=38;2;89;82;55:*.tbz2=38;2;89;82;55:*.tz=38;2;89;82;55:*.deb=38;2;89;82;55:*.rpm=38;2;89;82;55:*.jar=38;2;89;82;55:*.war=38;2;89;82;55:*.ear=38;2;89;82;55:*.sar=38;2;89;82;55:*.rar=38;2;89;82;55:*.alz=38;2;89;82;55:*.ace=38;2;89;82;55:*.zoo=38;2;89;82;55:*.cpio=38;2;89;82;55:*.7z=38;2;89;82;55:*.rz=38;2;89;82;55:*.cab=38;2;89;82;55:*.jpg=38;2;164;147;85:*.jpeg=38;2;164;147;85:*.mjpg=38;2;164;147;85:*.mjpeg=38;2;164;147;85:*.gif=38;2;164;147;85:*.bmp=38;2;164;147;85:*.pbm=38;2;164;147;85:*.pgm=38;2;164;147;85:*.ppm=38;2;164;147;85:*.tga=38;2;164;147;85:*.xbm=38;2;164;147;85:*.xpm=38;2;164;147;85:*.tif=38;2;164;147;85:*.tiff=38;2;164;147;85:*.png=38;2;164;147;85:*.svg=38;2;164;147;85:*.svgz=38;2;164;147;85:*.mng=38;2;164;147;85:*.pcx=38;2;164;147;85:*.mov=38;2;164;147;85:*.mpg=38;2;164;147;85:*.mpeg=38;2;164;147;85:*.m2v=38;2;164;147;85:*.mkv=38;2;164;147;85:*.webm=38;2;164;147;85:*.webp=38;2;164;147;85:*.ogm=38;2;164;147;85:*.mp4=38;2;164;147;85:*.m4v=38;2;164;147;85:*.mp4v=38;2;164;147;85:*.vob=38;2;164;147;85:*.qt=38;2;164;147;85:*.nuv=38;2;164;147;85:*.wmv=38;2;164;147;85:*.asf=38;2;164;147;85:*.rm=38;2;164;147;85:*.rmvb=38;2;164;147;85:*.flc=38;2;164;147;85:*.avi=38;2;164;147;85:*.fli=38;2;164;147;85:*.flv=38;2;164;147;85:*.gl=38;2;164;147;85:*.dl=38;2;164;147;85:*.xcf=38;2;164;147;85:*.xwd=38;2;164;147;85:*.yuv=38;2;164;147;85:*.cgm=38;2;164;147;85:*.emf=38;2;164;147;85:*.ogv=38;2;164;147;85:*.ogx=38;2;164;147;85:*.aac=38;2;135;122;75:*.au=38;2;135;122;75:*.flac=38;2;135;122;75:*.m4a=38;2;135;122;75:*.mid=38;2;135;122;75:*.midi=38;2;135;122;75:*.mka=38;2;135;122;75:*.mp3=38;2;135;122;75:*.mpc=38;2;135;122;75:*.ogg=38;2;135;122;75:*.ra=38;2;135;122;75:*.wav=38;2;135;122;75:*.oga=38;2;135;122;75:*.opus=38;2;135;122;75:*.spx=38;2;135;122;75:*.xspf=38;2;135;122;75:*.c=38;2;180;180;176:*.cpp=38;2;180;180;176:*.h=38;2;180;180;176:*.hpp=38;2;180;180;176:*.py=38;2;180;180;176:*.js=38;2;180;180;176:*.ts=38;2;180;180;176:*.rs=38;2;180;180;176:*.sh=38;2;180;180;176:*.fish=38;2;180;180;176:*.zsh=38;2;180;180;176:*.bash=38;2;180;180;176:*.html=38;2;180;180;176:*.css=38;2;180;180;176:*.json=38;2;180;180;176:*.xml=38;2;180;180;176:*.yaml=38;2;180;180;176:*.yml=38;2;180;180;176:*.toml=38;2;180;180;176:*.md=38;2;180;180;176:*.txt=38;2;180;180;176:*.conf=38;2;180;180;176'
set -gx EZA_COLORS 'di=38;2;223;200;109;1:fi=38;2;180;180;176:ln=38;2;135;122;75:ex=38;2;164;147;85;1:pi=38;2;223;200;109;1:so=38;2;164;147;85:bd=38;2;223;200;109;1:cd=38;2;223;200;109;1:or=38;2;218;68;83:mi=38;2;218;68;83:*.tar=38;2;89;82;55:*.tgz=38;2;89;82;55:*.arc=38;2;89;82;55:*.arj=38;2;89;82;55:*.taz=38;2;89;82;55:*.lha=38;2;89;82;55:*.lz4=38;2;89;82;55:*.lzh=38;2;89;82;55:*.lzma=38;2;89;82;55:*.tlz=38;2;89;82;55:*.txz=38;2;89;82;55:*.tzo=38;2;89;82;55:*.t7z=38;2;89;82;55:*.zip=38;2;89;82;55:*.z=38;2;89;82;55:*.dz=38;2;89;82;55:*.gz=38;2;89;82;55:*.lrz=38;2;89;82;55:*.lz=38;2;89;82;55:*.lzo=38;2;89;82;55:*.xz=38;2;89;82;55:*.zst=38;2;89;82;55:*.tzst=38;2;89;82;55:*.bz2=38;2;89;82;55:*.bz=38;2;89;82;55:*.tbz=38;2;89;82;55:*.tbz2=38;2;89;82;55:*.tz=38;2;89;82;55:*.deb=38;2;89;82;55:*.rpm=38;2;89;82;55:*.jar=38;2;89;82;55:*.war=38;2;89;82;55:*.ear=38;2;89;82;55:*.sar=38;2;89;82;55:*.rar=38;2;89;82;55:*.alz=38;2;89;82;55:*.ace=38;2;89;82;55:*.zoo=38;2;89;82;55:*.cpio=38;2;89;82;55:*.7z=38;2;89;82;55:*.rz=38;2;89;82;55:*.cab=38;2;89;82;55:*.jpg=38;2;164;147;85:*.jpeg=38;2;164;147;85:*.mjpg=38;2;164;147;85:*.mjpeg=38;2;164;147;85:*.gif=38;2;164;147;85:*.bmp=38;2;164;147;85:*.pbm=38;2;164;147;85:*.pgm=38;2;164;147;85:*.ppm=38;2;164;147;85:*.tga=38;2;164;147;85:*.xbm=38;2;164;147;85:*.xpm=38;2;164;147;85:*.tif=38;2;164;147;85:*.tiff=38;2;164;147;85:*.png=38;2;164;147;85:*.svg=38;2;164;147;85:*.svgz=38;2;164;147;85:*.mng=38;2;164;147;85:*.pcx=38;2;164;147;85:*.mov=38;2;164;147;85:*.mpg=38;2;164;147;85:*.mpeg=38;2;164;147;85:*.m2v=38;2;164;147;85:*.mkv=38;2;164;147;85:*.webm=38;2;164;147;85:*.webp=38;2;164;147;85:*.ogm=38;2;164;147;85:*.mp4=38;2;164;147;85:*.m4v=38;2;164;147;85:*.mp4v=38;2;164;147;85:*.vob=38;2;164;147;85:*.qt=38;2;164;147;85:*.nuv=38;2;164;147;85:*.wmv=38;2;164;147;85:*.asf=38;2;164;147;85:*.rm=38;2;164;147;85:*.rmvb=38;2;164;147;85:*.flc=38;2;164;147;85:*.avi=38;2;164;147;85:*.fli=38;2;164;147;85:*.flv=38;2;164;147;85:*.gl=38;2;164;147;85:*.dl=38;2;164;147;85:*.xcf=38;2;164;147;85:*.xwd=38;2;164;147;85:*.yuv=38;2;164;147;85:*.cgm=38;2;164;147;85:*.emf=38;2;164;147;85:*.ogv=38;2;164;147;85:*.ogx=38;2;164;147;85:*.aac=38;2;135;122;75:*.au=38;2;135;122;75:*.flac=38;2;135;122;75:*.m4a=38;2;135;122;75:*.mid=38;2;135;122;75:*.midi=38;2;135;122;75:*.mka=38;2;135;122;75:*.mp3=38;2;135;122;75:*.mpc=38;2;135;122;75:*.ogg=38;2;135;122;75:*.ra=38;2;135;122;75:*.wav=38;2;135;122;75:*.oga=38;2;135;122;75:*.opus=38;2;135;122;75:*.spx=38;2;135;122;75:*.xspf=38;2;135;122;75:*.c=38;2;180;180;176:*.cpp=38;2;180;180;176:*.h=38;2;180;180;176:*.hpp=38;2;180;180;176:*.py=38;2;180;180;176:*.js=38;2;180;180;176:*.ts=38;2;180;180;176:*.rs=38;2;180;180;176:*.sh=38;2;180;180;176:*.fish=38;2;180;180;176:*.zsh=38;2;180;180;176:*.bash=38;2;180;180;176:*.html=38;2;180;180;176:*.css=38;2;180;180;176:*.json=38;2;180;180;176:*.xml=38;2;180;180;176:*.yaml=38;2;180;180;176:*.yml=38;2;180;180;176:*.toml=38;2;180;180;176:*.md=38;2;180;180;176:*.txt=38;2;180;180;176:*.conf=38;2;180;180;176'
