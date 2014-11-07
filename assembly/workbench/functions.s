########################### GCD
.globl gcd
gcd:
	pushl	%ebp
	movl	%esp, %ebp

	pushl	%ebx
	movl	8(%ebp), %eax
	movl	12(%ebp), %ebx

if:
	cmpl	%eax, %ebx
	je		done
	jl		else
	subl	%ebx, %eax
	jmp		rerun
else:
	subl	%eax, %ebx
rerun:
	jmp		if
done:
	popl	%ebx
	movl	%ebp, %esp
	popl	%ebp
	ret

########################### FACT
.globl fact
fact:
	pushl	%ebp
	movl	%esp, %ebp

	movl	%ebp, %esp
	popl	%ebp
	ret

########################### LNTWO
