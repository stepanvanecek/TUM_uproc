	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 14
	.globl	_mymalloc               ## -- Begin function mymalloc
	.p2align	4, 0x90
_mymalloc:                              ## @mymalloc
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	addq	$32, %rdi
	callq	_malloc
	addq	$16, %rax
	andq	$-16, %rax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_createChar             ## -- Begin function createChar
	.p2align	4, 0x90
_createChar:                            ## @createChar
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -24
	movl	%edi, %ebx
	callq	_rand
	cltq
	imulq	$1374389535, %rax, %rcx ## imm = 0x51EB851F
	movq	%rcx, %rdx
	shrq	$63, %rdx
	sarq	$37, %rcx
	addl	%edx, %ecx
	imull	$100, %ecx, %ecx
	subl	%ecx, %eax
	cmpl	%ebx, %eax
	setge	%al
	shlb	$5, %al
	movzbl	%al, %ebx
	callq	_rand
	cltq
	imulq	$1321528399, %rax, %rcx ## imm = 0x4EC4EC4F
	movq	%rcx, %rdx
	shrq	$63, %rdx
	sarq	$35, %rcx
	addl	%edx, %ecx
	leal	(%rcx,%rcx,8), %edx
	leal	(%rdx,%rdx,2), %edx
	subl	%ecx, %edx
	subl	%edx, %eax
	leal	(%rbx,%rax), %eax
	addl	$65, %eax
	movsbl	%al, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_init                   ## -- Begin function init
	.p2align	4, 0x90
_init:                                  ## @init
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movl	%esi, %r12d
	movq	%rdi, %rbx
	leaq	33(%rbx), %rdi
	callq	_malloc
	movq	%rax, %r15
	addq	$16, %r15
	andq	$-16, %r15
	movl	$1, %edi
	callq	_srand
	testq	%rbx, %rbx
	je	LBB2_1
## %bb.2:
	movq	%rbx, %rax
	movq	%rax, -48(%rbp)         ## 8-byte Spill
	movq	%rbx, %r13
	movq	%r15, %rbx
	.p2align	4, 0x90
LBB2_3:                                 ## =>This Inner Loop Header: Depth=1
	callq	_rand
	cltq
	imulq	$1374389535, %rax, %rcx ## imm = 0x51EB851F
	movq	%rcx, %rdx
	shrq	$63, %rdx
	sarq	$37, %rcx
	addl	%edx, %ecx
	imull	$100, %ecx, %ecx
	subl	%ecx, %eax
	cmpl	%r12d, %eax
	setge	%al
	shlb	$5, %al
	movzbl	%al, %r14d
	callq	_rand
	cltq
	imulq	$1321528399, %rax, %rcx ## imm = 0x4EC4EC4F
	movq	%rcx, %rdx
	shrq	$63, %rdx
	sarq	$35, %rcx
	addl	%edx, %ecx
	leal	(%rcx,%rcx,8), %edx
	leal	(%rdx,%rdx,2), %edx
	subl	%ecx, %edx
	subl	%edx, %eax
	leal	(%r14,%rax), %eax
	addl	$65, %eax
	movb	%al, (%rbx)
	addq	$1, %rbx
	addq	$-1, %r13
	jne	LBB2_3
## %bb.4:
	movl	-48(%rbp), %eax         ## 4-byte Reload
	jmp	LBB2_5
LBB2_1:
	xorl	%eax, %eax
LBB2_5:
	movb	$0, (%r15,%rax)
	movq	%r15, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_run_toupper            ## -- Begin function run_toupper
	.p2align	4, 0x90
_run_toupper:                           ## @run_toupper
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rcx, -48(%rbp)         ## 8-byte Spill
	movl	%edx, %ebx
	imull	_no_sz(%rip), %ebx
	addl	%edi, %ebx
	imull	_no_ratio(%rip), %ebx
	movl	%esi, %r14d
	movq	_sizes@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movslq	%edi, %rcx
	movq	(%rax,%rcx,8), %r13
	movq	_ratios@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movslq	%r14d, %rcx
	vcvttsd2si	(%rax,%rcx,8), %r15d
	leaq	33(%r13), %rdi
	callq	_malloc
	movq	%rax, %r12
	addq	$16, %r12
	andq	$-16, %r12
	movl	$1, %edi
	callq	_srand
	testq	%r13, %r13
	je	LBB3_1
## %bb.2:
	movl	%r14d, -56(%rbp)        ## 4-byte Spill
	movl	%ebx, -52(%rbp)         ## 4-byte Spill
	movq	%r12, -64(%rbp)         ## 8-byte Spill
	movq	%r12, %r14
	movq	%r13, %rbx
	.p2align	4, 0x90
LBB3_3:                                 ## =>This Inner Loop Header: Depth=1
	callq	_rand
	cltq
	imulq	$1374389535, %rax, %rcx ## imm = 0x51EB851F
	movq	%rcx, %rdx
	shrq	$63, %rdx
	sarq	$37, %rcx
	addl	%edx, %ecx
	imull	$100, %ecx, %ecx
	subl	%ecx, %eax
	cmpl	%r15d, %eax
	setge	%al
	shlb	$5, %al
	movzbl	%al, %r12d
	callq	_rand
	cltq
	imulq	$1321528399, %rax, %rcx ## imm = 0x4EC4EC4F
	movq	%rcx, %rdx
	shrq	$63, %rdx
	sarq	$35, %rcx
	addl	%edx, %ecx
	leal	(%rcx,%rcx,8), %edx
	leal	(%rdx,%rdx,2), %edx
	subl	%ecx, %edx
	subl	%edx, %eax
	leal	(%r12,%rax), %eax
	addl	$65, %eax
	movb	%al, (%r14)
	addq	$1, %r14
	addq	$-1, %r13
	jne	LBB3_3
## %bb.4:
	movl	%ebx, %eax
	movq	-64(%rbp), %r12         ## 8-byte Reload
	movl	-52(%rbp), %ebx         ## 4-byte Reload
	movq	-48(%rbp), %r15         ## 8-byte Reload
	movl	-56(%rbp), %r14d        ## 4-byte Reload
	addl	%r14d, %ebx
	movb	$0, (%r12,%rax)
	cmpl	$0, _debug(%rip)
	je	LBB3_7
LBB3_6:
	leaq	L_.str(%rip), %rdi
	xorl	%eax, %eax
	movq	%r12, %rsi
	callq	_printf
LBB3_7:
	leaq	-80(%rbp), %rsi
	xorl	%edi, %edi
	callq	_clock_gettime
	movabsq	$2361183241434822607, %r14 ## imm = 0x20C49BA5E353F7CF
	movq	%r14, %rax
	imulq	-72(%rbp)
	movq	%rdx, %rax
	shrq	$63, %rax
	sarq	$7, %rdx
	addq	%rax, %rdx
	vcvtsi2sdq	%rdx, %xmm0, %xmm0
	vmovsd	%xmm0, -48(%rbp)        ## 8-byte Spill
	movq	%r12, %rdi
	callq	*%r15
	leaq	-80(%rbp), %rsi
	xorl	%edi, %edi
	callq	_clock_gettime
	movq	%r14, %rax
	imulq	-72(%rbp)
	movq	%rdx, %rax
	shrq	$63, %rax
	sarq	$7, %rdx
	addq	%rax, %rdx
	vcvtsi2sdq	%rdx, %xmm1, %xmm0
	vsubsd	-48(%rbp), %xmm0, %xmm0 ## 8-byte Folded Reload
	movq	_results@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movslq	%ebx, %rcx
	vmovsd	%xmm0, (%rax,%rcx,8)
	cmpl	$0, _debug(%rip)
	je	LBB3_9
## %bb.8:
	leaq	L_.str.1(%rip), %rdi
	xorl	%eax, %eax
	movq	%r12, %rsi
	callq	_printf
LBB3_9:
	addq	$40, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB3_1:
	xorl	%eax, %eax
	movq	-48(%rbp), %r15         ## 8-byte Reload
	addl	%r14d, %ebx
	movb	$0, (%r12,%rax)
	cmpl	$0, _debug(%rip)
	jne	LBB3_6
	jmp	LBB3_7
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function toupper_simple
_toupper_simple:                        ## @toupper_simple
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movb	(%rdi), %al
	testb	%al, %al
	je	LBB4_5
## %bb.1:
	addq	$1, %rdi
	.p2align	4, 0x90
LBB4_2:                                 ## =>This Inner Loop Header: Depth=1
	movl	%eax, %ecx
	addb	$-97, %cl
	cmpb	$25, %cl
	ja	LBB4_4
## %bb.3:                               ##   in Loop: Header=BB4_2 Depth=1
	addb	$-32, %al
	movb	%al, -1(%rdi)
LBB4_4:                                 ##   in Loop: Header=BB4_2 Depth=1
	movzbl	(%rdi), %eax
	addq	$1, %rdi
	testb	%al, %al
	jne	LBB4_2
LBB4_5:
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function toupper_optimised
_toupper_optimised:                     ## @toupper_optimised
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_run                    ## -- Begin function run
	.p2align	4, 0x90
_run:                                   ## @run
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movl	%esi, %r14d
	movl	%edi, %r15d
	movq	_toupperversion+8(%rip), %rcx
	testq	%rcx, %rcx
	je	LBB6_3
## %bb.1:
	xorl	%r12d, %r12d
	leaq	_toupperversion+24(%rip), %rbx
	.p2align	4, 0x90
LBB6_2:                                 ## =>This Inner Loop Header: Depth=1
	movl	%r15d, %edi
	movl	%r14d, %esi
	movl	%r12d, %edx
	callq	_run_toupper
	movq	(%rbx), %rcx
	addl	$1, %r12d
	addq	$16, %rbx
	testq	%rcx, %rcx
	jne	LBB6_2
LBB6_3:
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_printresults           ## -- Begin function printresults
	.p2align	4, 0x90
_printresults:                          ## @printresults
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	leaq	L_.str.5(%rip), %rdi
	callq	_puts
	movl	_no_sz(%rip), %ecx
	testl	%ecx, %ecx
	jle	LBB7_10
## %bb.1:
	movl	_no_ratio(%rip), %eax
	xorl	%esi, %esi
	.p2align	4, 0x90
LBB7_2:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB7_4 Depth 2
                                        ##       Child Loop BB7_6 Depth 3
	testl	%eax, %eax
	jle	LBB7_9
## %bb.3:                               ##   in Loop: Header=BB7_2 Depth=1
	xorl	%r13d, %r13d
	movq	%rsi, -48(%rbp)         ## 8-byte Spill
	.p2align	4, 0x90
LBB7_4:                                 ##   Parent Loop BB7_2 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB7_6 Depth 3
	movq	_sizes@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	(%rax,%rsi,8), %rsi
	movq	_ratios@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	vmovsd	(%rax,%r13,8), %xmm0    ## xmm0 = mem[0],zero
	movb	$1, %al
	leaq	L_.str.6(%rip), %rdi
	callq	_printf
	cmpl	$0, _no_version(%rip)
	movq	_results@GOTPCREL(%rip), %r15
	leaq	L_.str.7(%rip), %rbx
	jle	LBB7_7
## %bb.5:                               ##   in Loop: Header=BB7_4 Depth=2
	leaq	_toupperversion(%rip), %r14
	xorl	%r12d, %r12d
	.p2align	4, 0x90
LBB7_6:                                 ##   Parent Loop BB7_2 Depth=1
                                        ##     Parent Loop BB7_4 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	movl	_no_sz(%rip), %eax
	imull	%r12d, %eax
	addl	-48(%rbp), %eax         ## 4-byte Folded Reload
	imull	_no_ratio(%rip), %eax
	addl	%r13d, %eax
	movq	(%r14), %rsi
	movq	(%r15), %rcx
	cltq
	vmovsd	(%rcx,%rax,8), %xmm0    ## xmm0 = mem[0],zero
	movb	$1, %al
	movq	%rbx, %rdi
	callq	_printf
	addq	$1, %r12
	movslq	_no_version(%rip), %rax
	addq	$16, %r14
	cmpq	%rax, %r12
	jl	LBB7_6
LBB7_7:                                 ##   in Loop: Header=BB7_4 Depth=2
	movl	$10, %edi
	callq	_putchar
	addq	$1, %r13
	movslq	_no_ratio(%rip), %rax
	cmpq	%rax, %r13
	movq	-48(%rbp), %rsi         ## 8-byte Reload
	jl	LBB7_4
## %bb.8:                               ##   in Loop: Header=BB7_2 Depth=1
	movl	_no_sz(%rip), %ecx
LBB7_9:                                 ##   in Loop: Header=BB7_2 Depth=1
	addq	$1, %rsi
	movslq	%ecx, %rdx
	cmpq	%rdx, %rsi
	jl	LBB7_2
LBB7_10:
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__const
	.p2align	5               ## -- Begin function main
LCPI8_0:
	.quad	0                       ## 0x0
	.quad	1                       ## 0x1
	.quad	2                       ## 0x2
	.quad	3                       ## 0x3
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3
LCPI8_1:
	.quad	4                       ## 0x4
LCPI8_2:
	.quad	8                       ## 0x8
LCPI8_3:
	.quad	12                      ## 0xc
LCPI8_4:
	.quad	16                      ## 0x10
LCPI8_5:
	.quad	20                      ## 0x14
LCPI8_6:
	.quad	24                      ## 0x18
LCPI8_7:
	.quad	28                      ## 0x1c
LCPI8_8:
	.quad	32                      ## 0x20
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4
LCPI8_9:
	.long	0                       ## 0x0
	.long	1                       ## 0x1
	.long	2                       ## 0x2
	.long	3                       ## 0x3
	.section	__TEXT,__literal4,4byte_literals
	.p2align	2
LCPI8_10:
	.long	4                       ## 0x4
LCPI8_11:
	.long	8                       ## 0x8
LCPI8_12:
	.long	12                      ## 0xc
LCPI8_13:
	.long	16                      ## 0x10
LCPI8_14:
	.long	20                      ## 0x14
LCPI8_15:
	.long	24                      ## 0x18
LCPI8_16:
	.long	28                      ## 0x1c
LCPI8_17:
	.long	32                      ## 0x20
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	andq	$-32, %rsp
	subq	$160, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rsi, %rbx
	xorl	%r13d, %r13d
	cmpl	$2, %edi
	jl	LBB8_15
## %bb.1:
	movl	%edi, 28(%rsp)          ## 4-byte Spill
	movslq	%edi, %rax
	movq	%rax, 32(%rsp)          ## 8-byte Spill
	movl	$50, 24(%rsp)           ## 4-byte Folded Spill
	xorl	%eax, %eax
	movq	%rax, 40(%rsp)          ## 8-byte Spill
	movl	$1, 20(%rsp)            ## 4-byte Folded Spill
	movl	$3, 96(%rsp)            ## 4-byte Folded Spill
	movl	$10000, %ecx            ## imm = 0x2710
	movl	$800000, %r15d          ## imm = 0xC3500
	movl	$1, %r14d
	xorl	%r12d, %r12d
	movq	%rbx, 64(%rsp)          ## 8-byte Spill
	.p2align	4, 0x90
LBB8_2:                                 ## =>This Inner Loop Header: Depth=1
	movq	%rcx, 8(%rsp)           ## 8-byte Spill
	movq	(%rbx,%r14,8), %rbx
	leaq	L_.str.9(%rip), %rdi
	movq	%rbx, %rsi
	callq	_strcmp
	testl	%eax, %eax
	jne	LBB8_4
## %bb.3:                               ##   in Loop: Header=BB8_2 Depth=1
	movl	$1, _debug(%rip)
LBB8_4:                                 ##   in Loop: Header=BB8_2 Depth=1
	leaq	L_.str.10(%rip), %rdi
	movq	%rbx, %rsi
	callq	_strcmp
	testl	%eax, %eax
	jne	LBB8_9
## %bb.5:                               ##   in Loop: Header=BB8_2 Depth=1
	movq	%r12, %r15
	movq	64(%rsp), %r12          ## 8-byte Reload
	movq	8(%r12,%r14,8), %rdi
	callq	_atoi
	cltq
	movq	%rax, 48(%rsp)          ## 8-byte Spill
	movl	96(%rsp), %eax          ## 4-byte Reload
	cmpl	28(%rsp), %eax          ## 4-byte Folded Reload
	jge	LBB8_63
## %bb.6:                               ##   in Loop: Header=BB8_2 Depth=1
	movq	%r15, 56(%rsp)          ## 8-byte Spill
	movq	16(%r12,%r14,8), %r12
	leaq	L_.str.11(%rip), %rdi
	movq	%r12, %rsi
	callq	_strcmp
	testl	%eax, %eax
	je	LBB8_64
## %bb.7:                               ##   in Loop: Header=BB8_2 Depth=1
	leaq	L_.str.9(%rip), %rdi
	movq	%r12, %rsi
	callq	_strcmp
	testl	%eax, %eax
	movq	48(%rsp), %r15          ## 8-byte Reload
	je	LBB8_65
## %bb.8:                               ##   in Loop: Header=BB8_2 Depth=1
	movq	%r12, %rdi
	callq	_atoi
	movslq	%eax, %r12
	movq	64(%rsp), %rax          ## 8-byte Reload
	movq	24(%rax,%r14,8), %rdi
	callq	_atoi
	cltq
	movq	%rax, 8(%rsp)           ## 8-byte Spill
LBB8_9:                                 ##   in Loop: Header=BB8_2 Depth=1
	leaq	L_.str.11(%rip), %rdi
	movq	%rbx, %rsi
	callq	_strcmp
	testl	%eax, %eax
	je	LBB8_11
## %bb.10:                              ##   in Loop: Header=BB8_2 Depth=1
	movq	8(%rsp), %rcx           ## 8-byte Reload
	movq	64(%rsp), %rbx          ## 8-byte Reload
	addq	$1, %r14
	addl	$1, 96(%rsp)            ## 4-byte Folded Spill
	cmpq	32(%rsp), %r14          ## 8-byte Folded Reload
	jl	LBB8_2
	jmp	LBB8_16
	.p2align	4, 0x90
LBB8_11:                                ##   in Loop: Header=BB8_2 Depth=1
	movq	64(%rsp), %rbx          ## 8-byte Reload
	movq	8(%rbx,%r14,8), %rdi
	callq	_atoi
	movl	%eax, 24(%rsp)          ## 4-byte Spill
	movl	96(%rsp), %eax          ## 4-byte Reload
	cmpl	28(%rsp), %eax          ## 4-byte Folded Reload
	jge	LBB8_66
## %bb.12:                              ##   in Loop: Header=BB8_2 Depth=1
	movq	16(%rbx,%r14,8), %rbx
	leaq	L_.str.10(%rip), %rdi
	movq	%rbx, %rsi
	callq	_strcmp
	testl	%eax, %eax
	je	LBB8_66
## %bb.13:                              ##   in Loop: Header=BB8_2 Depth=1
	leaq	L_.str.9(%rip), %rdi
	movq	%rbx, %rsi
	callq	_strcmp
	testl	%eax, %eax
	je	LBB8_66
## %bb.14:                              ##   in Loop: Header=BB8_2 Depth=1
	movq	%rbx, %rdi
	callq	_atoi
                                        ## kill: def %eax killed %eax def %rax
	movq	%rax, 40(%rsp)          ## 8-byte Spill
	movq	64(%rsp), %rbx          ## 8-byte Reload
	movq	24(%rbx,%r14,8), %rdi
	callq	_atoi
	movl	%eax, 20(%rsp)          ## 4-byte Spill
	movq	8(%rsp), %rcx           ## 8-byte Reload
	addq	$1, %r14
	addl	$1, 96(%rsp)            ## 4-byte Folded Spill
	cmpq	32(%rsp), %r14          ## 8-byte Folded Reload
	jl	LBB8_2
	jmp	LBB8_16
LBB8_15:
	movl	$50, 24(%rsp)           ## 4-byte Folded Spill
	movl	$1, 20(%rsp)            ## 4-byte Folded Spill
	movl	$800000, %r15d          ## imm = 0xC3500
	movl	$10000, %ecx            ## imm = 0x2710
	movl	$0, %eax
	movq	%rax, 40(%rsp)          ## 8-byte Spill
	xorl	%r12d, %r12d
LBB8_16:
	cmpq	$0, _toupperversion+8(%rip)
	je	LBB8_20
LBB8_17:
	xorl	%r13d, %r13d
	leaq	_toupperversion+24(%rip), %rax
	.p2align	4, 0x90
LBB8_18:                                ## =>This Inner Loop Header: Depth=1
	addl	$1, %r13d
	cmpq	$0, (%rax)
	leaq	16(%rax), %rax
	jne	LBB8_18
## %bb.19:
	movl	%r13d, _no_version(%rip)
LBB8_20:
	movl	$1, %r14d
	movl	$1, %esi
	testq	%r12, %r12
	je	LBB8_25
## %bb.21:
	subq	%r15, %r12
	movq	%r12, %rax
	orq	%rcx, %rax
	shrq	$32, %rax
	je	LBB8_23
## %bb.22:
	xorl	%edx, %edx
	movq	%r12, %rax
	divq	%rcx
	movq	%rax, %rsi
	jmp	LBB8_24
LBB8_23:
	xorl	%edx, %edx
	movl	%r12d, %eax
	divl	%ecx
	movl	%eax, %esi
LBB8_24:
	addl	$1, %esi
LBB8_25:
	movq	%rcx, 8(%rsp)           ## 8-byte Spill
	movl	%esi, _no_sz(%rip)
	movq	40(%rsp), %rax          ## 8-byte Reload
	testl	%eax, %eax
	je	LBB8_27
## %bb.26:
	subl	24(%rsp), %eax          ## 4-byte Folded Reload
                                        ## kill: def %eax killed %eax killed %rax
	cltd
	idivl	20(%rsp)                ## 4-byte Folded Reload
	movl	%eax, %r14d
	addl	$1, %r14d
LBB8_27:
	movl	%r14d, _no_ratio(%rip)
	imull	%esi, %r13d
	imull	%r14d, %r13d
	shlq	$3, %r13
	movq	%r13, %rdi
	movq	%rsi, 32(%rsp)          ## 8-byte Spill
	callq	_malloc
	movq	_results@GOTPCREL(%rip), %rcx
	movq	%rax, (%rcx)
	movl	%r14d, %ebx
	leaq	(,%rbx,8), %rdi
	callq	_malloc
	movq	%rax, %r13
	movq	_ratios@GOTPCREL(%rip), %rax
	movq	%r13, (%rax)
	movl	32(%rsp), %r12d         ## 4-byte Reload
	leaq	(,%r12,8), %rdi
	callq	_malloc
	movq	32(%rsp), %r9           ## 8-byte Reload
	movq	_sizes@GOTPCREL(%rip), %rcx
	movq	%rax, (%rcx)
	testl	%r9d, %r9d
	movq	8(%rsp), %rsi           ## 8-byte Reload
	jle	LBB8_38
## %bb.28:
	cmpl	$16, %r9d
	jae	LBB8_30
## %bb.29:
	xorl	%ecx, %ecx
	jmp	LBB8_36
LBB8_30:
	movl	%r12d, %ecx
	andl	$-16, %ecx
	vmovq	%rsi, %xmm0
	vpbroadcastq	%xmm0, %ymm1
	vmovq	%r15, %xmm0
	vpbroadcastq	%xmm0, %ymm0
	leaq	-16(%rcx), %rdi
	movq	%rdi, %rdx
	shrq	$4, %rdx
	leal	1(%rdx), %r8d
	andl	$1, %r8d
	testq	%rdi, %rdi
	je	LBB8_61
## %bb.31:
	leaq	-1(%r8), %rdi
	subq	%rdx, %rdi
	vmovdqa	LCPI8_0(%rip), %ymm2    ## ymm2 = [0,1,2,3]
	xorl	%edx, %edx
	vbroadcastsd	LCPI8_1(%rip), %ymm3 ## ymm3 = [4,4,4,4]
	vmovaps	%ymm3, 64(%rsp)         ## 32-byte Spill
	vpbroadcastq	LCPI8_2(%rip), %ymm3 ## ymm3 = [8,8,8,8]
	vmovdqa	%ymm3, 96(%rsp)         ## 32-byte Spill
	vpbroadcastq	LCPI8_3(%rip), %ymm5 ## ymm5 = [12,12,12,12]
	vpsrlq	$32, %ymm1, %ymm6
	vpbroadcastq	LCPI8_4(%rip), %ymm7 ## ymm7 = [16,16,16,16]
	vpbroadcastq	LCPI8_5(%rip), %ymm8 ## ymm8 = [20,20,20,20]
	vpbroadcastq	LCPI8_6(%rip), %ymm9 ## ymm9 = [24,24,24,24]
	vpbroadcastq	LCPI8_7(%rip), %ymm10 ## ymm10 = [28,28,28,28]
	vpbroadcastq	LCPI8_8(%rip), %ymm11 ## ymm11 = [32,32,32,32]
	.p2align	4, 0x90
LBB8_32:                                ## =>This Inner Loop Header: Depth=1
	vpaddq	64(%rsp), %ymm2, %ymm12 ## 32-byte Folded Reload
	vpaddq	96(%rsp), %ymm2, %ymm13 ## 32-byte Folded Reload
	vpaddq	%ymm5, %ymm2, %ymm14
	vpmuludq	%ymm2, %ymm6, %ymm15
	vpsrlq	$32, %ymm2, %ymm3
	vpmuludq	%ymm3, %ymm1, %ymm3
	vpaddq	%ymm15, %ymm3, %ymm3
	vpsllq	$32, %ymm3, %ymm3
	vpmuludq	%ymm2, %ymm1, %ymm15
	vpaddq	%ymm3, %ymm15, %ymm3
	vpmuludq	%ymm12, %ymm6, %ymm15
	vpsrlq	$32, %ymm12, %ymm4
	vpmuludq	%ymm4, %ymm1, %ymm4
	vpaddq	%ymm15, %ymm4, %ymm4
	vpsllq	$32, %ymm4, %ymm4
	vpmuludq	%ymm12, %ymm1, %ymm12
	vpaddq	%ymm4, %ymm12, %ymm4
	vpmuludq	%ymm13, %ymm6, %ymm12
	vpsrlq	$32, %ymm13, %ymm15
	vpmuludq	%ymm15, %ymm1, %ymm15
	vpaddq	%ymm12, %ymm15, %ymm12
	vpsllq	$32, %ymm12, %ymm12
	vpmuludq	%ymm13, %ymm1, %ymm13
	vpaddq	%ymm12, %ymm13, %ymm12
	vpmuludq	%ymm14, %ymm6, %ymm13
	vpsrlq	$32, %ymm14, %ymm15
	vpmuludq	%ymm15, %ymm1, %ymm15
	vpaddq	%ymm13, %ymm15, %ymm13
	vpsllq	$32, %ymm13, %ymm13
	vpmuludq	%ymm14, %ymm1, %ymm14
	vpaddq	%ymm13, %ymm14, %ymm13
	vpaddq	%ymm0, %ymm3, %ymm3
	vpaddq	%ymm0, %ymm4, %ymm4
	vpaddq	%ymm0, %ymm12, %ymm12
	vpaddq	%ymm0, %ymm13, %ymm13
	vmovdqu	%ymm3, (%rax,%rdx,8)
	vmovdqu	%ymm4, 32(%rax,%rdx,8)
	vmovdqu	%ymm12, 64(%rax,%rdx,8)
	vmovdqu	%ymm13, 96(%rax,%rdx,8)
	vpaddq	%ymm7, %ymm2, %ymm3
	vpaddq	%ymm8, %ymm2, %ymm4
	vpaddq	%ymm9, %ymm2, %ymm13
	vpaddq	%ymm10, %ymm2, %ymm12
	vpmuludq	%ymm3, %ymm6, %ymm14
	vpsrlq	$32, %ymm3, %ymm15
	vpmuludq	%ymm15, %ymm1, %ymm15
	vpaddq	%ymm14, %ymm15, %ymm14
	vpsllq	$32, %ymm14, %ymm14
	vpmuludq	%ymm3, %ymm1, %ymm3
	vpaddq	%ymm14, %ymm3, %ymm3
	vpmuludq	%ymm4, %ymm6, %ymm14
	vpsrlq	$32, %ymm4, %ymm15
	vpmuludq	%ymm15, %ymm1, %ymm15
	vpaddq	%ymm14, %ymm15, %ymm14
	vpsllq	$32, %ymm14, %ymm14
	vpmuludq	%ymm4, %ymm1, %ymm4
	vpaddq	%ymm14, %ymm4, %ymm4
	vpmuludq	%ymm13, %ymm6, %ymm14
	vpsrlq	$32, %ymm13, %ymm15
	vpmuludq	%ymm15, %ymm1, %ymm15
	vpaddq	%ymm14, %ymm15, %ymm14
	vpsllq	$32, %ymm14, %ymm14
	vpmuludq	%ymm13, %ymm1, %ymm13
	vpaddq	%ymm14, %ymm13, %ymm13
	vpmuludq	%ymm12, %ymm6, %ymm14
	vpsrlq	$32, %ymm12, %ymm15
	vpmuludq	%ymm15, %ymm1, %ymm15
	vpaddq	%ymm14, %ymm15, %ymm14
	vpaddq	%ymm0, %ymm3, %ymm3
	vmovdqu	%ymm3, 128(%rax,%rdx,8)
	vpaddq	%ymm0, %ymm4, %ymm3
	vmovdqu	%ymm3, 160(%rax,%rdx,8)
	vpaddq	%ymm0, %ymm13, %ymm3
	vmovdqu	%ymm3, 192(%rax,%rdx,8)
	vpsllq	$32, %ymm14, %ymm3
	vpmuludq	%ymm12, %ymm1, %ymm4
	vpaddq	%ymm3, %ymm4, %ymm3
	vpaddq	%ymm0, %ymm3, %ymm3
	vmovdqu	%ymm3, 224(%rax,%rdx,8)
	addq	$32, %rdx
	vpaddq	%ymm11, %ymm2, %ymm2
	addq	$2, %rdi
	jne	LBB8_32
## %bb.33:
	testq	%r8, %r8
	je	LBB8_35
LBB8_34:
	vpbroadcastq	LCPI8_1(%rip), %ymm3 ## ymm3 = [4,4,4,4]
	vpaddq	%ymm3, %ymm2, %ymm3
	vpbroadcastq	LCPI8_2(%rip), %ymm4 ## ymm4 = [8,8,8,8]
	vpaddq	%ymm4, %ymm2, %ymm4
	vpbroadcastq	LCPI8_3(%rip), %ymm5 ## ymm5 = [12,12,12,12]
	vpaddq	%ymm5, %ymm2, %ymm5
	vpsrlq	$32, %ymm1, %ymm6
	vpmuludq	%ymm2, %ymm6, %ymm7
	vpsrlq	$32, %ymm2, %ymm8
	vpmuludq	%ymm8, %ymm1, %ymm8
	vpaddq	%ymm7, %ymm8, %ymm7
	vpsllq	$32, %ymm7, %ymm7
	vpmuludq	%ymm2, %ymm1, %ymm2
	vpaddq	%ymm7, %ymm2, %ymm2
	vpmuludq	%ymm3, %ymm6, %ymm7
	vpsrlq	$32, %ymm3, %ymm8
	vpmuludq	%ymm8, %ymm1, %ymm8
	vpaddq	%ymm7, %ymm8, %ymm7
	vpsllq	$32, %ymm7, %ymm7
	vpmuludq	%ymm3, %ymm1, %ymm3
	vpaddq	%ymm7, %ymm3, %ymm3
	vpmuludq	%ymm4, %ymm6, %ymm7
	vpsrlq	$32, %ymm4, %ymm8
	vpmuludq	%ymm8, %ymm1, %ymm8
	vpaddq	%ymm7, %ymm8, %ymm7
	vpsllq	$32, %ymm7, %ymm7
	vpmuludq	%ymm4, %ymm1, %ymm4
	vpaddq	%ymm7, %ymm4, %ymm4
	vpmuludq	%ymm5, %ymm6, %ymm6
	vpsrlq	$32, %ymm5, %ymm7
	vpmuludq	%ymm7, %ymm1, %ymm7
	vpaddq	%ymm6, %ymm7, %ymm6
	vpsllq	$32, %ymm6, %ymm6
	vpmuludq	%ymm5, %ymm1, %ymm1
	vpaddq	%ymm6, %ymm1, %ymm1
	vpaddq	%ymm0, %ymm2, %ymm2
	vpaddq	%ymm0, %ymm3, %ymm3
	vpaddq	%ymm0, %ymm4, %ymm4
	vpaddq	%ymm0, %ymm1, %ymm0
	vmovdqu	%ymm2, (%rax,%rdx,8)
	vmovdqu	%ymm3, 32(%rax,%rdx,8)
	vmovdqu	%ymm4, 64(%rax,%rdx,8)
	vmovdqu	%ymm0, 96(%rax,%rdx,8)
LBB8_35:
	cmpq	%r12, %rcx
	je	LBB8_38
LBB8_36:
	leaq	(%rax,%rcx,8), %rax
	movq	%rsi, %rdx
	imulq	%rcx, %rdx
	addq	%rdx, %r15
	subq	%rcx, %r12
	.p2align	4, 0x90
LBB8_37:                                ## =>This Inner Loop Header: Depth=1
	movq	%r15, (%rax)
	addq	$8, %rax
	addq	%rsi, %r15
	addq	$-1, %r12
	jne	LBB8_37
LBB8_38:
	testl	%r14d, %r14d
	movl	24(%rsp), %edi          ## 4-byte Reload
	movl	20(%rsp), %eax          ## 4-byte Reload
	jle	LBB8_49
## %bb.39:
	cmpl	$16, %r14d
	jae	LBB8_41
## %bb.40:
	xorl	%r8d, %r8d
	jmp	LBB8_47
LBB8_41:
	movl	%ebx, %r8d
	andl	$-16, %r8d
	vmovd	%eax, %xmm0
	vpbroadcastd	%xmm0, %xmm1
	vmovd	%edi, %xmm0
	vpbroadcastd	%xmm0, %xmm0
	leaq	-16(%r8), %rsi
	movq	%rsi, %rcx
	shrq	$4, %rcx
	leal	1(%rcx), %edx
	andl	$1, %edx
	testq	%rsi, %rsi
	je	LBB8_62
## %bb.42:
	leaq	-1(%rdx), %rsi
	subq	%rcx, %rsi
	vmovdqa	LCPI8_9(%rip), %xmm2    ## xmm2 = [0,1,2,3]
	xorl	%ecx, %ecx
	vpbroadcastd	LCPI8_10(%rip), %xmm8 ## xmm8 = [4,4,4,4]
	vpbroadcastd	LCPI8_11(%rip), %xmm9 ## xmm9 = [8,8,8,8]
	vpbroadcastd	LCPI8_12(%rip), %xmm10 ## xmm10 = [12,12,12,12]
	vpbroadcastd	LCPI8_13(%rip), %xmm11 ## xmm11 = [16,16,16,16]
	vpbroadcastd	LCPI8_14(%rip), %xmm12 ## xmm12 = [20,20,20,20]
	vpbroadcastd	LCPI8_15(%rip), %xmm13 ## xmm13 = [24,24,24,24]
	vpbroadcastd	LCPI8_16(%rip), %xmm14 ## xmm14 = [28,28,28,28]
	vpbroadcastd	LCPI8_17(%rip), %xmm5 ## xmm5 = [32,32,32,32]
	.p2align	4, 0x90
LBB8_43:                                ## =>This Inner Loop Header: Depth=1
	vpaddd	%xmm8, %xmm2, %xmm6
	vpaddd	%xmm9, %xmm2, %xmm7
	vpaddd	%xmm10, %xmm2, %xmm3
	vpmulld	%xmm2, %xmm1, %xmm4
	vpmulld	%xmm6, %xmm1, %xmm6
	vpmulld	%xmm7, %xmm1, %xmm7
	vpmulld	%xmm3, %xmm1, %xmm3
	vpaddd	%xmm0, %xmm4, %xmm4
	vpaddd	%xmm0, %xmm6, %xmm6
	vpaddd	%xmm0, %xmm7, %xmm7
	vpaddd	%xmm0, %xmm3, %xmm3
	vcvtdq2pd	%xmm4, %ymm4
	vcvtdq2pd	%xmm6, %ymm6
	vcvtdq2pd	%xmm7, %ymm7
	vcvtdq2pd	%xmm3, %ymm3
	vmovups	%ymm4, (%r13,%rcx,8)
	vmovups	%ymm6, 32(%r13,%rcx,8)
	vmovups	%ymm7, 64(%r13,%rcx,8)
	vmovups	%ymm3, 96(%r13,%rcx,8)
	vpaddd	%xmm11, %xmm2, %xmm3
	vpaddd	%xmm12, %xmm2, %xmm4
	vpaddd	%xmm13, %xmm2, %xmm6
	vpaddd	%xmm14, %xmm2, %xmm7
	vpmulld	%xmm3, %xmm1, %xmm3
	vpmulld	%xmm4, %xmm1, %xmm4
	vpmulld	%xmm6, %xmm1, %xmm6
	vpmulld	%xmm7, %xmm1, %xmm7
	vpaddd	%xmm0, %xmm3, %xmm3
	vpaddd	%xmm0, %xmm4, %xmm4
	vpaddd	%xmm0, %xmm6, %xmm6
	vpaddd	%xmm0, %xmm7, %xmm7
	vcvtdq2pd	%xmm3, %ymm3
	vcvtdq2pd	%xmm4, %ymm4
	vcvtdq2pd	%xmm6, %ymm6
	vcvtdq2pd	%xmm7, %ymm7
	vmovdqu	%ymm3, 128(%r13,%rcx,8)
	vmovdqu	%ymm4, 160(%r13,%rcx,8)
	vmovdqu	%ymm6, 192(%r13,%rcx,8)
	vmovdqu	%ymm7, 224(%r13,%rcx,8)
	addq	$32, %rcx
	vpaddd	%xmm5, %xmm2, %xmm2
	addq	$2, %rsi
	jne	LBB8_43
## %bb.44:
	testq	%rdx, %rdx
	je	LBB8_46
LBB8_45:
	vpbroadcastd	LCPI8_10(%rip), %xmm3 ## xmm3 = [4,4,4,4]
	vpaddd	%xmm3, %xmm2, %xmm3
	vpbroadcastd	LCPI8_11(%rip), %xmm4 ## xmm4 = [8,8,8,8]
	vpaddd	%xmm4, %xmm2, %xmm4
	vpbroadcastd	LCPI8_12(%rip), %xmm5 ## xmm5 = [12,12,12,12]
	vpaddd	%xmm5, %xmm2, %xmm5
	vpmulld	%xmm2, %xmm1, %xmm2
	vpmulld	%xmm3, %xmm1, %xmm3
	vpmulld	%xmm4, %xmm1, %xmm4
	vpmulld	%xmm5, %xmm1, %xmm1
	vpaddd	%xmm0, %xmm2, %xmm2
	vpaddd	%xmm0, %xmm3, %xmm3
	vpaddd	%xmm0, %xmm4, %xmm4
	vpaddd	%xmm0, %xmm1, %xmm0
	vcvtdq2pd	%xmm2, %ymm1
	vcvtdq2pd	%xmm3, %ymm2
	vcvtdq2pd	%xmm4, %ymm3
	vcvtdq2pd	%xmm0, %ymm0
	vmovdqu	%ymm1, (%r13,%rcx,8)
	vmovdqu	%ymm2, 32(%r13,%rcx,8)
	vmovdqu	%ymm3, 64(%r13,%rcx,8)
	vmovdqu	%ymm0, 96(%r13,%rcx,8)
LBB8_46:
	cmpq	%rbx, %r8
	je	LBB8_49
LBB8_47:
	leaq	(,%r8,8), %rcx
	addq	%r13, %rcx
	movl	%eax, %edx
	imull	%r8d, %edx
	addl	%edx, %edi
	subq	%r8, %rbx
	.p2align	4, 0x90
LBB8_48:                                ## =>This Inner Loop Header: Depth=1
	vxorps	%xmm9, %xmm9, %xmm9
	vcvtsi2sdl	%edi, %xmm9, %xmm0
	vmovq	%xmm0, (%rcx)
	addq	$8, %rcx
	addl	%eax, %edi
	addq	$-1, %rbx
	jne	LBB8_48
LBB8_49:
	testl	%r9d, %r9d
	jle	LBB8_60
## %bb.50:
	xorl	%r15d, %r15d
	leaq	_toupperversion+24(%rip), %r13
	.p2align	4, 0x90
LBB8_51:                                ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB8_53 Depth 2
                                        ##       Child Loop BB8_55 Depth 3
	testl	%r14d, %r14d
	jle	LBB8_59
## %bb.52:                              ##   in Loop: Header=BB8_51 Depth=1
	xorl	%r12d, %r12d
	.p2align	4, 0x90
LBB8_53:                                ##   Parent Loop BB8_51 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB8_55 Depth 3
	movq	_toupperversion+8(%rip), %rcx
	testq	%rcx, %rcx
	je	LBB8_57
## %bb.54:                              ##   in Loop: Header=BB8_53 Depth=2
	xorl	%r14d, %r14d
	movq	%r13, %rbx
	.p2align	4, 0x90
LBB8_55:                                ##   Parent Loop BB8_51 Depth=1
                                        ##     Parent Loop BB8_53 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	movl	%r15d, %edi
	movl	%r12d, %esi
	movl	%r14d, %edx
	vzeroupper
	callq	_run_toupper
	movq	(%rbx), %rcx
	addq	$16, %rbx
	addl	$1, %r14d
	testq	%rcx, %rcx
	jne	LBB8_55
## %bb.56:                              ##   in Loop: Header=BB8_53 Depth=2
	movl	_no_ratio(%rip), %r14d
LBB8_57:                                ##   in Loop: Header=BB8_53 Depth=2
	addl	$1, %r12d
	cmpl	%r14d, %r12d
	jl	LBB8_53
## %bb.58:                              ##   in Loop: Header=BB8_51 Depth=1
	movl	_no_sz(%rip), %r9d
LBB8_59:                                ##   in Loop: Header=BB8_51 Depth=1
	addl	$1, %r15d
	cmpl	%r9d, %r15d
	jl	LBB8_51
LBB8_60:
	vzeroupper
	callq	_printresults
	xorl	%eax, %eax
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB8_66:
	movq	8(%rsp), %rcx           ## 8-byte Reload
	cmpq	$0, _toupperversion+8(%rip)
	jne	LBB8_17
	jmp	LBB8_20
LBB8_61:
	vmovdqa	LCPI8_0(%rip), %ymm2    ## ymm2 = [0,1,2,3]
	xorl	%edx, %edx
	testq	%r8, %r8
	jne	LBB8_34
	jmp	LBB8_35
LBB8_62:
	vmovdqa	LCPI8_9(%rip), %xmm2    ## xmm2 = [0,1,2,3]
	xorl	%ecx, %ecx
	testq	%rdx, %rdx
	jne	LBB8_45
	jmp	LBB8_46
LBB8_63:
	movq	8(%rsp), %rcx           ## 8-byte Reload
	movq	%r15, %r12
	movq	48(%rsp), %r15          ## 8-byte Reload
	cmpq	$0, _toupperversion+8(%rip)
	jne	LBB8_17
	jmp	LBB8_20
LBB8_64:
	movq	8(%rsp), %rcx           ## 8-byte Reload
	movq	56(%rsp), %r12          ## 8-byte Reload
	movq	48(%rsp), %r15          ## 8-byte Reload
	cmpq	$0, _toupperversion+8(%rip)
	jne	LBB8_17
	jmp	LBB8_20
LBB8_65:
	movq	8(%rsp), %rcx           ## 8-byte Reload
	movq	56(%rsp), %r12          ## 8-byte Reload
	cmpq	$0, _toupperversion+8(%rip)
	jne	LBB8_17
	jmp	LBB8_20
	.cfi_endproc
                                        ## -- End function
	.globl	_debug                  ## @debug
.zerofill __DATA,__common,_debug,4,2
	.section	__DATA,__data
	.globl	_no_sz                  ## @no_sz
	.p2align	2
_no_sz:
	.long	1                       ## 0x1

	.globl	_no_ratio               ## @no_ratio
	.p2align	2
_no_ratio:
	.long	1                       ## 0x1

	.globl	_no_version             ## @no_version
	.p2align	2
_no_version:
	.long	1                       ## 0x1

	.comm	_sizes,8,3              ## @sizes
	.comm	_ratios,8,3             ## @ratios
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"Before: %.40s...\n"

	.comm	_results,8,3            ## @results
L_.str.1:                               ## @.str.1
	.asciz	"After:  %.40s...\n"

L_.str.2:                               ## @.str.2
	.asciz	"simple"

L_.str.3:                               ## @.str.3
	.asciz	"optimised"

	.section	__DATA,__data
	.globl	_toupperversion         ## @toupperversion
	.p2align	4
_toupperversion:
	.quad	L_.str.2
	.quad	_toupper_simple
	.quad	L_.str.3
	.quad	_toupper_optimised
	.space	16

	.section	__TEXT,__cstring,cstring_literals
L_.str.5:                               ## @.str.5
	.asciz	"VARIANT4: gcc -lm -march=native toupper.c -O3"

L_.str.6:                               ## @.str.6
	.asciz	"Size: %ld \tRatio: %f \tRunning time:"

L_.str.7:                               ## @.str.7
	.asciz	"\t%s: %f"

L_.str.9:                               ## @.str.9
	.asciz	"-d"

L_.str.10:                              ## @.str.10
	.asciz	"-l"

L_.str.11:                              ## @.str.11
	.asciz	"-r"


.subsections_via_symbols
