# ubuntu-unminimize
## 使い方

### build
`--build-arg`を指定しない場合、デフォルトでユーザ名がsnyt45、パスワードがpasswordのユーザーが作成されます。
```
docker build -t ubuntu-unminimize . --build-arg USER=user --build-arg PASS=password
```

### run

```
docker run -it ubuntu-unminimize /bin/bash
```
