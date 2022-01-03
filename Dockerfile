FROM ubuntu:20.04
# aptの高速化
RUN sed -i 's@archive.ubuntu.com@ftp.jaist.ac.jp/pub/Linux@g' /etc/apt/sources.list
# タイムゾーンを東京に変更
ENV TZ=Asia/Tokyo
# パッケージ一覧の更新 & インストール
# tzdateインストール時にダイアグログボックスを開きインストールに失敗するため、
# apt update時のみDEBIAN_FRONTENDをnoninteractiveにしている。
RUN apt update && \
    apt upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt install -y \
	  tzdata \
	  sudo
# Unminimize
RUN yes | unminimize
# ユーザー作成
ARG USER
ARG PASS
RUN useradd -m ${USER} -s /bin/bash
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
