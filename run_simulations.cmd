REM :: ------------------------------------------------------------------------------------------------------------------------------------------------------
REM :: uart_register_bridge
REM :: ------------------------------------------------------------------------------------------------------------------------------------------------------
REM 
REM :: run_top_integration_bank_compact_tb
REM pushd "%~dp0uart_register_bridge\sim"
REM python -u run_top_integration_bank_compact_tb.py --clean 2>&1 | powershell -NoProfile -Command "$input | Tee-Object -FilePath '%~dp0regression_sim.log'"
REM popd
REM 
REM :: run_top_integration_bank_compact_tb
REM pushd "%~dp0uart_register_bridge\sim"
REM python -u run_top_integration_axi_extended_tb.py 2>&1 | powershell -NoProfile -Command "$input | Tee-Object -FilePath '%~dp0regression_sim.log' -Append"
REM popd
REM 
REM REM This one is not available (Future todo)
REM REM :: run_top_integration_axi_compact_tb
REM REM pushd "%~dp0uart_register_bridge\sim"
REM REM python -u run_top_integration_axi_compact_tb.py 2>&1 | powershell -NoProfile -Command "$input | Tee-Object -FilePath '%~dp0regression_sim.log' -Append"
REM REM popd

:: ------------------------------------------------------------------------------------------------------------------------------------------------------
:: elan32_soc
:: ------------------------------------------------------------------------------------------------------------------------------------------------------
:: HEEEEEEEEEEEEEEEEEEEEEERRRRRE THERE ARE TEST CASES TO FIX, TRNG and SDRAM
:: run_axi_soc_subsystem_tb
pushd "%~dp0elan32_soc\riscv_soc_shell\sim"
python -u run_axi_soc_subsystem_tb.py --clean 2>&1 | powershell -NoProfile -Command "$input | Tee-Object -FilePath '%~dp0regression_sim.log'"
popd

:: run_riscv32im_isa_tb
pushd "%~dp0elan32_soc\sim"
python -u run_riscv32im_isa_tb.py --clean 2>&1 | powershell -NoProfile -Command "$input | Tee-Object -FilePath '%~dp0regression_sim.log'"
popd

REM :: run_soc_tb
REM pushd "%~dp0elan32_soc\riscv_soc_shell\c\adder"
REM call run.cmd
REM popd
REM pushd "%~dp0elan32_soc\sim"
REM python -u run_soc_tb.py 2>&1 | powershell -NoProfile -Command "$input | Tee-Object -FilePath '%~dp0regression_sim.log'"
REM popd
