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
