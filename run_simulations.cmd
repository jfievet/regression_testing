

type nul > "%~dp0regression_sim.log"

:: ------------------------------------------------------------------------------------------------------------------------------------------------------
:: uart_register_bridge
:: ------------------------------------------------------------------------------------------------------------------------------------------------------

:: run_top_integration_bank_compact_tb
pushd "%~dp0uart_register_bridge\sim"
python -u run_top_integration_bank_compact_tb.py --clean 2>&1 | powershell -NoProfile -Command "$input | Tee-Object -FilePath '%~dp0regression_sim.log'" -Append"
popd

:: run_top_integration_bank_compact_tb
pushd "%~dp0uart_register_bridge\sim"
python -u run_top_integration_axi_extended_tb.py 2>&1 | powershell -NoProfile -Command "$input | Tee-Object -FilePath '%~dp0regression_sim.log' -Append"
popd

REM This one is not available (Future todo)
REM :: run_top_integration_axi_compact_tb
REM pushd "%~dp0uart_register_bridge\sim"
REM python -u run_top_integration_axi_compact_tb.py 2>&1 | powershell -NoProfile -Command "$input | Tee-Object -FilePath '%~dp0regression_sim.log' -Append"
REM popd

:: ------------------------------------------------------------------------------------------------------------------------------------------------------
:: elan32_soc
:: ------------------------------------------------------------------------------------------------------------------------------------------------------
:: run_axi_soc_subsystem_tb
pushd "%~dp0elan32_soc\riscv_soc_shell\sim"
python -u run_axi_soc_subsystem_tb.py --clean 2>&1 | powershell -NoProfile -Command "$input | Tee-Object -FilePath '%~dp0regression_sim.log'" -Append"
popd

:: run_riscv32im_isa_tb
pushd "%~dp0elan32_soc\sim"
python -u run_riscv32im_isa_tb.py --clean 2>&1 | powershell -NoProfile -Command "$input | Tee-Object -FilePath '%~dp0regression_sim.log'" -Append"
popd

:: run_soc_tb
pushd "%~dp0elan32_soc\riscv_soc_shell\c\adder"
call run.cmd
popd
pushd "%~dp0elan32_soc\sim"
python -u run_soc_tb.py 2>&1 | powershell -NoProfile -Command "$input | Tee-Object -FilePath '%~dp0regression_sim.log'" -Append"
popd
