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

<img width="603" height="494" alt="image" src="https://github.com/user-attachments/assets/a19a0ba8-b38d-4033-aadb-fc79097835a4" />


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

<img width="687" height="512" alt="image" src="https://github.com/user-attachments/assets/4fec5356-0ca6-4bd5-9bc5-f42061b38d19" />

<img width="618" height="404" alt="image" src="https://github.com/user-attachments/assets/f2a7aa9f-df0a-41da-a392-b70d08ea3f88" />

<img width="629" height="428" alt="image" src="https://github.com/user-attachments/assets/0992e727-9f02-4ebb-84dc-ce942bf83a6c" />

<img width="602" height="361" alt="image" src="https://github.com/user-attachments/assets/33a18e4f-9f51-4e9c-90db-b21ffd5c381c" />

<img width="603" height="347" alt="image" src="https://github.com/user-attachments/assets/5c64da11-4afb-48b7-a3ad-f8bc3316e1de" />



## RISC-V Pipelined Architecture
A pipelined RISC-V processor improves throughput by executing different stages of multiple instructions simultaneously, typically realized as a five-stage pipeline.

## Pipeline Stages
### Instruction Fetch (IF):
Fetch instruction from memory using PC.
<img width="295" height="430" alt="image" src="https://github.com/user-attachments/assets/93d40f45-fd7f-4fdb-990c-df81224e35db" />


### Instruction Decode/Register Fetch (ID):
Decode instruction, read registers, generate control signals.
<img width="285" height="458" alt="image" src="https://github.com/user-attachments/assets/66777319-a01d-4e6a-bb79-6e818fb2584e" />


### Execute (EX):
Perform ALU operations, calculate addresses, perform branch decisions.
<img width="269" height="404" alt="image" src="https://github.com/user-attachments/assets/8113a480-6bbb-42cd-86ed-e99b01be00b3" />


### Memory Access (MEM):
Interact with data memory for load/store ops.
<img width="258" height="517" alt="image" src="https://github.com/user-attachments/assets/aa8f68ab-1c39-49de-b076-34a2622a4bdb" />


### Write-Back (WB):
Write results into destination register.
<img width="162" height="500" alt="image" src="https://github.com/user-attachments/assets/c71bc1c2-a8a0-4e34-b0eb-11c51874a9ba" />


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

<img width="639" height="388" alt="image" src="https://github.com/user-attachments/assets/9abbdfab-c7e9-453b-b132-e4271606ceca" />

<img width="646" height="404" alt="image" src="https://github.com/user-attachments/assets/4c6677e3-8185-479e-909e-bb77eb328312" />


## Verification
Directed and random testbenches check for proper instruction execution across pipeline stages, hazard resolution, and throughput.

Functional and timing simulations validate both normal and corner-case operation.

Automated coverage metrics quantify verification completeness.

<img width="1189" height="678" alt="Screenshot 2025-06-14 113506" src="https://github.com/user-attachments/assets/56c53a95-ee75-44ac-a346-e5592d465ede" />

<img width="810" height="469" alt="image" src="https://github.com/user-attachments/assets/df6e3274-854b-4ac3-a643-5ba6761289df" />


