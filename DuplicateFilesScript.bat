@echo off
setlocal disableDelayedExpansion
rem set root="C:\Users\es407\Desktop\"Batch Test""
set /p PARENT=Enter the root directory to search for duplicates:

rem set output="C:\Users\es407\Desktop\"Duplicate testing"\Output.txt"

set "prevTest=none"
set "prevFile=none"
echo Starting Search for duplicate files in the file tree %PARENT%
echo ----------------------------------------------------------------------------------------
for /f "tokens=1-3 delims=:" %%A in (
  'for /r "%PARENT%" %%F in (*) do @echo %%~znxF:%%~fF:'
) do (
  set "currTest=%%A"
  set "currFile=%%B:%%C"
  setlocal enableDelayedExpansion
  set "match="
  if !currTest! equ !prevTest! fc /b "!prevFile!" "!currFile!" >nul && set match=1
  rem echo Searching for !prevFile!
  if defined match (
    echo !currFile!
	echo !prevFile!
	echo !currFile!>>C:\Users\es407\Desktop\"Duplicate testing"\Output.txt
	echo !prevFile!>>C:\Users\es407\Desktop\"Duplicate testing"\Output.txt
	echo ,>>C:\Users\es407\Desktop\"Duplicate testing"\Output.txt
	endlocal
  ) else (
    endlocal
    set "prevTest=%%A"
    set "prevFile=%%B:%%C"
  )
)
echo newline
cmd
