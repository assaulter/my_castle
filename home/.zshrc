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
# history 操作まわり
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

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

#--- その他ツール ---#
# editor
export EDITOR=vim

# peco
function peco-src () {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-src
bindkey '^]' peco-src

# homeshick
source "$HOME/.homesick/repos/homeshick/homeshick.sh"

# java
export PATH="/usr/local/opt/openjdk/bin:$PATH"

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# link asdf
. /opt/homebrew/opt/asdf/libexec/asdf.sh

# direnv
eval "$(direnv hook zsh)"