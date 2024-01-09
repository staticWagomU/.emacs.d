@echo off
setlocal enabledelayedexpansion

REM emacsのシンボリックリンクを作成
REM dir /B /A:Dでディレクトリのシンボリックリンクを作成する
for /f %%i in ('dir /B /A:D %USERPROFILE%\emacs.d') do (
  REM .gitは除外
  if not %%i == .git (
    mklink /D %APPDATA%\.emacs.d\%%i %USERPROFILE%\emacs.d\%%i
  )
)

REM dir /B /A-Dでファイルのシンボリックリンクを作成する
for /f %%i in ('dir /B /A-D %USERPROFILE%\emacs.d') do (
  mklink %APPDATA%\.emacs.d\%%i %USERPROFILE%\emacs.d\%%i
)
