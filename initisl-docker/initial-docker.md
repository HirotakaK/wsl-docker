# WSL環境構築
手順 ①  WSL2 と必要機能だけ手動で有効化（Ubuntuは入れない） 
※ cmd/poweshellの管理者権限必須
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

手順 ②  WSL2 をデフォルトにする
wsl --set-default-version 2

手順 ③ PC再起動（これでWSLだけが入る）

Ubuntuはまだ入れていないので 22.04 は発生しません。

手順 ④ Ubuntu 24.04 だけをインストール（これが本命）
wsl --install -d Ubuntu-24.04

→ インストール完了！

ユーザーセットアップ
kiku
Tomyan5z
共通化したい


UbuntuRoot設定Dokcer以外


Dockerインストール

使い方

① スクリプトを作る：

nano docker-install.sh


貼り付けして保存（Ctrl + O → Enter → Ctrl + X）

② 実行権限を付与：

chmod +x docker-install.sh


③ root で実行：

sudo ./docker-install.sh


④ 完了後：

exit でUbuntuのWSLのシェルセッションを終了
wsl --shutdown


⑤ Ubuntu 再起動後：

docker run hello-world

メモ
結構時間経ってたっているのでUbuntu24にした
UbuntuSlimはWSL2に入れるのは非推奨
タイムサーバーはWindowsを参照するので問題なし