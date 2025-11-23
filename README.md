# Docker環境

WindowsのWSL上に環境構築するLinux環境構築手順

# Docker環境構築・整備手順
## WSL Dockerビルド

`Dockerfile`を置いた場所で実施する

### CMD/Powershell

```
wsl docker build -t vibe .
```

### Ubunfu

```
docker build -t vibe .
```

## WSL Docker内でコマンド実施

```
docker run -it --rm vibe bash
```
