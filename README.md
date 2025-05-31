# Sorting Algorithms on ARM7TDMI

This repository contains ARM assembly implementations of three classic sorting algorithms, optimized for the ARM7TDMI microcontroller:

- **Bubble Sort**  
- **Quick Sort**  
- **Radix Sort**  

These implementations are intended for educational purposes and embedded systems projects.

---

## Repository Contents

| File            | Description                      |
| --------------- | --------------------------------|
| `bubble_sort.s` | Bubble Sort implementation       |
| `quick_sort.s`  | Quick Sort implementation        |
| `radix_sort.s`  | Radix Sort implementation        |

---

## Prerequisites

- ARM7TDMI assembler and linker (e.g., `arm-none-eabi-as`, `arm-none-eabi-ld`)  
- Emulator or development board supporting ARM7TDMI (e.g., QEMU, LPC2148)

---

## Building and Running

### Assemble the source files:

```bash
arm-none-eabi-as -o bubble_sort.o bubble_sort.s
arm-none-eabi-as -o quick_sort.o quick_sort.s
arm-none-eabi-as -o radix_sort.o radix_sort.s

## Link the object files:

```bash
arm-none-eabi-ld -o bubble_sort.elf bubble_sort.o
arm-none-eabi-ld -o quick_sort.elf quick_sort.o
arm-none-eabi-ld -o radix_sort.elf radix_sort.o

## Run on QEMU ARM emulator:

```bash
qemu-arm bubble_sort.elf
qemu-arm quick_sort.elf
qemu-arm radix_sort.elf

## Cleaning build files

```bash
rm -f *.o *.elf

