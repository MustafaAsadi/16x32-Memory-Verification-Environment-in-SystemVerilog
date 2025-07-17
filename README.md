# Memory Verification Environment

This project presents a fully self-contained active verification environment for a 16x32-bit synchronous memory module using SystemVerilog, built without UVM. The memory is modeled with synchronous write behavior and initialized with random values upon reset. The verification environment mimics UVM structure, including sequencer, driver, monitor, scoreboard, subscriber, and functional coverage.

The entire testbench is structured using SystemVerilog OOP constructs and uses virtual interfaces, stimulus generation, coverage collection, and assertion-based checking — making it a complete environment suitable for functional verification learning or portfolio demonstration.

## Key Features
16-location memory, each 32 bits wide

Synchronous write with data echo on write

Reset initializes memory to random values ($urandom)

Structured testbench with modular classes for each component

Randomized and constrained stimulus generation

Functional coverage on both input and output signals

Self-checking mechanism with assert() and scoreboard

Interface-based communication using clocking block

Compatible with ModelSim, VCS, or any SystemVerilog simulator

## Verification Environment Components
interface.sv – Defines signal access via virtual interface and clocking block

transaction.sv – Represents input stimulus and includes input coverage

sequencer.sv – Generates randomized transactions

driver.sv – Drives stimulus to the DUT

monitor.sv – Samples DUT outputs

scoreboard.sv – Checks functional correctness

subscriber.sv – Collects output coverage

env.sv – Connects and runs the environment

test_top.sv – Top-level module with DUT instantiation and environment setup

## Functional Coverage
  Input Enable, Address, and Data_in conditions

  Output Valid and Data_out value range bins

  Randomization-based sampling for robust coverage measurement

## Testbench Flow
Reset the DUT and initialize signals

Randomized generation of transactions

Drive inputs to the DUT via driver

Sample outputs using monitor

Check correctness using scoreboard assertions

Sample outputs for coverage using subscriber

Print final coverage summary

## Example Output Snippet

- [SEQUENCE] EN = 1 | address = 0A | Data_in = A55A_FF01
- [MONITOR] Data_out = A55A_FF01 | Valid_out = 1
- [SCOREBOARD]: Data_in = A55A_FF01 | Data_out = A55A_FF01 | Valid_out = 1
- [INFO] Packet #1000 has been initialized successfully
- [COVERAGE]: Total Coverege is 75/100

## Result
  Full functional correctness confirmed with assertions

  90%+ functional coverage achieved across randomized scenarios

  Modular testbench suitable for extension or reuse in other projects

