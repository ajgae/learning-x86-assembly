nasm -g -f elf32 -o for-loop.o for-loop.nasm 
ld -m elf_i386 -o for-loop for-loop.o
