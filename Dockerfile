FROM ubuntu:20.04
# aptの高速化
RUN sed -i 's@archive.ubuntu.com@ftp.jaist.ac.jp/pub/Linux@g' /etc/apt/sources.list
# パッケージ一覧の更新
RUN apt update
# ロケールを日本語に設定
#RUN apt install -y language-pack-ja
#ENV LANG=ja_JP.UTF8
#ENV LANGUAGE=ja_JP.UTF8
#ENV LC_ALL=ja_JP.UTF8
# タイムゾーンを東京に変更
ENV TZ=Asia/Tokyo
ARG DEBIAN_FRONTEND=noninteractive
RUN apt install -y tzdata
# 必要なパッケージをインストール
RUN apt install -y vim \
                   sudo \
                   git \
                   man
# Unminimize
RUN yes | unminimize
# ユーザー作成
ARG USER=snyt45
ARG PASS=password
RUN useradd -m ${USER}
# ユーザーをsudoグループに追加
RUN gpasswd -a ${USER} sudo
# ユーザーのパスワード設定
RUN echo "${USER}:${PASS}" | chpasswd
# wsl起動時のデフォルトユーザー設定
RUN { \
        echo "[user]"; \
        echo "default=${USER}"; \
    } > /etc/wsl.conf
USER ${USER}
