# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Powerlevel10k
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

#--- zshの設定 ---#
bindkey -e                        # emacsライクなキーバインド
export LANG=ja_JP.UTF-8           # 日本語環境
# 履歴
HISTFILE=~/.zsh_history           # historyファイル
HISTSIZE=10000                    # ファイルサイズ
SAVEHIST=10000                    # saveする量
setopt hist_ignore_dups           # 重複を記録しない
setopt hist_reduce_blanks         # スペース排除
setopt share_history              # 履歴ファイルを共有
setopt EXTENDED_HISTORY           # zshの開始終了を記録
#--- alias ---#
alias beep='echo -e "\a"'
alias r='rails'
alias safari='open -a Safari'
alias chrome='open -a Gooogle\ Chrome'
alias kobito='open -a Kobito'
alias be='bundle exec'
alias g='git'

#--- paths ---#
typeset -U path PATH
path=(
  /opt/homebrew/bin(N-/)
  /opt/homebrew/sbin(N-/)
  /usr/bin
  /usr/sbin
  /bin
  /sbin
  /usr/local/bin(N-/)
  /usr/local/sbin(N-/)
  /Library/Apple/usr/bin
)

#--- その他言語 ---#
### for go lang
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

#--- その他ツール ---#
# editor
export EDITOR=vim

# ghq
function ghq-fzf() {
  local src=$(ghq list | fzf --preview "bat --color=always --style=header,grid --line-range :80 $(ghq root)/{}/README.*")
  if [ -n "$src" ]; then
    cd "$(ghq root)/$src"
  fi
}
zle -N ghq-fzf
bindkey '^g' ghq-fzf

# homeshick
source "$HOME/.homesick/repos/homeshick/homeshick.sh"

# java
export PATH="/usr/local/opt/openjdk/bin:$PATH"

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# mise
eval "$(mise activate zsh)"
export PATH="$HOME/.mint/bin:$PATH"
export JAVA_HOME=/opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk/Contents/Home
export PATH="$JAVA_HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# zsh-autosuggestions
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
export PATH=$PATH:$HOME/.maestro/bin
