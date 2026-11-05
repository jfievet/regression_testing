set "BUILD=%~1"
type nul > "%~dp0log_build.log"

:: ------------------------------------------------------------------------------------------------------------------------------------------------------
:: uart_register_bridge
:: ------------------------------------------------------------------------------------------------------------------------------------------------------

:: 001 - run_top_integration_bank_compact
if "%BUILD%"=="" goto BUILD001
if "%BUILD%"=="001" goto BUILD001
goto END001
:BUILD001
pushd "%~dp0uart_register_bridge\board\de0"
call run.cmd 0 2>&1 | powershell -NoProfile -Command "$input | Tee-Object -FilePath '%~dp0log_build.log' -Append"
popd
:: Copy compilation results
xcopy "%~dp0uart_register_bridge\board\de0\prj\*" "%~dp0results\uart_register_bridge\run_0\" /E /I /Y 2>&1 | powershell -NoProfile -Command "$input | Tee-Object -FilePath '%~dp0log_build.log' -Append"
:END001

:: 002 - run_top_integration_axi_extended
if "%BUILD%"=="" goto BUILD002
if "%BUILD%"=="002" goto BUILD002
goto END002
:BUILD002
pushd "%~dp0uart_register_bridge\board\de0"
call run.cmd 1 2>&1 | powershell -NoProfile -Command "$input | Tee-Object -FilePath '%~dp0log_build.log' -Append"
popd
:: Copy compilation results
xcopy "%~dp0uart_register_bridge\board\de0\prj\*" "%~dp0results\uart_register_bridge\run_1\" /E /I /Y 2>&1 | powershell -NoProfile -Command "$input | Tee-Object -FilePath '%~dp0log_build.log' -Append"
:END002

:: ------------------------------------------------------------------------------------------------------------------------------------------------------
:: elan32_soc
:: ------------------------------------------------------------------------------------------------------------------------------------------------------

:: 003 - run_top_integration_axi_extended
if "%BUILD%"=="" goto BUILD003
if "%BUILD%"=="003" goto BUILD003
goto END003
:BUILD003
pushd "%~dp0elan32_soc\build\de0"
call run.cmd 2>&1 | powershell -NoProfile -Command "$input | Tee-Object -FilePath '%~dp0log_build.log' -Append"
popd
:: Copy compilation results
xcopy "%~dp0elan32_soc\build\de0\prj\*" "%~dp0results\elan32_soc\" /E /I /Y 2>&1 | powershell -NoProfile -Command "$input | Tee-Object -FilePath '%~dp0log_build.log' -Append"
:END003

:: ------------------------------------------------------------------------------------------------------------------------------------------------------
:: elan32_serial_soc
:: ------------------------------------------------------------------------------------------------------------------------------------------------------

:: 004 - run_top_integration_axi_extended
if "%BUILD%"=="" goto BUILD004
if "%BUILD%"=="004" goto BUILD004
goto END004
:BUILD004
pushd "%~dp0elan32_serial_soc\build\de0"
call run.cmd 2>&1 | powershell -NoProfile -Command "$input | Tee-Object -FilePath '%~dp0log_build.log' -Append"
popd
:: Copy compilation results
xcopy "%~dp0elan32_serial_soc\build\de0\prj\*" "%~dp0results\elan32_serial_soc\" /E /I /Y 2>&1 | powershell -NoProfile -Command "$input | Tee-Object -FilePath '%~dp0log_build.log' -Append"
:END004
