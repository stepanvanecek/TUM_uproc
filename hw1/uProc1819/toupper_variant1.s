	.file	"toupper.c"
	.globl	debug
	.bss
	.align 4
	.type	debug, @object
	.size	debug, 4
debug:
	.zero	4
	.comm	results,8,8
	.comm	ratios,8,8
	.comm	sizes,8,8
	.globl	no_sz
	.data
	.align 4
	.type	no_sz, @object
	.size	no_sz, 4
no_sz:
	.long	1
	.globl	no_ratio
	.align 4
	.type	no_ratio, @object
	.size	no_ratio, 4
no_ratio:
	.long	1
	.globl	no_version
	.align 4
	.type	no_version, @object
	.size	no_version, 4
no_version:
	.long	1
	.section	.rodata
	.align 8
	.type	kMicro, @object
	.size	kMicro, 8
kMicro:
	.long	2696277389
	.long	1051772663
	.align 8
.LC0:
	.string	"ERROR: Bad call to gettimeofday"
	.text
	.type	gettime, @function
gettime:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-48(%rbp), %rdx
	leaq	-32(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	gettimeofday
	movl	%eax, -52(%rbp)
	cmpl	$-1, -52(%rbp)
	jne	.L2
	movl	$.LC0, %edi
	call	puts
	vmovsd	.LC1(%rip), %xmm0
	jmp	.L4
.L2:
	movq	-24(%rbp), %rax
	vxorpd	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	%rax, %xmm0, %xmm0
.L4:
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L5
	call	__stack_chk_fail
.L5:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	gettime, .-gettime
	.type	toupper_simple, @function
toupper_simple:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L7
.L9:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$96, %al
	jle	.L8
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$122, %al
	jg	.L8
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rcx
	movq	-24(%rbp), %rdx
	addq	%rcx, %rdx
	movzbl	(%rdx), %edx
	subl	$32, %edx
	movb	%dl, (%rax)
.L8:
	addl	$1, -4(%rbp)
.L7:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L9
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	toupper_simple, .-toupper_simple
	.type	toupper_optimised, @function
toupper_optimised:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	jmp	.L11
.L12:
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	movl	%eax, %ecx
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	$96, %edx
	subl	%eax, %edx
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	subl	$123, %eax
	andl	%edx, %eax
	sarl	$7, %eax
	andl	$-32, %eax
	addl	%ecx, %eax
	movl	%eax, %edx
	movq	-8(%rbp), %rax
	movb	%dl, (%rax)
	addq	$1, -8(%rbp)
.L11:
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L12
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	toupper_optimised, .-toupper_optimised
	.globl	mymalloc
	.type	mymalloc, @function
mymalloc:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	addq	$32, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	shrq	$4, %rax
	addq	$1, %rax
	salq	$4, %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	mymalloc, .-mymalloc
	.globl	createChar
	.type	createChar, @function
createChar:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	call	rand
	movl	%eax, %ecx
	movl	$1374389535, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$5, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	imull	$100, %eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	movb	%al, -2(%rbp)
	movsbl	-2(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jge	.L16
	movb	$0, -2(%rbp)
	jmp	.L17
.L16:
	movb	$1, -2(%rbp)
.L17:
	call	rand
	movl	%eax, %ecx
	movl	$1321528399, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$3, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	imull	$26, %eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	addl	$1, %eax
	movb	%al, -1(%rbp)
	movsbl	-2(%rbp), %eax
	addl	$2, %eax
	sall	$5, %eax
	movl	%eax, %edx
	movzbl	-1(%rbp), %eax
	addl	%edx, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	createChar, .-createChar
	.globl	init
	.type	init, @function
init:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	$0, -12(%rbp)
	movq	-24(%rbp), %rax
	addq	$1, %rax
	movq	%rax, %rdi
	call	mymalloc
	movq	%rax, -8(%rbp)
	movl	$1, %edi
	call	srand
	movl	$0, -12(%rbp)
	jmp	.L20
.L21:
	movl	-28(%rbp), %eax
	movl	%eax, %edi
	call	createChar
	movb	%al, -13(%rbp)
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	-8(%rbp), %rax
	addq	%rax, %rdx
	movzbl	-13(%rbp), %eax
	movb	%al, (%rdx)
	addl	$1, -12(%rbp)
.L20:
	movl	-12(%rbp), %eax
	cltq
	cmpq	-24(%rbp), %rax
	jb	.L21
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	init, .-init
	.section	.rodata
.LC2:
	.string	"Before: %.40s...\n"
.LC3:
	.string	"After:  %.40s...\n"
	.text
	.globl	run_toupper
	.type	run_toupper, @function
run_toupper:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movl	%edi, -36(%rbp)
	movl	%esi, -40(%rbp)
	movl	%edx, -44(%rbp)
	movq	%rcx, -56(%rbp)
	movq	%r8, -64(%rbp)
	movl	-40(%rbp), %eax
	movl	%eax, -28(%rbp)
	movl	no_ratio(%rip), %eax
	imull	-36(%rbp), %eax
	addl	%eax, -28(%rbp)
	movl	no_sz(%rip), %eax
	imull	-44(%rbp), %eax
	movl	%eax, %edx
	movl	no_ratio(%rip), %eax
	imull	%edx, %eax
	addl	%eax, -28(%rbp)
	movq	ratios(%rip), %rax
	movl	-40(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	vmovsd	(%rax), %xmm0
	vcvttsd2si	%xmm0, %edx
	movq	sizes(%rip), %rax
	movl	-36(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$3, %rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	init
	movq	%rax, -24(%rbp)
	movl	debug(%rip), %eax
	testl	%eax, %eax
	je	.L24
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC2, %edi
	movl	$0, %eax
	call	printf
.L24:
	call	gettime
	vmovq	%xmm0, %rax
	movq	%rax, -16(%rbp)
	movq	-24(%rbp), %rdx
	movq	-56(%rbp), %rax
	movq	%rdx, %rdi
	call	*%rax
	call	gettime
	vmovq	%xmm0, %rax
	movq	%rax, -8(%rbp)
	movq	results(%rip), %rax
	movl	-28(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	vmovsd	-8(%rbp), %xmm0
	vsubsd	-16(%rbp), %xmm0, %xmm0
	vmovsd	%xmm0, (%rax)
	movl	debug(%rip), %eax
	testl	%eax, %eax
	je	.L26
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC3, %edi
	movl	$0, %eax
	call	printf
.L26:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	run_toupper, .-run_toupper
	.globl	toupperversion
	.section	.rodata
.LC4:
	.string	"simple"
.LC5:
	.string	"optimised"
	.data
	.align 32
	.type	toupperversion, @object
	.size	toupperversion, 48
toupperversion:
	.quad	.LC4
	.quad	toupper_simple
	.quad	.LC5
	.quad	toupper_optimised
	.quad	0
	.quad	0
	.text
	.globl	run
	.type	run, @function
run:
.LFB9:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movl	%esi, -24(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L28
.L29:
	movl	-4(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	$toupperversion, %rax
	movq	(%rax), %rdi
	movl	-4(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	$toupperversion+8, %rax
	movq	(%rax), %rcx
	movl	-4(%rbp), %edx
	movl	-24(%rbp), %esi
	movl	-20(%rbp), %eax
	movq	%rdi, %r8
	movl	%eax, %edi
	call	run_toupper
	addl	$1, -4(%rbp)
.L28:
	movl	-4(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	$toupperversion+8, %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L29
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	run, .-run
	.section	.rodata
	.align 8
.LC6:
	.string	"VARIANT1: gcc -lm -march=native toupper.c -O0 "
	.align 8
.LC7:
	.string	"Size: %ld \tRatio: %f \tRunning time:"
.LC8:
	.string	"\t%s: %f"
	.text
	.globl	printresults
	.type	printresults, @function
printresults:
.LFB10:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	$.LC6, %edi
	call	puts
	movl	$0, -12(%rbp)
	jmp	.L31
.L36:
	movl	$0, -8(%rbp)
	jmp	.L32
.L35:
	movq	ratios(%rip), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movq	sizes(%rip), %rax
	movl	-12(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$3, %rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	movq	%rdx, -24(%rbp)
	vmovsd	-24(%rbp), %xmm0
	movq	%rax, %rsi
	movl	$.LC7, %edi
	movl	$1, %eax
	call	printf
	movl	$0, -16(%rbp)
	jmp	.L33
.L34:
	movl	-8(%rbp), %eax
	movl	%eax, -4(%rbp)
	movl	no_ratio(%rip), %eax
	imull	-12(%rbp), %eax
	addl	%eax, -4(%rbp)
	movl	no_sz(%rip), %eax
	imull	-16(%rbp), %eax
	movl	%eax, %edx
	movl	no_ratio(%rip), %eax
	imull	%edx, %eax
	addl	%eax, -4(%rbp)
	movq	results(%rip), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movl	-16(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	$toupperversion, %rax
	movq	(%rax), %rax
	movq	%rdx, -24(%rbp)
	vmovsd	-24(%rbp), %xmm0
	movq	%rax, %rsi
	movl	$.LC8, %edi
	movl	$1, %eax
	call	printf
	addl	$1, -16(%rbp)
.L33:
	movl	no_version(%rip), %eax
	cmpl	%eax, -16(%rbp)
	jl	.L34
	movl	$10, %edi
	call	putchar
	addl	$1, -8(%rbp)
.L32:
	movl	no_ratio(%rip), %eax
	cmpl	%eax, -8(%rbp)
	jl	.L35
	addl	$1, -12(%rbp)
.L31:
	movl	no_sz(%rip), %eax
	cmpl	%eax, -12(%rbp)
	jl	.L36
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	printresults, .-printresults
	.section	.rodata
.LC9:
	.string	"-d"
.LC10:
	.string	"-l"
.LC11:
	.string	"-r"
	.text
	.globl	main
	.type	main, @function
main:
.LFB11:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movl	%edi, -68(%rbp)
	movq	%rsi, -80(%rbp)
	movq	$800000, -24(%rbp)
	movq	$0, -16(%rbp)
	movq	$10000, -8(%rbp)
	movl	$50, -56(%rbp)
	movl	$0, -52(%rbp)
	movl	$1, -48(%rbp)
	movl	$1, -44(%rbp)
	jmp	.L38
.L49:
	movl	-44(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-80(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movl	$.LC9, %edi
	call	strcmp
	testl	%eax, %eax
	jne	.L39
	movl	$1, debug(%rip)
.L39:
	movl	-44(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-80(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movl	$.LC10, %edi
	call	strcmp
	testl	%eax, %eax
	jne	.L40
	movl	-44(%rbp), %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,8), %rdx
	movq	-80(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi
	cltq
	movq	%rax, -24(%rbp)
	movl	-44(%rbp), %eax
	addl	$2, %eax
	cmpl	-68(%rbp), %eax
	jge	.L65
	movl	-44(%rbp), %eax
	cltq
	addq	$2, %rax
	leaq	0(,%rax,8), %rdx
	movq	-80(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movl	$.LC11, %edi
	call	strcmp
	testl	%eax, %eax
	je	.L66
	movl	-44(%rbp), %eax
	cltq
	addq	$2, %rax
	leaq	0(,%rax,8), %rdx
	movq	-80(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movl	$.LC9, %edi
	call	strcmp
	testl	%eax, %eax
	je	.L67
	movl	-44(%rbp), %eax
	cltq
	addq	$2, %rax
	leaq	0(,%rax,8), %rdx
	movq	-80(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi
	cltq
	movq	%rax, -16(%rbp)
	movl	-44(%rbp), %eax
	cltq
	addq	$3, %rax
	leaq	0(,%rax,8), %rdx
	movq	-80(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi
	cltq
	movq	%rax, -8(%rbp)
.L40:
	movl	-44(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-80(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movl	$.LC11, %edi
	call	strcmp
	testl	%eax, %eax
	jne	.L45
	movl	-44(%rbp), %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,8), %rdx
	movq	-80(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi
	movl	%eax, -56(%rbp)
	movl	-44(%rbp), %eax
	addl	$2, %eax
	cmpl	-68(%rbp), %eax
	jge	.L68
	movl	-44(%rbp), %eax
	cltq
	addq	$2, %rax
	leaq	0(,%rax,8), %rdx
	movq	-80(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movl	$.LC10, %edi
	call	strcmp
	testl	%eax, %eax
	je	.L69
	movl	-44(%rbp), %eax
	cltq
	addq	$2, %rax
	leaq	0(,%rax,8), %rdx
	movq	-80(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movl	$.LC9, %edi
	call	strcmp
	testl	%eax, %eax
	je	.L70
	movl	-44(%rbp), %eax
	cltq
	addq	$2, %rax
	leaq	0(,%rax,8), %rdx
	movq	-80(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi
	movl	%eax, -52(%rbp)
	movl	-44(%rbp), %eax
	cltq
	addq	$3, %rax
	leaq	0(,%rax,8), %rdx
	movq	-80(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi
	movl	%eax, -48(%rbp)
.L45:
	addl	$1, -44(%rbp)
.L38:
	movl	-44(%rbp), %eax
	cmpl	-68(%rbp), %eax
	jl	.L49
	jmp	.L42
.L65:
	nop
	jmp	.L42
.L66:
	nop
	jmp	.L42
.L67:
	nop
	jmp	.L42
.L68:
	nop
	jmp	.L42
.L69:
	nop
	jmp	.L42
.L70:
	nop
.L42:
	movl	$0, -32(%rbp)
	jmp	.L50
.L51:
	movl	-32(%rbp), %eax
	addl	$1, %eax
	movl	%eax, no_version(%rip)
	addl	$1, -32(%rbp)
.L50:
	movl	-32(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	$toupperversion+8, %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L51
	cmpq	$0, -16(%rbp)
	jne	.L52
	movl	$1, no_sz(%rip)
	jmp	.L53
.L52:
	movq	-16(%rbp), %rax
	subq	-24(%rbp), %rax
	movl	$0, %edx
	divq	-8(%rbp)
	addl	$1, %eax
	movl	%eax, no_sz(%rip)
.L53:
	cmpl	$0, -52(%rbp)
	jne	.L54
	movl	$1, no_ratio(%rip)
	jmp	.L55
.L54:
	movl	-52(%rbp), %eax
	subl	-56(%rbp), %eax
	cltd
	idivl	-48(%rbp)
	addl	$1, %eax
	movl	%eax, no_ratio(%rip)
.L55:
	movl	no_sz(%rip), %eax
	imull	-32(%rbp), %eax
	movl	%eax, %edx
	movl	no_ratio(%rip), %eax
	imull	%edx, %eax
	movl	%eax, -28(%rbp)
	movl	-28(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, results(%rip)
	movl	no_ratio(%rip), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, ratios(%rip)
	movl	no_sz(%rip), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, sizes(%rip)
	movl	$0, -40(%rbp)
	jmp	.L56
.L57:
	movq	sizes(%rip), %rax
	movl	-40(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rax, %rdx
	movl	-40(%rbp), %eax
	cltq
	imulq	-8(%rbp), %rax
	movq	%rax, %rcx
	movq	-24(%rbp), %rax
	addq	%rcx, %rax
	movq	%rax, (%rdx)
	addl	$1, -40(%rbp)
.L56:
	movl	no_sz(%rip), %eax
	cmpl	%eax, -40(%rbp)
	jl	.L57
	movl	$0, -40(%rbp)
	jmp	.L58
.L59:
	movq	ratios(%rip), %rax
	movl	-40(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rax, %rdx
	movl	-40(%rbp), %eax
	imull	-48(%rbp), %eax
	movl	%eax, %ecx
	movl	-56(%rbp), %eax
	addl	%ecx, %eax
	vxorpd	%xmm0, %xmm0, %xmm0
	vcvtsi2sd	%eax, %xmm0, %xmm0
	vmovsd	%xmm0, (%rdx)
	addl	$1, -40(%rbp)
.L58:
	movl	no_ratio(%rip), %eax
	cmpl	%eax, -40(%rbp)
	jl	.L59
	movl	$0, -40(%rbp)
	jmp	.L60
.L63:
	movl	$0, -36(%rbp)
	jmp	.L61
.L62:
	movl	-36(%rbp), %edx
	movl	-40(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	run
	addl	$1, -36(%rbp)
.L61:
	movl	no_ratio(%rip), %eax
	cmpl	%eax, -36(%rbp)
	jl	.L62
	addl	$1, -40(%rbp)
.L60:
	movl	no_sz(%rip), %eax
	cmpl	%eax, -40(%rbp)
	jl	.L63
	movl	$0, %eax
	call	printresults
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC1:
	.long	0
	.long	-1074790400
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.10) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
