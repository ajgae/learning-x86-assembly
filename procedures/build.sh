if [ ! -d ./bin ]; then
    mkdir -pv ./bin
fi
nasm -g -f elf32 -o ./bin/procedures.o procedures.nasm 
ld -m elf_i386 -o ./bin/procedures ./bin/procedures.o
