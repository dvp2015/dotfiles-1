@echo off

set DVP_ENV=%USERPROFILE%\dotfiles\windows\env
set DVP_TOOLS=c:\tools

:: Temporary system path at cmd startup
set DVP_ORIGINAL_PATH=%PATH%
set PATH=%PATH%;"%DVP_ENV%"
set PATH=%PATH%;"%ProgramFiles%\7-Zip"
set PATH=%PATH%;"%DVP_TOOLS%\Tools-1.8.0"

call %USERPROFILE%\OneDrive\env\alias.cmd

:: Run local folder configuration, if exists
if exist .local/env.cmd call .local/env.cmd 
