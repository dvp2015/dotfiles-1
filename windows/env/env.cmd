@echo off

:: Bright yellow on dark green today
:: color 2e

set DVP_ENV=%USERPROFILE%\OneDrive\env
set DVP_TOOLS=c:\tools

:: Temporary system path at cmd startup
set DVP_ORIGINAL_PATH=%PATH%
set PATH=%PATH%;"%DVP_ENV%"
set PATH=%PATH%;"%ProgramFiles%\7-Zip"
set PATH=%PATH%;"%DVP_TOOLS%\Tools-1.8.0"

:: Add to path by command

::DOSKEY add_python26=set PATH=%PATH%;"C:\Python26\
::DOSKEY add_python33=set PATH=%PATH%;"C:\Python33\"

call %USERPROFILE%\OneDrive\env\alias.cmd

:: Run local folder configuration, if exists
if exist .local/env.cmd call .local/env.cmd 
