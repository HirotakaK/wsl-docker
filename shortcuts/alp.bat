@echo off
setlocal

REM ▼ Docker イメージ名（ここだけ変えればOK）
set IMAGE=alpine-dev

REM ▼ Windows のカレントパスを取得
set WINPATH=%cd%

REM ▼ Windows パス → Linux パスへ変換
for /f "delims=" %%i in ('wsl wslpath "%WINPATH%"') do set LINUXPATH=%%i

REM ▼ Alpine（または IMAGE）を起動
wsl docker run -it --rm -v "%LINUXPATH%":/work -w /work %IMAGE% bash

endlocal
