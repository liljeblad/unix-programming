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
	pushl	$732
	popl	a
	pushl	$2684
	popl	b
L000:
	pushl	a
	pushl	b
	popl	%eax
	popl	%ebx
	cmpl	%eax, %ebx
	je	L001
	pushl	a
	pushl	b
	popl	%eax
	popl	%ebx
	cmpl	%eax, %ebx
	jle	L002
	pushl	a
	pushl	b
	popl	%eax
	popl	%ebx
	subl	%eax, %ebx
	pushl	%ebx
	popl	a
	jmp	L003
L002:
	pushl	b
	pushl	a
	popl	%eax
	popl	%ebx
	subl	%eax, %ebx
	pushl	%ebx
	popl	b
L003:
	jmp	L000
L001:
	pushl	a
	pushl	$str
	call	printf

movl $1, %eax
movl $0, %ebx
int $0x80
