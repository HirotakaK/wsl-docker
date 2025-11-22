# WSL環境構築

## 構築イメージ

Dockerを意識して運用する
【WSL2】
Ubuntu WSL 極限ミニマル構成（Docker 以外ほぼ何も入れない）
    └── Docker Engine
          ├── Alpine軽量Linuxコマンド環境
          ├── API用コンテナ（Ubuntu Slim）
          ├── GIS / GDAL / QGIS コンテナ（Ubuntu Full）
          ├── GUI Ubuntuコンテナ（xrdp / noVNC）
          └── Cloud Run / Build と完全一致する環境

## WSL環境コマンド
### from Ubuntu
```
docker run --rm alpine-dev yq --version
```

### from command prompt
```
wsl docker run --rm alpine-dev jq --version
```

# ショートカット

