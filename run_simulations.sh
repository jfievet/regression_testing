#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# ------------------------------------------------------------------------------------------------------------------------------------------------------
# uart_register_bridge
# ------------------------------------------------------------------------------------------------------------------------------------------------------

# run_top_integration_bank_compact_tb
pushd "$SCRIPT_DIR/uart_register_bridge/sim"
python3 -u run_top_integration_bank_compact_tb.py --clean 2>&1 | tee "$SCRIPT_DIR/regression_sim.log"
popd

# run_top_integration_bank_compact_tb
pushd "$SCRIPT_DIR/uart_register_bridge/sim"
python3 -u run_top_integration_axi_extended_tb.py 2>&1 | tee -a "$SCRIPT_DIR/regression_sim.log"
popd

# This one is not available (Future todo)
# # run_top_integration_axi_compact_tb
# pushd "$SCRIPT_DIR/uart_register_bridge/sim"
# python3 -u run_top_integration_axi_compact_tb.py 2>&1 | tee -a "$SCRIPT_DIR/regression_sim.log"
# popd

