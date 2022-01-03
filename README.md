# ubuntu-unminimize
## Usage

### docker build
指定した引数でユーザー名とパスワードが作成されます。
※必ずUSERとPASSの引数を渡す必要があります。

```
docker build -t ubuntu-unminimize . --build-arg USER=user --build-arg PASS=password
```

### docker run

```
docker run --rm -it ubuntu-unminimize /bin/bash
```
