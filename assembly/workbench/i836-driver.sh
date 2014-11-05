#! /bin/bash

INFILE=$1

EXECUTABLE_OUT_FILE=`echo $INFILE | cut -d "." -f1`
ASM_OUT_FILE=`echo "$EXECUTABLE_OUT_FILE.s"`

echo ".section .data" 	> $ASM_OUT_FILE
echo "output: .long 0" 	>> $ASM_OUT_FILE
echo "a: .long 0" 		>> $ASM_OUT_FILE
echo "b: .long 0" 		>> $ASM_OUT_FILE
echo "c: .long 0" 		>> $ASM_OUT_FILE
echo "d: .long 0" 		>> $ASM_OUT_FILE
echo "e: .long 0" 		>> $ASM_OUT_FILE
echo "f: .long 0" 		>> $ASM_OUT_FILE
echo "g: .long 0" 		>> $ASM_OUT_FILE
echo "h: .long 0" 		>> $ASM_OUT_FILE
echo "i: .long 0" 		>> $ASM_OUT_FILE
echo "j: .long 0" 		>> $ASM_OUT_FILE
echo "k: .long 0" 		>> $ASM_OUT_FILE
echo "l: .long 0" 		>> $ASM_OUT_FILE
echo "m: .long 0" 		>> $ASM_OUT_FILE
echo "n: .long 0" 		>> $ASM_OUT_FILE
echo "o: .long 0" 		>> $ASM_OUT_FILE
echo "p: .long 0" 		>> $ASM_OUT_FILE
echo "q: .long 0" 		>> $ASM_OUT_FILE
echo "r: .long 0" 		>> $ASM_OUT_FILE
echo "s: .long 0" 		>> $ASM_OUT_FILE
echo "t: .long 0" 		>> $ASM_OUT_FILE
echo "u: .long 0" 		>> $ASM_OUT_FILE
echo "v: .long 0" 		>> $ASM_OUT_FILE
echo "w: .long 0" 		>> $ASM_OUT_FILE
echo "x: .long 0" 		>> $ASM_OUT_FILE
echo "y: .long 0" 		>> $ASM_OUT_FILE
echo "z: .long 0" 		>> $ASM_OUT_FILE
echo "" 				>> $ASM_OUT_FILE

echo '.section .text' 	>> $ASM_OUT_FILE
echo '.globl _start'	>> $ASM_OUT_FILE
echo '_start:' 			>> $ASM_OUT_FILE

cat $INFILE | ./calc3i.exe >> $ASM_OUT_FILE

echo "" 					>> $ASM_OUT_FILE
echo 'exit:' 				>> $ASM_OUT_FILE
echo 'movl $1,%eax' 		>> $ASM_OUT_FILE
echo 'int $0x80' 			>> $ASM_OUT_FILE
echo ""

as $ASM_OUT_FILE	-o $EXECUTABLE_OUT_FILE.o
ld gcdFunc.o lntwoFunc.o factFunc.o $EXECUTABLE_OUT_FILE.o -o $EXECUTABLE_OUT_FILE
rm $EXECUTABLE_OUT_FILE.o
