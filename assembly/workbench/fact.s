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
	pushl	$1
	popl	%eax
	popl	%ebx
	subl	%eax, %ebx
	pushl	%ebx
	pushl	$str
	call	printf
	pushl	$1
	call	fact
	addl	$8, %esp
	pushl	%eax
	pushl	$1
	popl	%eax
	popl	%ebx
	subl	%eax, %ebx
	pushl	%ebx
	pushl	$str
	call	printf
	pushl	$2
	call	fact
	addl	$8, %esp
	pushl	%eax
	pushl	$2
	popl	%eax
	popl	%ebx
	subl	%eax, %ebx
	pushl	%ebx
	pushl	$str
	call	printf
	pushl	$3
	call	fact
	addl	$8, %esp
	pushl	%eax
	pushl	$6
	popl	%eax
	popl	%ebx
	subl	%eax, %ebx
	pushl	%ebx
	pushl	$str
	call	printf
	pushl	$4
	call	fact
	addl	$8, %esp
	pushl	%eax
	pushl	$24
	popl	%eax
	popl	%ebx
	subl	%eax, %ebx
	pushl	%ebx
	pushl	$str
	call	printf
	pushl	$5
	call	fact
	addl	$8, %esp
	pushl	%eax
	pushl	$120
	popl	%eax
	popl	%ebx
	subl	%eax, %ebx
	pushl	%ebx
	pushl	$str
	call	printf
	pushl	$6
	call	fact
	addl	$8, %esp
	pushl	%eax
	pushl	$720
	popl	%eax
	popl	%ebx
	subl	%eax, %ebx
	pushl	%ebx
	pushl	$str
	call	printf
	pushl	$7
	call	fact
	addl	$8, %esp
	pushl	%eax
	pushl	$5040
	popl	%eax
	popl	%ebx
	subl	%eax, %ebx
	pushl	%ebx
	pushl	$str
	call	printf
	pushl	$8
	call	fact
	addl	$8, %esp
	pushl	%eax
	pushl	$40320
	popl	%eax
	popl	%ebx
	subl	%eax, %ebx
	pushl	%ebx
	pushl	$str
	call	printf
	pushl	$9
	call	fact
	addl	$8, %esp
	pushl	%eax
	pushl	$362880
	popl	%eax
	popl	%ebx
	subl	%eax, %ebx
	pushl	%ebx
	pushl	$str
	call	printf
	pushl	$10
	call	fact
	addl	$8, %esp
	pushl	%eax
	pushl	$3628800
	popl	%eax
	popl	%ebx
	subl	%eax, %ebx
	pushl	%ebx
	pushl	$str
	call	printf
	pushl	$11
	call	fact
	addl	$8, %esp
	pushl	%eax
	pushl	$39916800
	popl	%eax
	popl	%ebx
	subl	%eax, %ebx
	pushl	%ebx
	pushl	$str
	call	printf

movl $1, %eax
movl $0, %ebx
int $0x80
