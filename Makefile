CC=clang
ASMC=yasm
LD=ld
ASMFLAGS=-felf64

all:

hello_world:
	$(ASMC) $(ASMFLAGS) hello_world.asm -o hello_world.o
	$(LD) hello_world.o -o $@

fibonacci:
	$(ASMC) $(ASMFLAGS) fibonacci.asm -o fibonacci.o
	$(CC) fibonacci.o -o $@

clean:
	-rm -f hello_world hello_world.o
	-rm -f fibo fibonacci.o


.PHONY: all clean 

