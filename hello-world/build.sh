if [ ! -d ./bin ]; then
    mkdir -pv ./bin
fi
nasm -g -f elf32 -o ./bin/hello-world.o hello-world.nasm 
ld -m elf_i386 -o ./bin/hello-world ./bin/hello-world.o
