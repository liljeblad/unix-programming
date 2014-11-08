.section .data
str: .asciz "%d\n"
a: .long 0
b: .long 0
c: .long 0
d: .long 0
e: .long 0
f: .long 0
g: .long 0
h: .long 0
i: .long 0
j: .long 0
k: .long 0
l: .long 0
m: .long 0
n: .long 0
o: .long 0
p: .long 0
q: .long 0
r: .long 0
s: .long 0
t: .long 0
u: .long 0
v: .long 0
w: .long 0
x: .long 0
y: .long 0
z: .long 0

.section .text
.globl _start
_start:
	pushl	$0
	call	fact
	addl	$8, %esp
	pushl	%eax
	pushl	$str
	call	printf
	pushl	$1
	call	fact
	addl	$8, %esp
	pushl	%eax
	pushl	$str
	call	printf
	pushl	$2
	call	fact
	addl	$8, %esp
	pushl	%eax
	pushl	$str
	call	printf
	pushl	$3
	call	fact
	addl	$8, %esp
	pushl	%eax
	pushl	$str
	call	printf
	pushl	$4
	call	fact
	addl	$8, %esp
	pushl	%eax
	pushl	$str
	call	printf
	pushl	$5
	call	fact
	addl	$8, %esp
	pushl	%eax
	pushl	$str
	call	printf
	pushl	$31
	call	lntwo
	addl	$8, %esp
	pushl	%eax
	pushl	$str
	call	printf
	pushl	$32
	call	lntwo
	addl	$8, %esp
	pushl	%eax
	pushl	$str
	call	printf
	pushl	$33
	call	lntwo
	addl	$8, %esp
	pushl	%eax
	pushl	$str
	call	printf
	pushl	$36
	pushl	$24
	call	gcd
	addl	$8, %esp
	pushl	%eax
	pushl	$str
	call	printf
	pushl	$732
	pushl	$2684
	call	gcd
	addl	$8, %esp
	pushl	%eax
	pushl	$str
	call	printf

movl $1, %eax
movl $0, %ebx
int $0x80
