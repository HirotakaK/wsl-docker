@echo off
setlocal

REM ▼ Docker イメージ名（ここだけ変えればOK）
set IMAGE=vibe

REM ▼ Windows のカレントパスを取得
set WINPATH=%cd%

REM ▼ Windows パス → Linux パスへ変換
for /f "delims=" %%i in ('wsl wslpath "%WINPATH%"') do set LINUXPATH=%%i

REM ▼ IMAGEを起動（gcloud 認証を永続化できる版）
wsl docker run -it --rm -v "%LINUXPATH%":/work -v gcloud-config:/root/.config/gcloud -v claude-config:/root/.config/anthropic -v claude-cache:/root/.cache/anthropic -v claude-local:/root/.local/share/anthropic -w /work %IMAGE% bash

endlocal
