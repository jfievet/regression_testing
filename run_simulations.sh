#!/bin/bash

SIM="$1"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LOG="$SCRIPT_DIR/regression_sim.log"

: > "$LOG"

# ------------------------------------------------------------------------------------------------------------------------------------------------------
# uart_register_bridge
# ------------------------------------------------------------------------------------------------------------------------------------------------------

# 001 - run_top_integration_bank_compact_tb
if [[ -z "$SIM" || "$SIM" == "001" ]]; then
    pushd "$SCRIPT_DIR/uart_register_bridge/sim"
    python3 -u run_top_integration_bank_compact_tb.py --clean 2>&1 | tee -a "$LOG"
    popd
fi

# 002 - run_top_integration_axi_extended_tb
if [[ -z "$SIM" || "$SIM" == "002" ]]; then
    pushd "$SCRIPT_DIR/uart_register_bridge/sim"
    python3 -u run_top_integration_axi_extended_tb.py 2>&1 | tee -a "$LOG"
    popd
fi

# This one is not available (Future todo)
# # run_top_integration_axi_compact_tb
# pushd "$SCRIPT_DIR/uart_register_bridge/sim"
# python3 -u run_top_integration_axi_compact_tb.py 2>&1 | tee -a "$LOG"
# popd

# ------------------------------------------------------------------------------------------------------------------------------------------------------
# elan32_soc
# ------------------------------------------------------------------------------------------------------------------------------------------------------

# 003 - run_axi_soc_subsystem_tb
if [[ -z "$SIM" || "$SIM" == "003" ]]; then
    pushd "$SCRIPT_DIR/elan32_soc/riscv_soc_shell/sim"
    python3 -u run_axi_soc_subsystem_tb.py --clean 2>&1 | tee -a "$LOG"
    popd
fi

# 004 - run_riscv32im_isa_tb
if [[ -z "$SIM" || "$SIM" == "004" ]]; then
    pushd "$SCRIPT_DIR/elan32_soc/sim"
    python3 -u run_riscv32im_isa_tb.py --clean 2>&1 | tee -a "$LOG"
    popd
fi

# 005 - run_soc_tb
if [[ -z "$SIM" || "$SIM" == "005" ]]; then
    pushd "$SCRIPT_DIR/elan32_soc/riscv_soc_shell/c/adder"
    bash run.sh
    popd

    pushd "$SCRIPT_DIR/elan32_soc/sim"
    python3 -u run_soc_tb.py 2>&1 | tee -a "$LOG"
    popd
fi

# ------------------------------------------------------------------------------------------------------------------------------------------------------
# elan32_serial_soc
# ------------------------------------------------------------------------------------------------------------------------------------------------------

# 006 - run_axi_soc_subsystem_tb
if [[ -z "$SIM" || "$SIM" == "006" ]]; then
    pushd "$SCRIPT_DIR/elan32_serial_soc/riscv_soc_shell/sim"
    python3 -u run_axi_soc_subsystem_tb.py --clean 2>&1 | tee -a "$LOG"
    popd
fi

# 007 - run_riscv32im_isa_tb
if [[ -z "$SIM" || "$SIM" == "007" ]]; then
    pushd "$SCRIPT_DIR/elan32_serial_soc/sim"
    python3 -u run_riscv32im_isa_tb.py --clean 2>&1 | tee -a "$LOG"
    popd
fi

# 008 - run_soc_tb
if [[ -z "$SIM" || "$SIM" == "008" ]]; then
    pushd "$SCRIPT_DIR/elan32_serial_soc/riscv_soc_shell/c/adder"
    bash run.sh
    popd

    pushd "$SCRIPT_DIR/elan32_serial_soc/sim"
    python3 -u run_soc_tb.py 2>&1 | tee -a "$LOG"
    popd
fi