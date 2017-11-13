:: Aliases

doskey alias=doskey /macros
doskey home=cd %USERPROFILE%
doskey ls=dir /B/D $*
doskey la=dir /N/W $*
doskey ll=dir /N $*
doskey rm=del $*
doskey ed="%ProgramFiles%\Notepad++\notepad++.exe" $*
doskey ee="%ProgramFiles%\Notepad++\notepad++.exe" "%USERPROFILE%\dotfiles\windows\env\env.cmd" $*
doskey ea="%ProgramFiles%\Notepad++\notepad++.exe" "%USERPROFILE%\dotfiles\windows\env\alias.cmd" $*
doskey ele="%ProgramFiles%\Notepad++\notepad++.exe" "%USERPROFILE%\OneDrive\env\env.cmd" $*
doskey ela="%ProgramFiles%\Notepad++\notepad++.exe" "%USERPROFILE%\OneDrive\env\alias.cmd" $*
doskey pycharm="%ProgramFiles%\JetBrains\PyCharm Community Edition 2017.2.3\bin\pycharm64.exe" $*

:: Common directories

doskey od=cd "%USERPROFILE%\OneDrive\$*"
:: Russian is not supported, so using short DOS name for "Google Диск"
doskey gd=cd "%USERPROFILE%\GOOGLE~1\$*"
doskey dev=cd "\dev\$*"
doskey doc="C:\Program Files\Microsoft Office\Office15\WINWORD.exe" $*
doskey xls="C:\Program Files\Microsoft Office\Office15\EXCEL.exe" $*
doskey ppt="C:\Program Files\Microsoft Office\Office15\POWERPNT.exe" $*

:: Open git bash console
doskey gb="%GIT_HOME%\git-bash.exe" $*


::doskey dropbox=cd "%USERPROFILE%\Dropbox\$*"
::doskey research=cd %USERPROFILE%\Dropbox\Research\
