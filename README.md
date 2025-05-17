# SystemVerilog Memory Read/Write Functional Coverage Testbench

This project demonstrates a functional coverage testbench in **SystemVerilog** for a simple **memory read/write design**. The goal is to test all combinations of write and read operations and collect **functional coverage** using SystemVerilog constructs.

---

## 🧠 Project Overview

The testbench is designed around the following components:

- **DUT (`memory`)** – A simple register-based memory supporting read/write operations.
- **Interface (`interface.sv`)** – Declares signals used between DUT and testbench.
- **Transaction (`tx.sv`)** – Defines a class to encapsulate read/write operations.
- **Generator (`generator.sv`)** – Creates transactions based on testcases.
- **BFM (`bfm.sv`)** – Drives the DUT using transactions.
- **Monitor (`monitor.sv`)** – Monitors DUT output and calculates coverage.
- **Coverage (`coverage.sv`)** – Defines a covergroup to check write/read combinations.
- **Environment (`env.sv`)** – Integrates generator, BFM, monitor, and coverage.
- **Top (`top.sv`)** – Top-level module that connects everything and runs the simulation.

---

## 🚀 How to Run

### 1. Clone the Repository

```bash
git clone https://github.com/your-username/memory-coverage-sv.git
cd memory-coverage-sv

🧪 Sample Console Output:

*****TOP*****
environment
*****agent*****
Generator
GENERATOR WRITE OPERATION
addr=f8
data=cbd5
wr_rd=WRITE
GENERATOR READ OPERATION
addr=f8
data=0000
wr_rd=READ

BFM
driving transaction in bfm from gen

*****monitor*****
coverage
getting transactions
addr=f8
data=cbd5
wr_rd=WRITE

MON_WR
addr=f8
data=cbd5
wr_rd=WRITE

Coverage = 16.67%
COV_WR
addr=f8
data=cbd5
wr_rd=WRITE

getting transactions
addr=f8
data=0000
wr_rd=READ

🧠 Interpretation of Output:
The generator created two transactions:

A write to address f8 with data cbd5

A read from the same address f8

The monitor logged both transactions and passed them to the coverage collector.

Functional Coverage reached 16.67%, indicating one WR_RD pair was captured for a certain address range.

Observation: The read returned data 0000 instead of the expected cbd5. This suggests a potential issue in:

Memory write timing

Read-before-write synchronization

pready_o or penable_i handshaking logic

✅ This shows the testbench is functional and logging correctly, but the memory design might need timing adjustments or latching logic refinement.

📁 Output Files
After simulation, a ZIP file is generated which includes:

simulation_output.txt: Custom output log (if enabled using $fdisplay)

qrun.log: Complete simulation log

Source files used in the testbench

Waveform and compiled data files (optional)

📊 Coverage Summary
✅ Coverage is collected using cross-coverage between address range and read/write type.

For TEST_1_WR_1_RD, only one write-read operation was performed.

Running more testcases or randomized operations will help achieve 100% functional coverage.


