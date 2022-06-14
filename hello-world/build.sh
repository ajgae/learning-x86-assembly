nasm -g -f elf32 -o hello-world.o hello-world.nasm 
ld -m elf_i386 -o hello-world hello-world.o
