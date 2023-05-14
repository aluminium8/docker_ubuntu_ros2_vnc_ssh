
# docker_ubuntu_ros2_vnc_ssh

## ubuntuベースで，ros2, vnc, sshが使えるイメージ
基本的には[https://github.com/Tiryoh/docker-ros2-desktop-vnc](https://github.com/Tiryoh/docker-ros2-desktop-vnc)にて提供されている
イメージがベースとなっています．

ただし上記のものでは，試した限りではssh接続を利用できなかったため，ssh接続できるよう機能追加したもの
となります(もともと趣味用として作成していたため，付属しているライブラリバージョンを調べるための処理もいくらか含まれたままですが，ビルド時間・環境汚染等に影響はないかと思われます．
必要であればコメントアウトしてください．)．

[dockerhub](https://hub.docker.com/repository/docker/aluminium8/ros2_vnc_ssh/general)からイメージの直接DLも可能です．

コンテナ作成の際には，ssh用ポート(22)，vncポート(5900), websocketリモートポート(80),それぞれの設定が必要です．
