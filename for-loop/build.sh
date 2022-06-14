if [ ! -d ./bin ]; then
    mkdir -pv ./bin
fi
nasm -g -f elf32 -o ./bin/for-loop.o for-loop.nasm 
ld -m elf_i386 -o ./bin/for-loop ./bin/for-loop.o
