:: ------------------------------------------------------------------------------------------------------------------------------------------------------
:: uart_register_bridge
:: ------------------------------------------------------------------------------------------------------------------------------------------------------

:: run_top_integration_bank_compact_tb
pushd "%~dp0uart_register_bridge\board\de0"
call run.cmd 0 2>&1 | powershell -NoProfile -Command "$input | Tee-Object -FilePath '%~dp0log_build.log'"
popd
:: Copy compilation results
xcopy "%~dp0uart_register_bridge\board\de0\prj\*" "%~dp0results\uart_register_bridge\run_0\" /E /I /Y 2>&1 | powershell -NoProfile -Command "$input | Tee-Object -FilePath '%~dp0log_build.log' -Append"

:: run_top_integration_bank_compact_tb
pushd "%~dp0uart_register_bridge\board\de0"
call run.cmd 1 2>&1 | powershell -NoProfile -Command "$input | Tee-Object -FilePath '%~dp0log_build.log' -Append"
popd
:: Copy compilation results
xcopy "%~dp0uart_register_bridge\board\de0\prj\*" "%~dp0results\uart_register_bridge\run_1\" /E /I /Y 2>&1 | powershell -NoProfile -Command "$input | Tee-Object -FilePath '%~dp0log_build.log' -Append"