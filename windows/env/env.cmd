echo off

set DVP_TOOLS=c:\tools

:: Temporary system path at cmd startup
set DVP_ORIGINAL_PATH=%PATH%
set PATH=%PATH%;"%ProgramFiles%\7-Zip"
set PATH=%PATH%;"%DVP_TOOLS%\Tools-1.8.0"

if "%USER_ENV%"=="" goto skip_user_env 

::echo Loading user environment from %USER_ENV%

for %%f in ( %USER_ENV%\*.cmd ) do (
	if	not "%%f"=="%USER_ENV%\env.cmd" (
		call "%%f" $*
	)
)

:skip_user_env


if "%CD%"=="%USERPROFILE%" goto skip_local_env

:: Run local folder configuration, if exists
if exist .local/env.cmd call .local/env.cmd $*

:skip_local_env

:end