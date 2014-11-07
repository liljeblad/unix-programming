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
	pushl	$100
	popl	i
L000:
	pushl	i
	pushl	$0
	popl	%eax
	popl	%ebx
	cmpl	%eax, %ebx
	jl		L001
	pushl	i
	pushl	$str
	call	printf
	pushl	i
	pushl	$1
	popl	%eax
	popl	%ebx
	subl	%eax, %ebx
	pushl	%ebx
	popl	i
	jmp		L000
L001:

movl $1, %eax
movl $0, %ebx
int $0x80
