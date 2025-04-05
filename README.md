## my_castle

このリポジトリは[homeshick](https://github.com/andsens/homeshick)を使用した dotfiles 管理のためのキャッスルです。

## インストール

```bash
# homeshickをインストール
git clone https://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick

# このキャッスルをクローン
$HOME/.homesick/repos/homeshick/bin/homeshick clone [GitHubユーザー名]/my_castle

# シンボリックリンクを作成
$HOME/.homesick/repos/homeshick/bin/homeshick link my_castle
```

## 更新方法

キャッスルを更新した後、変更をリモートリポジトリに反映するには：

```bash
# キャッスルディレクトリに移動
homeshick cd my_castle

# 変更をコミットしてプッシュ
git add .
git commit -m "変更内容の説明"
git push
```

## 同期

他の環境で行った変更を取得するには：

```bash
homeshick pull my_castle
```
