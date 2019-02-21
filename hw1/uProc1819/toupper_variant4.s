	.file	"toupper.c"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB0:
	.text
.LHOTB0:
	.p2align 4,,15
	.type	toupper_simple, @function
toupper_simple:
.LFB61:
	.cfi_startproc
	jmp	.L9
	.p2align 4,,10
	.p2align 3
.L6:
	leal	-97(%rax), %edx
	cmpb	$25, %dl
	ja	.L3
	subl	$32, %eax
	movb	%al, (%rdi)
.L3:
	addq	$1, %rdi
.L9:
	movzbl	(%rdi), %eax
	testb	%al, %al
	jne	.L6
	rep ret
	.cfi_endproc
.LFE61:
	.size	toupper_simple, .-toupper_simple
	.section	.text.unlikely
.LCOLDE0:
	.text
.LHOTE0:
	.section	.text.unlikely
.LCOLDB1:
	.text
.LHOTB1:
	.p2align 4,,15
	.type	toupper_optimised, @function
toupper_optimised:
.LFB62:
	.cfi_startproc
	movzbl	(%rdi), %edx
	movl	$96, %esi
	testb	%dl, %dl
	je	.L17
	.p2align 4,,10
	.p2align 3
.L15:
	movsbl	%dl, %eax
	movl	%esi, %ecx
	addq	$1, %rdi
	subl	%eax, %ecx
	subl	$123, %eax
	andl	%ecx, %eax
	sarl	$7, %eax
	andl	$-32, %eax
	addl	%edx, %eax
	movb	%al, -1(%rdi)
	movzbl	(%rdi), %edx
	testb	%dl, %dl
	jne	.L15
.L17:
	rep ret
	.cfi_endproc
.LFE62:
	.size	toupper_optimised, .-toupper_optimised
	.section	.text.unlikely
.LCOLDE1:
	.text
.LHOTE1:
	.section	.text.unlikely
.LCOLDB2:
	.text
.LHOTB2:
	.p2align 4,,15
	.globl	mymalloc
	.type	mymalloc, @function
mymalloc:
.LFB63:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	addq	$32, %rdi
	call	malloc
	andq	$-16, %rax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	addq	$16, %rax
	ret
	.cfi_endproc
.LFE63:
	.size	mymalloc, .-mymalloc
	.section	.text.unlikely
.LCOLDE2:
	.text
.LHOTE2:
	.section	.text.unlikely
.LCOLDB3:
	.text
.LHOTB3:
	.p2align 4,,15
	.globl	createChar
	.type	createChar, @function
createChar:
.LFB64:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	%edi, %ebx
	call	rand
	movl	$1374389535, %edx
	movl	%eax, %ecx
	imull	%edx
	movl	%ecx, %eax
	sarl	$31, %eax
	sarl	$5, %edx
	subl	%eax, %edx
	imull	$100, %edx, %edx
	subl	%edx, %ecx
	cmpl	%ebx, %ecx
	setge	%bl
	call	rand
	movl	$1321528399, %edx
	movl	%eax, %ecx
	movzbl	%bl, %ebx
	imull	%edx
	movl	%ecx, %eax
	sarl	$31, %eax
	sarl	$3, %edx
	subl	%eax, %edx
	leal	2(%rbx), %eax
	imull	$26, %edx, %edx
	movl	%eax, %ebx
	sall	$5, %ebx
	subl	%edx, %ecx
	leal	1(%rbx,%rcx), %eax
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE64:
	.size	createChar, .-createChar
	.section	.text.unlikely
.LCOLDE3:
	.text
.LHOTE3:
	.section	.text.unlikely
.LCOLDB4:
	.text
.LHOTB4:
	.p2align 4,,15
	.globl	init
	.type	init, @function
init:
.LFB65:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdi, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	addq	$33, %rdi
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%esi, %ebp
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	call	malloc
	andq	$-16, %rax
	movl	$1, %edi
	addq	$16, %rax
	movq	%rax, %rbx
	movq	%rax, 8(%rsp)
	call	srand
	testq	%r14, %r14
	je	.L25
	leaq	(%r14,%rbx), %r13
	movq	%rbx, %r15
	movl	$1374389535, %r12d
	.p2align 4,,10
	.p2align 3
.L24:
	call	rand
	movl	%eax, %esi
	imull	%r12d
	movl	%esi, %eax
	sarl	$31, %eax
	sarl	$5, %edx
	subl	%eax, %edx
	imull	$100, %edx, %edx
	subl	%edx, %esi
	cmpl	%esi, %ebp
	setle	%bl
	addq	$1, %r15
	call	rand
	movl	$1321528399, %edx
	movl	%eax, %esi
	movzbl	%bl, %ebx
	imull	%edx
	movl	%esi, %eax
	addl	$2, %ebx
	sarl	$31, %eax
	sall	$5, %ebx
	sarl	$3, %edx
	subl	%eax, %edx
	imull	$26, %edx, %edx
	subl	%edx, %esi
	leal	1(%rbx,%rsi), %eax
	movb	%al, -1(%r15)
	cmpq	%r15, %r13
	jne	.L24
.L23:
	movq	8(%rsp), %rax
	movb	$0, (%rax,%r14)
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L25:
	.cfi_restore_state
	xorl	%r14d, %r14d
	jmp	.L23
	.cfi_endproc
.LFE65:
	.size	init, .-init
	.section	.text.unlikely
.LCOLDE4:
	.text
.LHOTE4:
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC6:
	.string	"Before: %.40s...\n"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC7:
	.string	"ERROR: Bad call to gettimeofday"
	.section	.rodata.str1.1
.LC8:
	.string	"After:  %.40s...\n"
	.section	.text.unlikely
.LCOLDB9:
	.text
.LHOTB9:
	.p2align 4,,15
	.globl	run_toupper
	.type	run_toupper, @function
run_toupper:
.LFB66:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$88, %rsp
	.cfi_def_cfa_offset 144
	imull	no_sz(%rip), %edx
	movq	%fs:40, %rax
	movq	%rax, 72(%rsp)
	xorl	%eax, %eax
	movl	no_ratio(%rip), %eax
	movq	%rcx, 16(%rsp)
	movl	%eax, %ecx
	imull	%edi, %ecx
	movslq	%edi, %rdi
	imull	%edx, %eax
	addl	%esi, %ecx
	movslq	%esi, %rsi
	addl	%ecx, %eax
	movl	%eax, 12(%rsp)
	movq	ratios(%rip), %rax
	vcvttsd2si	(%rax,%rsi,8), %ebp
	movq	sizes(%rip), %rax
	movq	(%rax,%rdi,8), %r15
	leaq	33(%r15), %rdi
	call	malloc
	andq	$-16, %rax
	movl	$1, %edi
	addq	$16, %rax
	movq	%rax, %rbx
	movq	%rax, (%rsp)
	call	srand
	testq	%r15, %r15
	je	.L29
	leaq	(%r15,%rbx), %r13
	movq	%rbx, %r14
	movl	$1374389535, %r12d
	.p2align 4,,10
	.p2align 3
.L30:
	call	rand
	movl	%eax, %esi
	imull	%r12d
	movl	%esi, %eax
	sarl	$31, %eax
	sarl	$5, %edx
	subl	%eax, %edx
	imull	$100, %edx, %edx
	subl	%edx, %esi
	cmpl	%esi, %ebp
	setle	%bl
	addq	$1, %r14
	call	rand
	movl	$1321528399, %edx
	movl	%eax, %esi
	movzbl	%bl, %ebx
	imull	%edx
	movl	%esi, %eax
	addl	$2, %ebx
	sarl	$31, %eax
	sall	$5, %ebx
	sarl	$3, %edx
	subl	%eax, %edx
	imull	$26, %edx, %edx
	subl	%edx, %esi
	leal	1(%rbx,%rsi), %eax
	movb	%al, -1(%r14)
	cmpq	%r14, %r13
	jne	.L30
.L29:
	movq	(%rsp), %rax
	movb	$0, (%rax,%r15)
	movl	debug(%rip), %edx
	testl	%edx, %edx
	jne	.L44
.L31:
	leaq	32(%rsp), %rsi
	leaq	48(%rsp), %rdi
	call	gettimeofday
	cmpl	$-1, %eax
	je	.L45
	vxorpd	%xmm2, %xmm2, %xmm2
	vcvtsi2sdq	56(%rsp), %xmm2, %xmm2
	vmovsd	%xmm2, 24(%rsp)
.L33:
	movq	(%rsp), %rdi
	movq	16(%rsp), %rax
	call	*%rax
	leaq	32(%rsp), %rsi
	leaq	48(%rsp), %rdi
	call	gettimeofday
	cmpl	$-1, %eax
	je	.L46
	vxorpd	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	56(%rsp), %xmm0, %xmm0
.L35:
	vsubsd	24(%rsp), %xmm0, %xmm0
	movslq	12(%rsp), %rax
	movq	results(%rip), %rdx
	vmovsd	%xmm0, (%rdx,%rax,8)
	movl	debug(%rip), %eax
	testl	%eax, %eax
	je	.L28
	movq	(%rsp), %rdx
	movl	$.LC8, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
.L28:
	movq	72(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L47
	addq	$88, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L44:
	.cfi_restore_state
	movq	%rax, %rdx
	movl	$.LC6, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
	jmp	.L31
.L46:
	movl	$.LC7, %edi
	call	puts
	vmovsd	.LC5(%rip), %xmm0
	jmp	.L35
.L45:
	movl	$.LC7, %edi
	call	puts
	vmovsd	.LC5(%rip), %xmm3
	vmovsd	%xmm3, 24(%rsp)
	jmp	.L33
.L47:
	call	__stack_chk_fail
	.cfi_endproc
.LFE66:
	.size	run_toupper, .-run_toupper
	.section	.text.unlikely
.LCOLDE9:
	.text
.LHOTE9:
	.section	.text.unlikely
.LCOLDB10:
	.text
.LHOTB10:
	.p2align 4,,15
	.globl	run
	.type	run, @function
run:
.LFB67:
	.cfi_startproc
	movq	toupperversion+8(%rip), %rcx
	testq	%rcx, %rcx
	je	.L57
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movl	%edi, %r13d
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movl	%esi, %r12d
	movl	$toupperversion, %ebx
	xorl	%ebp, %ebp
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
.L52:
	movq	(%rbx), %r8
	movl	%ebp, %edx
	addq	$16, %rbx
	movl	%r12d, %esi
	movl	%r13d, %edi
	addl	$1, %ebp
	call	run_toupper
	movq	8(%rbx), %rcx
	testq	%rcx, %rcx
	jne	.L52
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_restore 12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_restore 13
	.cfi_def_cfa_offset 8
.L57:
	rep ret
	.cfi_endproc
.LFE67:
	.size	run, .-run
	.section	.text.unlikely
.LCOLDE10:
	.text
.LHOTE10:
	.section	.rodata.str1.8
	.align 8
.LC11:
	.string	"VARIANT4: gcc -lm -march=native toupper.c -O3"
	.align 8
.LC12:
	.string	"Size: %ld \tRatio: %f \tRunning time:"
	.section	.rodata.str1.1
.LC13:
	.string	"\t%s: %f"
	.section	.text.unlikely
.LCOLDB14:
	.text
.LHOTB14:
	.p2align 4,,15
	.globl	printresults
	.type	printresults, @function
printresults:
.LFB68:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	$.LC11, %edi
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	call	puts
	movl	no_sz(%rip), %edx
	testl	%edx, %edx
	jle	.L73
	movl	no_ratio(%rip), %eax
	xorl	%r13d, %r13d
	xorl	%ebp, %ebp
	.p2align 4,,10
	.p2align 3
.L60:
	xorl	%r12d, %r12d
	xorl	%ebx, %ebx
	testl	%eax, %eax
	jle	.L66
	.p2align 4,,10
	.p2align 3
.L68:
	movq	ratios(%rip), %rax
	movl	$.LC12, %esi
	movl	$1, %edi
	xorl	%r14d, %r14d
	movl	$toupperversion, %r15d
	vmovsd	(%rax,%r12), %xmm0
	movq	sizes(%rip), %rax
	movq	(%rax,%r13), %rdx
	movl	$1, %eax
	call	__printf_chk
	movl	no_version(%rip), %eax
	testl	%eax, %eax
	jle	.L65
.L69:
	movl	no_sz(%rip), %ecx
	movl	no_ratio(%rip), %eax
	movl	$.LC13, %esi
	movl	$1, %edi
	addq	$16, %r15
	imull	%r14d, %ecx
	movl	%eax, %edx
	addl	$1, %r14d
	imull	%ebp, %edx
	imull	%ecx, %eax
	addl	%ebx, %edx
	addl	%edx, %eax
	movq	results(%rip), %rdx
	cltq
	vmovsd	(%rdx,%rax,8), %xmm0
	movq	-16(%r15), %rdx
	movl	$1, %eax
	call	__printf_chk
	cmpl	%r14d, no_version(%rip)
	jg	.L69
.L65:
	movl	$10, %edi
	addl	$1, %ebx
	addq	$8, %r12
	call	putchar
	movl	no_ratio(%rip), %eax
	cmpl	%ebx, %eax
	jg	.L68
	movl	no_sz(%rip), %edx
.L66:
	addl	$1, %ebp
	addq	$8, %r13
	cmpl	%edx, %ebp
	jl	.L60
.L73:
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE68:
	.size	printresults, .-printresults
	.section	.text.unlikely
.LCOLDE14:
	.text
.LHOTE14:
	.section	.text.unlikely
.LCOLDB17:
	.section	.text.startup,"ax",@progbits
.LHOTB17:
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB69:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	pushq	-8(%r10)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	pushq	%rbx
	addq	$-128, %rsp
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	cmpl	$1, %edi
	jle	.L77
	leaq	8(%rsi), %r12
	movl	$3, %ebx
	movl	$10000, %r9d
	movl	%ebx, %eax
	movl	$800000, %r8d
	movl	%edi, %r15d
	movq	%r12, %rbx
	leal	2(%rdi), %r13d
	movl	$1, -104(%rbp)
	movl	$0, -124(%rbp)
	movl	$50, %r14d
	movq	$0, -136(%rbp)
	movq	%r8, -112(%rbp)
	movq	%r9, -120(%rbp)
	movl	%eax, %r12d
	jmp	.L86
.L84:
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol
	movq	24(%rbx), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	movl	%eax, -124(%rbp)
	call	strtol
	movl	%eax, -104(%rbp)
.L78:
	addl	$1, %r12d
	addq	$8, %rbx
	cmpl	%r13d, %r12d
	je	.L182
.L86:
	movq	(%rbx), %rax
	cmpb	$45, (%rax)
	jne	.L78
	cmpb	$100, 1(%rax)
	jne	.L79
	cmpb	$0, 2(%rax)
	jne	.L80
	movl	$1, debug(%rip)
	cmpb	$45, (%rax)
	jne	.L78
.L79:
	cmpb	$108, 1(%rax)
	jne	.L80
	cmpb	$0, 2(%rax)
	jne	.L80
	movq	8(%rbx), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	call	strtol
	cmpl	%r12d, %r15d
	cltq
	movq	%rax, -112(%rbp)
	jle	.L182
	movq	16(%rbx), %rdi
	cmpb	$45, (%rdi)
	jne	.L82
	movzbl	1(%rdi), %eax
	cmpb	$114, %al
	je	.L189
	cmpb	$100, %al
	jne	.L82
.L189:
	cmpb	$0, 2(%rdi)
	je	.L182
.L82:
	xorl	%esi, %esi
	movl	$10, %edx
	call	strtol
	movq	24(%rbx), %rdi
	cltq
	xorl	%esi, %esi
	movl	$10, %edx
	movq	%rax, -136(%rbp)
	call	strtol
	cltq
	movq	%rax, -120(%rbp)
	movq	(%rbx), %rax
	cmpb	$45, (%rax)
	jne	.L78
.L80:
	cmpb	$114, 1(%rax)
	jne	.L78
	cmpb	$0, 2(%rax)
	jne	.L78
	movq	8(%rbx), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	call	strtol
	cmpl	%r12d, %r15d
	movl	%eax, %r14d
	jle	.L182
	movq	16(%rbx), %rdi
	cmpb	$45, (%rdi)
	jne	.L84
	movzbl	1(%rdi), %eax
	cmpb	$108, %al
	je	.L191
	cmpb	$100, %al
	jne	.L84
.L191:
	cmpb	$0, 2(%rdi)
	jne	.L84
.L182:
	xorl	%esi, %esi
	cmpq	$0, toupperversion+8(%rip)
	movq	-112(%rbp), %r8
	movq	-120(%rbp), %r9
	je	.L87
.L126:
	cmpq	$1, toupperversion+24(%rip)
	sbbl	%esi, %esi
	addl	$2, %esi
	movl	%esi, no_version(%rip)
.L87:
	movq	-136(%rbp), %rax
	testq	%rax, %rax
	je	.L137
	subq	%r8, %rax
	xorl	%edx, %edx
	divq	%r9
	leal	1(%rax), %r13d
	movslq	%r13d, %r15
	salq	$3, %r15
.L89:
	movl	-124(%rbp), %eax
	movl	%r13d, no_sz(%rip)
	testl	%eax, %eax
	je	.L90
	subl	%r14d, %eax
	cltd
	idivl	-104(%rbp)
	leal	1(%rax), %ebx
	movslq	%ebx, %r12
	salq	$3, %r12
.L129:
	imull	%r13d, %esi
	movq	%r9, -120(%rbp)
	movq	%r8, -112(%rbp)
	movl	%ebx, no_ratio(%rip)
	movl	%esi, %edi
	imull	%ebx, %edi
	movslq	%edi, %rdi
	salq	$3, %rdi
	call	malloc
	movq	%r12, %rdi
	movq	%rax, results(%rip)
	call	malloc
	movq	%r15, %rdi
	movq	%rax, %r12
	movq	%rax, ratios(%rip)
	call	malloc
	testl	%r13d, %r13d
	movq	%rax, sizes(%rip)
	movq	-112(%rbp), %r8
	movq	-120(%rbp), %r9
	jle	.L192
.L130:
	movq	%rax, %rsi
	andl	$31, %esi
	shrq	$3, %rsi
	negq	%rsi
	andl	$3, %esi
	cmpl	%r13d, %esi
	cmova	%r13d, %esi
	cmpl	$9, %r13d
	jg	.L197
	movl	%r13d, %esi
.L92:
	cmpl	$1, %esi
	movq	%r8, (%rax)
	je	.L140
	leaq	(%r8,%r9), %rdx
	cmpl	$2, %esi
	movq	%rdx, 8(%rax)
	je	.L141
	leaq	(%r9,%r9), %rdx
	cmpl	$3, %esi
	leaq	(%rdx,%r8), %rdi
	movq	%rdi, 16(%rax)
	je	.L142
	addq	%r9, %rdx
	cmpl	$4, %esi
	leaq	(%rdx,%r8), %rdi
	movq	%rdi, 24(%rax)
	je	.L143
	addq	%r9, %rdx
	cmpl	$5, %esi
	leaq	(%rdx,%r8), %rdi
	movq	%rdi, 32(%rax)
	je	.L144
	addq	%r9, %rdx
	cmpl	$6, %esi
	leaq	(%rdx,%r8), %rdi
	movq	%rdi, 40(%rax)
	je	.L145
	addq	%r9, %rdx
	cmpl	$7, %esi
	leaq	(%rdx,%r8), %rdi
	movq	%rdi, 48(%rax)
	je	.L146
	addq	%r9, %rdx
	cmpl	$9, %esi
	leaq	(%rdx,%r8), %rdi
	movq	%rdi, 56(%rax)
	jne	.L147
	addq	%r9, %rdx
	addq	%r8, %rdx
	movq	%rdx, 64(%rax)
	movl	$9, %edx
.L94:
	cmpl	%esi, %r13d
	je	.L95
.L93:
	movl	%r13d, %r10d
	leal	-1(%r13), %ecx
	movl	%esi, %r15d
	subl	%esi, %r10d
	leal	-8(%r10), %edi
	subl	%esi, %ecx
	shrl	$3, %edi
	addl	$1, %edi
	cmpl	$6, %ecx
	leal	0(,%rdi,8), %r11d
	jbe	.L96
	movl	%edx, -112(%rbp)
	vmovdqa	.LC16(%rip), %ymm3
	leaq	(%rax,%r15,8), %rsi
	vpbroadcastd	-112(%rbp), %ymm4
	movq	%r9, -112(%rbp)
	xorl	%r15d, %r15d
	vpbroadcastq	-112(%rbp), %ymm5
	movq	%r8, -112(%rbp)
	vpbroadcastq	-112(%rbp), %ymm7
	vpaddd	.LC15(%rip), %ymm4, %ymm4
	vpsrlq	$32, %ymm5, %ymm6
.L97:
	vpmovsxdq	%xmm4, %ymm2
	addl	$1, %r15d
	addq	$64, %rsi
	vpmuludq	%ymm5, %ymm2, %ymm1
	vpsrlq	$32, %ymm2, %ymm0
	vpmuludq	%ymm2, %ymm6, %ymm2
	vpmuludq	%ymm5, %ymm0, %ymm0
	vpaddq	%ymm2, %ymm0, %ymm0
	vextracti128	$0x1, %ymm4, %xmm2
	vpsllq	$32, %ymm0, %ymm0
	vpaddq	%ymm0, %ymm1, %ymm0
	vpaddq	%ymm7, %ymm0, %ymm0
	vmovdqa	%ymm0, -64(%rsi)
	vpaddd	%ymm3, %ymm4, %ymm4
	vpmovsxdq	%xmm2, %ymm2
	vpmuludq	%ymm5, %ymm2, %ymm1
	vpsrlq	$32, %ymm2, %ymm0
	vpmuludq	%ymm2, %ymm6, %ymm2
	vpmuludq	%ymm5, %ymm0, %ymm0
	vpaddq	%ymm2, %ymm0, %ymm0
	vpsllq	$32, %ymm0, %ymm0
	vpaddq	%ymm0, %ymm1, %ymm0
	vpaddq	%ymm7, %ymm0, %ymm0
	vmovdqa	%ymm0, -32(%rsi)
	cmpl	%r15d, %edi
	ja	.L97
	addl	%r11d, %edx
	cmpl	%r10d, %r11d
	je	.L95
.L96:
	movslq	%edx, %rdi
	movq	%r9, %rsi
	imulq	%rdi, %rsi
	leaq	(%r8,%rsi), %r10
	movq	%r10, (%rax,%rdi,8)
	leal	1(%rdx), %edi
	cmpl	%edi, %r13d
	jle	.L95
	addq	%r9, %rsi
	movslq	%edi, %rdi
	leaq	(%rsi,%r8), %r10
	movq	%r10, (%rax,%rdi,8)
	leal	2(%rdx), %edi
	cmpl	%edi, %r13d
	jle	.L95
	addq	%r9, %rsi
	movslq	%edi, %rdi
	leaq	(%rsi,%r8), %r10
	movq	%r10, (%rax,%rdi,8)
	leal	3(%rdx), %edi
	cmpl	%edi, %r13d
	jle	.L95
	addq	%r9, %rsi
	movslq	%edi, %rdi
	leaq	(%rsi,%r8), %r10
	movq	%r10, (%rax,%rdi,8)
	leal	4(%rdx), %edi
	cmpl	%edi, %r13d
	jle	.L95
	addq	%r9, %rsi
	movslq	%edi, %rdi
	leaq	(%r8,%rsi), %r10
	movq	%r10, (%rax,%rdi,8)
	leal	5(%rdx), %edi
	cmpl	%edi, %r13d
	jle	.L95
	addq	%r9, %rsi
	addl	$6, %edx
	movslq	%edi, %rdi
	leaq	(%r8,%rsi), %r10
	cmpl	%edx, %r13d
	movq	%r10, (%rax,%rdi,8)
	jle	.L95
	addq	%r9, %rsi
	movslq	%edx, %rdx
	addq	%rsi, %r8
	movq	%r8, (%rax,%rdx,8)
.L95:
	testl	%ebx, %ebx
	jle	.L110
.L128:
	testl	%ebx, %ebx
	movl	$1, %esi
	movq	%r12, %rdx
	cmovg	%ebx, %esi
	andl	$31, %edx
	shrq	$3, %rdx
	negq	%rdx
	andl	$3, %edx
	cmpl	%esi, %edx
	cmova	%esi, %edx
	cmpl	$9, %esi
	jg	.L198
	movl	%esi, %edx
.L101:
	vxorpd	%xmm0, %xmm0, %xmm0
	cmpl	$1, %edx
	vcvtsi2sd	%r14d, %xmm0, %xmm0
	vmovsd	%xmm0, (%r12)
	je	.L150
	movl	-104(%rbp), %ecx
	vxorpd	%xmm0, %xmm0, %xmm0
	movl	%ecx, %eax
	addl	%r14d, %eax
	cmpl	$2, %edx
	vcvtsi2sd	%eax, %xmm0, %xmm0
	vmovsd	%xmm0, 8(%r12)
	je	.L151
	movl	%ecx, %eax
	vxorpd	%xmm0, %xmm0, %xmm0
	addl	%eax, %eax
	cmpl	$3, %edx
	leal	(%rax,%r14), %edi
	vcvtsi2sd	%edi, %xmm0, %xmm0
	vmovsd	%xmm0, 16(%r12)
	je	.L152
	addl	%ecx, %eax
	vxorpd	%xmm0, %xmm0, %xmm0
	leal	(%rax,%r14), %edi
	cmpl	$4, %edx
	vcvtsi2sd	%edi, %xmm0, %xmm0
	vmovsd	%xmm0, 24(%r12)
	je	.L153
	addl	%ecx, %eax
	vxorpd	%xmm0, %xmm0, %xmm0
	leal	(%rax,%r14), %edi
	cmpl	$5, %edx
	vcvtsi2sd	%edi, %xmm0, %xmm0
	vmovsd	%xmm0, 32(%r12)
	je	.L154
	addl	%ecx, %eax
	vxorpd	%xmm0, %xmm0, %xmm0
	leal	(%rax,%r14), %edi
	cmpl	$6, %edx
	vcvtsi2sd	%edi, %xmm0, %xmm0
	vmovsd	%xmm0, 40(%r12)
	je	.L155
	addl	%ecx, %eax
	vxorpd	%xmm0, %xmm0, %xmm0
	leal	(%rax,%r14), %edi
	cmpl	$7, %edx
	vcvtsi2sd	%edi, %xmm0, %xmm0
	vmovsd	%xmm0, 48(%r12)
	je	.L156
	addl	%ecx, %eax
	vxorpd	%xmm0, %xmm0, %xmm0
	leal	(%r14,%rax), %edi
	cmpl	$9, %edx
	vcvtsi2sd	%edi, %xmm0, %xmm0
	vmovsd	%xmm0, 56(%r12)
	jne	.L157
	vxorpd	%xmm0, %xmm0, %xmm0
	addl	%ecx, %eax
	addl	%r14d, %eax
	vcvtsi2sd	%eax, %xmm0, %xmm0
	vmovsd	%xmm0, 64(%r12)
	movl	$9, %eax
.L103:
	cmpl	%edx, %esi
	je	.L104
.L102:
	subl	%edx, %esi
	leal	-1(%rbx), %r8d
	movl	$0, %r11d
	leal	-8(%rsi), %edi
	movl	%edx, %r10d
	shrl	$3, %edi
	addl	$1, %edi
	testl	%ebx, %ebx
	cmovle	%r11d, %r8d
	leal	0(,%rdi,8), %r9d
	subl	%edx, %r8d
	cmpl	$6, %r8d
	jbe	.L105
	movl	%eax, -112(%rbp)
	vpbroadcastd	-104(%rbp), %ymm4
	leaq	(%r12,%r10,8), %rdx
	vpbroadcastd	-112(%rbp), %ymm1
	movl	%r14d, -112(%rbp)
	xorl	%r8d, %r8d
	vpbroadcastd	-112(%rbp), %ymm2
	vmovdqa	.LC16(%rip), %ymm3
	vpaddd	.LC15(%rip), %ymm1, %ymm1
.L106:
	vpmulld	%ymm1, %ymm4, %ymm0
	vpaddd	%ymm2, %ymm0, %ymm0
	vcvtdq2pd	%xmm0, %ymm5
	vextracti128	$0x1, %ymm0, %xmm0
	addl	$1, %r8d
	vpaddd	%ymm3, %ymm1, %ymm1
	vmovapd	%ymm5, (%rdx)
	addq	$64, %rdx
	vcvtdq2pd	%xmm0, %ymm0
	vmovapd	%ymm0, -32(%rdx)
	cmpl	%r8d, %edi
	ja	.L106
	addl	%r9d, %eax
	cmpl	%esi, %r9d
	je	.L104
.L105:
	movl	-104(%rbp), %ecx
	vxorpd	%xmm0, %xmm0, %xmm0
	movslq	%eax, %rdi
	movl	%ecx, %edx
	imull	%eax, %edx
	leal	(%rdx,%r14), %esi
	vcvtsi2sd	%esi, %xmm0, %xmm0
	leal	1(%rax), %esi
	vmovsd	%xmm0, (%r12,%rdi,8)
	cmpl	%ebx, %esi
	jge	.L104
	addl	%ecx, %edx
	vxorpd	%xmm0, %xmm0, %xmm0
	leal	(%r14,%rdx), %edi
	movslq	%esi, %rsi
	vcvtsi2sd	%edi, %xmm0, %xmm0
	vmovsd	%xmm0, (%r12,%rsi,8)
	leal	2(%rax), %esi
	cmpl	%ebx, %esi
	jge	.L104
	addl	%ecx, %edx
	vxorpd	%xmm0, %xmm0, %xmm0
	leal	(%r14,%rdx), %edi
	movslq	%esi, %rsi
	vcvtsi2sd	%edi, %xmm0, %xmm0
	vmovsd	%xmm0, (%r12,%rsi,8)
	leal	3(%rax), %esi
	cmpl	%ebx, %esi
	jge	.L104
	addl	%ecx, %edx
	vxorpd	%xmm0, %xmm0, %xmm0
	leal	(%r14,%rdx), %edi
	movslq	%esi, %rsi
	vcvtsi2sd	%edi, %xmm0, %xmm0
	vmovsd	%xmm0, (%r12,%rsi,8)
	leal	4(%rax), %esi
	cmpl	%ebx, %esi
	jge	.L104
	addl	%ecx, %edx
	vxorpd	%xmm0, %xmm0, %xmm0
	leal	(%r14,%rdx), %edi
	movslq	%esi, %rsi
	vcvtsi2sd	%edi, %xmm0, %xmm0
	vmovsd	%xmm0, (%r12,%rsi,8)
	leal	5(%rax), %esi
	cmpl	%ebx, %esi
	jge	.L104
	addl	%ecx, %edx
	vxorpd	%xmm0, %xmm0, %xmm0
	leal	(%r14,%rdx), %edi
	addl	$6, %eax
	movslq	%esi, %rsi
	cmpl	%ebx, %eax
	vcvtsi2sd	%edi, %xmm0, %xmm0
	vmovsd	%xmm0, (%r12,%rsi,8)
	jge	.L104
	addl	-104(%rbp), %edx
	vxorpd	%xmm0, %xmm0, %xmm0
	cltq
	addl	%edx, %r14d
	vcvtsi2sd	%r14d, %xmm0, %xmm0
	vmovsd	%xmm0, (%r12,%rax,8)
.L104:
	testl	%r13d, %r13d
	jle	.L199
.L110:
	movq	$0, -176(%rbp)
	movl	$0, -164(%rbp)
	vzeroupper
.L124:
	testl	%ebx, %ebx
	movq	$0, -152(%rbp)
	jle	.L121
	.p2align 4,,10
	.p2align 3
.L174:
	movq	toupperversion+8(%rip), %rax
	movq	-152(%rbp), %rsi
	testq	%rax, %rax
	movl	%esi, -128(%rbp)
	movq	%rax, -120(%rbp)
	je	.L122
	movq	%rsi, %rax
	movq	$toupperversion, -112(%rbp)
	movl	$0, -124(%rbp)
	salq	$3, %rax
	movl	$1374389535, %r15d
	movq	%rax, -160(%rbp)
	movq	%rax, %rsi
.L123:
	imull	-124(%rbp), %r13d
	movl	-164(%rbp), %eax
	movq	-176(%rbp), %rdi
	imull	%ebx, %eax
	addl	-128(%rbp), %eax
	imull	%r13d, %ebx
	addl	%ebx, %eax
	movl	%eax, -136(%rbp)
	movq	ratios(%rip), %rax
	vcvttsd2si	(%rax,%rsi), %r12d
	movq	sizes(%rip), %rax
	movq	(%rax,%rdi), %rax
	leaq	33(%rax), %rdi
	movq	%rax, %r13
	movq	%rax, -144(%rbp)
	call	malloc
	andq	$-16, %rax
	movl	$1, %edi
	addq	$16, %rax
	movq	%rax, %rbx
	movq	%rax, -104(%rbp)
	call	srand
	testq	%r13, %r13
	je	.L112
	addq	%rbx, %r13
	movq	%rbx, %r14
	.p2align 4,,10
	.p2align 3
.L113:
	call	rand
	movl	%eax, %ecx
	imull	%r15d
	movl	%ecx, %eax
	sarl	$31, %eax
	sarl	$5, %edx
	subl	%eax, %edx
	imull	$100, %edx, %edx
	subl	%edx, %ecx
	cmpl	%ecx, %r12d
	setle	%bl
	addq	$1, %r14
	call	rand
	movl	%eax, %ecx
	movl	$1321528399, %eax
	movzbl	%bl, %ebx
	imull	%ecx
	movl	%ecx, %eax
	addl	$2, %ebx
	sarl	$31, %eax
	sall	$5, %ebx
	sarl	$3, %edx
	subl	%eax, %edx
	imull	$26, %edx, %edx
	subl	%edx, %ecx
	leal	1(%rbx,%rcx), %eax
	movb	%al, -1(%r14)
	cmpq	%r13, %r14
	jne	.L113
.L112:
	movq	-104(%rbp), %rax
	movq	-144(%rbp), %rsi
	movb	$0, (%rax,%rsi)
	movl	debug(%rip), %edx
	testl	%edx, %edx
	jne	.L200
.L114:
	leaq	-96(%rbp), %rsi
	leaq	-80(%rbp), %rdi
	call	gettimeofday
	cmpl	$-1, %eax
	je	.L201
	vxorpd	%xmm7, %xmm7, %xmm7
	vcvtsi2sdq	-72(%rbp), %xmm7, %xmm7
	vmovsd	%xmm7, -144(%rbp)
.L116:
	movq	-104(%rbp), %rdi
	movq	-120(%rbp), %rax
	call	*%rax
	leaq	-96(%rbp), %rsi
	leaq	-80(%rbp), %rdi
	call	gettimeofday
	cmpl	$-1, %eax
	je	.L202
	vxorpd	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	-72(%rbp), %xmm0, %xmm0
.L118:
	vsubsd	-144(%rbp), %xmm0, %xmm0
	movslq	-136(%rbp), %rax
	movq	results(%rip), %rdx
	vmovsd	%xmm0, (%rdx,%rax,8)
	movl	debug(%rip), %eax
	testl	%eax, %eax
	je	.L119
	movq	-104(%rbp), %rdx
	movl	$.LC8, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
.L119:
	addq	$16, -112(%rbp)
	addl	$1, -124(%rbp)
	movq	-112(%rbp), %rax
	movl	no_ratio(%rip), %ebx
	movl	no_sz(%rip), %r13d
	movq	8(%rax), %rax
	testq	%rax, %rax
	movq	%rax, -120(%rbp)
	je	.L122
	movq	-160(%rbp), %rsi
	jmp	.L123
	.p2align 4,,10
	.p2align 3
.L122:
	movq	-152(%rbp), %rdi
	movl	%edi, %eax
	addq	$1, %rdi
	addl	$1, %eax
	movq	%rdi, -152(%rbp)
	cmpl	%eax, %ebx
	jg	.L174
.L121:
	addl	$1, -164(%rbp)
	addq	$8, -176(%rbp)
	movl	-164(%rbp), %eax
	cmpl	%r13d, %eax
	jl	.L124
.L111:
	xorl	%eax, %eax
	call	printresults
	xorl	%eax, %eax
	movq	-56(%rbp), %rsi
	xorq	%fs:40, %rsi
	jne	.L203
	subq	$-128, %rsp
	popq	%rbx
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L200:
	.cfi_restore_state
	movq	%rax, %rdx
	movl	$.LC6, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
	jmp	.L114
.L202:
	movl	$.LC7, %edi
	call	puts
	vmovsd	.LC5(%rip), %xmm0
	jmp	.L118
.L201:
	movl	$.LC7, %edi
	call	puts
	vmovsd	.LC5(%rip), %xmm3
	vmovsd	%xmm3, -144(%rbp)
	jmp	.L116
.L90:
	imull	%r13d, %esi
	movq	%r9, -120(%rbp)
	movq	%r8, -112(%rbp)
	movl	$1, no_ratio(%rip)
	movl	$1, %ebx
	movslq	%esi, %rdi
	salq	$3, %rdi
	call	malloc
	movl	$8, %edi
	movq	%rax, results(%rip)
	call	malloc
	movq	%r15, %rdi
	movq	%rax, %r12
	movq	%rax, ratios(%rip)
	call	malloc
	testl	%r13d, %r13d
	movq	%rax, sizes(%rip)
	movq	-112(%rbp), %r8
	movq	-120(%rbp), %r9
	jg	.L130
	jmp	.L128
	.p2align 4,,10
	.p2align 3
.L137:
	movl	$8, %r15d
	movl	$1, %r13d
	jmp	.L89
.L197:
	xorl	%edx, %edx
	testl	%esi, %esi
	je	.L93
	jmp	.L92
.L198:
	xorl	%eax, %eax
	testl	%edx, %edx
	je	.L102
	jmp	.L101
.L77:
	cmpq	$0, toupperversion+8(%rip)
	je	.L204
	movl	$1, -104(%rbp)
	movl	$0, -124(%rbp)
	movl	$50, %r14d
	movl	$10000, %r9d
	movq	$0, -136(%rbp)
	movl	$800000, %r8d
	jmp	.L126
.L199:
	vzeroupper
	jmp	.L111
.L204:
	movl	$1, no_sz(%rip)
	movl	$1, -104(%rbp)
	xorl	%esi, %esi
	movl	$50, %r14d
	movl	$10000, %r9d
	movl	$800000, %r8d
	movl	$8, %r15d
	movl	$1, %r13d
	movl	$8, %r12d
	movl	$1, %ebx
	jmp	.L129
.L203:
	call	__stack_chk_fail
.L157:
	movl	$8, %eax
	jmp	.L103
.L156:
	movl	$7, %eax
	jmp	.L103
.L192:
	testl	%ebx, %ebx
	jle	.L111
	jmp	.L128
.L151:
	movl	$2, %eax
	jmp	.L103
.L150:
	movl	$1, %eax
	jmp	.L103
.L155:
	movl	$6, %eax
	jmp	.L103
.L154:
	movl	$5, %eax
	jmp	.L103
.L153:
	movl	$4, %eax
	jmp	.L103
.L152:
	movl	$3, %eax
	jmp	.L103
.L147:
	movl	$8, %edx
	jmp	.L94
.L146:
	movl	$7, %edx
	jmp	.L94
.L145:
	movl	$6, %edx
	jmp	.L94
.L144:
	movl	$5, %edx
	jmp	.L94
.L143:
	movl	$4, %edx
	jmp	.L94
.L142:
	movl	$3, %edx
	jmp	.L94
.L141:
	movl	$2, %edx
	jmp	.L94
.L140:
	movl	$1, %edx
	jmp	.L94
	.cfi_endproc
.LFE69:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE17:
	.section	.text.startup
.LHOTE17:
	.globl	toupperversion
	.section	.rodata.str1.1
.LC18:
	.string	"simple"
.LC19:
	.string	"optimised"
	.data
	.align 32
	.type	toupperversion, @object
	.size	toupperversion, 48
toupperversion:
	.quad	.LC18
	.quad	toupper_simple
	.quad	.LC19
	.quad	toupper_optimised
	.quad	0
	.quad	0
	.globl	no_version
	.align 4
	.type	no_version, @object
	.size	no_version, 4
no_version:
	.long	1
	.globl	no_ratio
	.align 4
	.type	no_ratio, @object
	.size	no_ratio, 4
no_ratio:
	.long	1
	.globl	no_sz
	.align 4
	.type	no_sz, @object
	.size	no_sz, 4
no_sz:
	.long	1
	.comm	sizes,8,8
	.comm	ratios,8,8
	.comm	results,8,8
	.globl	debug
	.bss
	.align 4
	.type	debug, @object
	.size	debug, 4
debug:
	.zero	4
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC5:
	.long	0
	.long	-1074790400
	.section	.rodata.cst32,"aM",@progbits,32
	.align 32
.LC15:
	.long	0
	.long	1
	.long	2
	.long	3
	.long	4
	.long	5
	.long	6
	.long	7
	.align 32
.LC16:
	.long	8
	.long	8
	.long	8
	.long	8
	.long	8
	.long	8
	.long	8
	.long	8
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.10) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
