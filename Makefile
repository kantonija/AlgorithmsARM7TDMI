CC = arm-none-eabi-gcc
CFLAGS = -mcpu=arm7tdmi -O2 -lc -lrdimon
LDFLAGS = -specs=rdimon.specs -lc -lrdimon

all: main.elf

main.elf: main.o bubble_sort.o quick_sort.o radix_sort.o asm_swap.o print_array.o partition.o
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

asm_swap.o: asm_swap.s
	$(CC) $(CFLAGS) -c -o $@ $<

bubble_sort.o: bubble_sort.s
	$(CC) $(CFLAGS) -c -o $@ $<

quick_sort.o: quick_sort.s
	$(CC) -mcpu=arm7tdmi -marm -c -o $@ $<

radix_sort.o: radix_sort.s
	$(CC) -mcpu=arm7tdmi -marm -c -o $@ $<

partition.o: partition.c
	$(CC) $(CFLAGS) -c -o $@ $<

clean:
	rm -f *.o *.elf
