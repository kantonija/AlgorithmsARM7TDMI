# Sorting Algorithms Optimization on ARM7TDMI

This project contains implementations and optimizations of sorting algorithms for the ARM7TDMI architecture. The algorithms included are:

- **Bubble Sort**
- **Quick Sort**
- **Radix Sort**

---

## Table of Contents

- [Overview](#overview)  
- [Prerequisites](#prerequisites)  
- [Building the Project](#building-the-project)  
- [Running the Code](#running-the-code)  
- [Algorithms](#algorithms)  
- [Notes](#notes)

---

## Overview

This project demonstrates the implementation of common sorting algorithms in ARM assembly language optimized for the ARM7TDMI processor. The goal is to explore and optimize these algorithms at the assembly level to understand low-level performance considerations.

---

## Prerequisites

- **ARM Toolchain**: Make sure you have an ARM assembler and linker installed (e.g., `arm-none-eabi-as` and `arm-none-eabi-ld`).
- **Emulator or Hardware**: Use QEMU or real hardware with ARM7TDMI support to run the binaries.
- **Make** (optional) or manually run commands in the terminal.

---

## Building the Project

You can assemble and link each sorting algorithm source file separately or all together.

Example commands for assembling and linking a single file (`radix_sort.s`):

```bash
# Assemble
arm-none-eabi-as -mcpu=arm7tdmi -o radix_sort.o radix_sort.s

# Link
arm-none-eabi-ld -o radix_sort.elf radix_sort.o

# (Optional) Convert to binary or hex if needed
arm-none-eabi-objcopy -O binary radix_sort.elf radix_sort.bin
For all source files (bubble_sort.s, quick_sort.s, radix_sort.s), assemble and link similarly:

bash
Copy
Edit
arm-none-eabi-as -mcpu=arm7tdmi -o bubble_sort.o bubble_sort.s
arm-none-eabi-as -mcpu=arm7tdmi -o quick_sort.o quick_sort.s
arm-none-eabi-as -mcpu=arm7tdmi -o radix_sort.o radix_sort.s

arm-none-eabi-ld -o sorting_algorithms.elf bubble_sort.o quick_sort.o radix_sort.o
Running the Code
Run the generated ELF file using QEMU ARM emulator:

bash
Copy
Edit
qemu-arm sorting_algorithms.elf
Or flash and run on your ARM7TDMI-based hardware.

Algorithms
Bubble Sort
Simple comparison-based sorting, repeatedly swapping adjacent elements if they are in the wrong order.

Quick Sort
Efficient divide-and-conquer sorting that partitions the array and recursively sorts subarrays.

Radix Sort
Non-comparison-based sorting that processes digits starting from the least significant digit to the most significant.

Notes
The code is written in ARM assembly with .syntax unified for compatibility.

Stack usage and registers are managed carefully to ensure correctness.

Optimizations were focused on reducing instructions and memory usage.

Tested on QEMU ARM7TDMI emulator and real hardware.
