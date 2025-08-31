# Design-and-verification-of-RISC-V-Single-Core-and-Pipeline-Architecture-

This repository contains Verilog HDL source code and verification infrastructure for a 32-bit RISC-V processor implemented in both single-cycle and five-stage pipeline architectures. It documents the design, simulation, synthesis, and validation of both architectures. Modules include program counter, register file, ALU, hazard detection units, and more. The verification suite features comprehensive testbenches, coverage analysis, and simulation logs.

## Features
- Single-cycle and pipelined RISC-V cores
- Hazard detection and forwarding for pipeline
- Automated verification testbenches
- Scripts for simulation and synthesis
- Waveform and report archives

## Key Components
### Program Counter (PC): 
Holds current instruction address, increments (PC+4) each cycle unless branch/jump dictates otherwise.

### Instruction Memory: 
Stores instructions; PC fetches current command.

### Control Unit:
Decodes instruction (opcode, funct fields) and generates control signals for ALU, memory, and branching.

### Register File:
32 general-purpose registers (x0-x31), supports simultaneous read/write according to RISC-V convention.

### ALU (Arithmetic Logic Unit):
Executes arithmetic, logic, and branch operations based on control signals (ADD, SUB, AND, OR, comparisons).

### Data Memory:
Used for load/store data operations.

### Immediate Extender:
Produces 32-bit signed immediate values for relevant instructions.

### Multiplexers:
Select data sources based on instruction type (register, immediate, memory).

### Adder:
Calculates PC+4 or target address for jumps/branches.

### Clock and Reset: 
Synchronizes and initializes processor.

## Data Path and Control
### All instruction stages (fetch, decode, execute, memory access, write-back) occur in a single clock cycle.

Control signals determine instruction execution flow—select ALU ops, memory actions, and register updates.

Immediate values and data forwarding are managed combinationally.

Branches/jumps update PC using ALU-generated zero flag and control logic.

## Verification
### Simulation (Vivado/ModelSim):
Verifies arithmetic, logical, load/store, branch instructions.

Testbenches simulate full instruction execution to confirm correctness.

Waveform analyses ensure proper signal transitions at every cycle.

## RISC-V Pipelined Architecture
A pipelined RISC-V processor improves throughput by executing different stages of multiple instructions simultaneously, typically realized as a five-stage pipeline.

## Pipeline Stages
### Instruction Fetch (IF):
Fetch instruction from memory using PC.

### Instruction Decode/Register Fetch (ID):
Decode instruction, read registers, generate control signals.

### Execute (EX):
Perform ALU operations, calculate addresses, perform branch decisions.

### Memory Access (MEM):
Interact with data memory for load/store ops.

### Write-Back (WB):
Write results into destination register.

## Additional Components
### Pipeline Registers:
Store intermediate stage outputs (IF/ID, ID/EX, EX/MEM, MEM/WB).

### Hazard Detection Unit:
Identifies and resolves data/control hazards via forwarding, stalling, or pipeline flushing.

### Forwarding Unit:
Routes results directly from later stages to earlier ones as necessary.

### Branch Prediction Logic:
Enhances pipeline efficiency by minimizing control stall penalties.

### Data Path and Control
Each instruction progresses through the five pipeline stages, improving throughput but introducing hazards.

Hazard units and forwarding logic maintain data consistency and resolve dependencies.

## Verification
Directed and random testbenches check for proper instruction execution across pipeline stages, hazard resolution, and throughput.

Functional and timing simulations validate both normal and corner-case operation.

Automated coverage metrics quantify verification completeness.

