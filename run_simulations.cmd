
set "SIM=%~1"
type nul > "%~dp0regression_sim.log"

:: ------------------------------------------------------------------------------------------------------------------------------------------------------
:: uart_register_bridge
:: ------------------------------------------------------------------------------------------------------------------------------------------------------

:: 001 - run_top_integration_bank_compact_tb
if "%SIM%"=="" goto SIM001
if "%SIM%"=="001" goto SIM001
goto END001
:SIM001
pushd "%~dp0uart_register_bridge\sim"
python -u run_top_integration_bank_compact_tb.py --clean 2>&1 | powershell -NoProfile -Command "$input | Tee-Object -FilePath '%~dp0regression_sim.log' -Append"
popd
:END001

:: 002 - run_top_integration_axi_extended_tb
if "%SIM%"=="" goto SIM002
if "%SIM%"=="002" goto SIM002
goto END002
:SIM002
pushd "%~dp0uart_register_bridge\sim"
python -u run_top_integration_axi_extended_tb.py 2>&1 | powershell -NoProfile -Command "$input | Tee-Object -FilePath '%~dp0regression_sim.log' -Append"
popd
:END002

REM This one is not available (Future todo)
REM :: run_top_integration_axi_compact_tb
REM pushd "%~dp0uart_register_bridge\sim"
REM python -u run_top_integration_axi_compact_tb.py 2>&1 | powershell -NoProfile -Command "$input | Tee-Object -FilePath '%~dp0regression_sim.log' -Append"
REM popd

:: ------------------------------------------------------------------------------------------------------------------------------------------------------
:: elan32_soc
:: ------------------------------------------------------------------------------------------------------------------------------------------------------

:: 003 - run_axi_soc_subsystem_tb
if "%SIM%"=="" goto SIM003
if "%SIM%"=="003" goto SIM003
goto END003
:SIM003
pushd "%~dp0elan32_soc\riscv_soc_shell\sim"
python -u run_axi_soc_subsystem_tb.py --clean 2>&1 | powershell -NoProfile -Command "$input | Tee-Object -FilePath '%~dp0regression_sim.log' -Append"
popd
:END003

:: 004 - run_riscv32im_isa_tb
if "%SIM%"=="" goto SIM004
if "%SIM%"=="004" goto SIM004
goto END004
:SIM004
pushd "%~dp0elan32_soc\sim"
python -u run_riscv32im_isa_tb.py --clean 2>&1 | powershell -NoProfile -Command "$input | Tee-Object -FilePath '%~dp0regression_sim.log' -Append"
popd
:END004

:: 005 - run_soc_tb
if "%SIM%"=="" goto SIM005
if "%SIM%"=="005" goto SIM005
goto END005
:SIM005
pushd "%~dp0elan32_soc\riscv_soc_shell\c\adder"
call run.cmd
popd
pushd "%~dp0elan32_soc\sim"
python -u run_soc_tb.py 2>&1 | powershell -NoProfile -Command "$input | Tee-Object -FilePath '%~dp0regression_sim.log' -Append"
popd
:END005

:: ------------------------------------------------------------------------------------------------------------------------------------------------------
:: elan32_serial_soc
:: ------------------------------------------------------------------------------------------------------------------------------------------------------

:: 006 - run_axi_soc_subsystem_tb
if "%SIM%"=="" goto SIM006
if "%SIM%"=="006" goto SIM006
goto END006
:SIM006
pushd "%~dp0elan32_serial_soc\riscv_soc_shell\sim"
python -u run_axi_soc_subsystem_tb.py --clean 2>&1 | powershell -NoProfile -Command "$input | Tee-Object -FilePath '%~dp0regression_sim.log' -Append"
popd
:END006

:: 007 - run_riscv32im_isa_tb
if "%SIM%"=="" goto SIM007
if "%SIM%"=="007" goto SIM007
goto END007
:SIM007
pushd "%~dp0elan32_serial_soc\sim"
python -u run_riscv32im_isa_tb.py --clean 2>&1 | powershell -NoProfile -Command "$input | Tee-Object -FilePath '%~dp0regression_sim.log' -Append"
popd
:END007

:: 008 - run_soc_tb
if "%SIM%"=="" goto SIM008
if "%SIM%"=="008" goto SIM008
goto END008
:SIM008
pushd "%~dp0elan32_serial_soc\riscv_soc_shell\c\adder"
call run.cmd
popd
pushd "%~dp0elan32_serial_soc\sim"
python -u run_soc_tb.py 2>&1 | powershell -NoProfile -Command "$input | Tee-Object -FilePath '%~dp0regression_sim.log' -Append"
popd
:END008