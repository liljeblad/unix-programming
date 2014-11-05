.section .data
output: .long 0
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
	push	732
	pop	a
	push	2684
	pop	b
L000:
	push	a
	push	b
	compNE
	jz	L001
	push	a
	push	b
	compGT
	jz	L002
	push	a
	push	b
	sub
	pop	a
	jmp	L003
L002:
	push	b
	push	a
	sub
	pop	b
L003:
	jmp	L000
L001:
	push	a
	print
	push	a
	push	b
	gcd
	print

exit:
movl $1,%eax
int $0x80
