########################### GCD
.globl gcd
gcd:
	pushl	%ebp
	movl	%esp, %ebp
	movl	%ebx, -12(%ebp)		#Save %ebx
	movl	8(%ebp), %eax		#Get arguments
	movl	12(%ebp), %ebx

gcdif:
	cmpl	%eax, %ebx
	je		gcddone
	jl		gcdelse
	subl	%eax, %ebx
	jmp		gcdrerun

gcdelse:
	subl	%ebx, %eax

gcdrerun:
	jmp		gcdif

gcddone:
	movl	-12(%ebp), %ebx		#Restore %ebx
	movl	%ebp, %esp
	popl	%ebp
	ret

########################### FACT
.globl fact
fact:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %ecx		#Get argument

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
.globl lntwo
lntwo:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %ecx		#Get argument

	bsr		%ecx, %eax

	movl	%ebp, %esp
	popl	%ebp
	ret
