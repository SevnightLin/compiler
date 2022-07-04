./mind /home/sevnight/compiler_work/minidecaf/mindecaf_5/test/test.c >/home/sevnight/compiler_work/minidecaf/mindecaf_5/test/test.s
riscv64-unknown-elf-gcc -march=rv32im -mabi=ilp32 /home/sevnight/compiler_work/minidecaf/mindecaf_5/test/test.s
qemu-riscv32 a.out
echo $?