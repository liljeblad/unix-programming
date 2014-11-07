########################### GCD
.globl gcd
gcd:
	pushl	%ebp
	movl	%esp, %ebp

	pushl	%ebx
	movl	8(%ebp), %eax
	movl	12(%ebp), %ebx

gcdif:
	cmpl	%eax, %ebx
	je		gcddone
	jl		gcdelse
	subl	%ebx, %eax
	jmp		gcdrerun
gcdelse:
	subl	%eax, %ebx
gcdrerun:
	jmp		gcdif
gcddone:
	popl	%ebx
	movl	%ebp, %esp
	popl	%ebp
	ret

########################### FACT
.globl fact
fact:
	pushl	%ebp
	movl	%esp, %ebp

	movl	8(%ebp), %ecx
	movl	$1, %eax

factif:
	cmpl	$0, %ecx
	je		factdone
	mull	%ecx
	decl	%ecx
	jmp		factif

factdone:
	movl	%ebp, %esp
	popl	%ebp
	ret

########################### LNTWO
