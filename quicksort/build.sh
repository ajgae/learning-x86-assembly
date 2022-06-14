if [ ! -d ./bin ]; then
    mkdir -pv ./bin
fi
nasm -g -f elf32 -o ./bin/quicksort.o quicksort.nasm 
ld -m elf_i386 -o ./bin/quicksort ./bin/quicksort.o
