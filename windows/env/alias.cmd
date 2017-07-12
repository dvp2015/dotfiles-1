:: Aliases

:: see https://stackoverflow.com/questions/20530996/aliases-in-windows-command-prompt



DOSKEY home=cd %USERPROFILE%
DOSKEY ls=dir /B $*
DOSKEY ll=dir $*
DOSKEY rm=del $*
DOSKEY ed="%ProgramFiles%\Notepad++\notepad++.exe" $*
DOSKEY ee="%ProgramFiles%\Notepad++\notepad++.exe" %USERPROFILE%\OneDrive\env\env.cmd $*
DOSKEY ea="%ProgramFiles%\Notepad++\notepad++.exe" %USERPROFILE%\OneDrive\env\alias.cmd $*
DOSKEY pycharm="%ProgramFiles%\JetBrains\PyCharm Community Edition 2017.1.3\bin\pycharm64.exe" $*

:: Common directories

DOSKEY od=cd "%USERPROFILE%\OneDrive\$*"
:: Russian is not supported, so using short DOS name for "Google Диск"
DOSKEY gd=cd "%USERPROFILE%\GOOGLE~1\$*"
DOSKEY dev=cd "\dev\$*"
DOSKEY doc="C:\Program Files\Microsoft Office\Office15\WINWORD.exe" $*
DOSKEY xls="C:\Program Files\Microsoft Office\Office15\EXCEL.exe" $*
DOSKEY ppt="C:\Program Files\Microsoft Office\Office15\POWERPNT.exe" $*

::DOSKEY dropbox=cd "%USERPROFILE%\Dropbox\$*"
::DOSKEY research=cd %USERPROFILE%\Dropbox\Research\

:: Add to path by command

::DOSKEY add_python26=set PATH=%PATH%;"C:\Python26\
::DOSKEY add_python33=set PATH=%PATH%;"C:\Python33\"
