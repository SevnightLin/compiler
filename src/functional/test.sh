success=0
for i in *.sy
do if [ ! -f "./$i.out" ]
   then
     sed -i 's/\r//g' "${i%%sy*}out"
     ../mind -l 5 $i >  test.s
     echo "{$i}正在运行中...."
     riscv64-unknown-elf-gcc -march=rv32im -mabi=ilp32 test.s
     qemu-riscv32 a.out
     echo $?  > "$i.out"
     cmp -s "$i.out" "${i%%sy*}out"
     if [ "$?" -eq "1" ];then
       echo ": failed"
     else 
       echo ": OK" 
       success=$((success+1))
     fi 
    rm -rf "$i.out"
   fi
done
echo "一共100个测例，通过了$success个"
