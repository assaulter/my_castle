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
alias gcc=llvm-gcc

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
# export GOROOT=$(go1.18 env GOROOT)
# export PATH=$PATH:$GOROOT:bin
export GOPRIVATE=github.com/asahi-digital

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
