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
	movq	%rdi, %r15
	leaq	1(%r15), %rdi
	callq	_mymalloc
	movq	%rax, %r14
	movl	$1, %edi
	callq	_srand
	testq	%r15, %r15
	je	LBB2_1
## %bb.2:
	movq	%r15, %r13
	movq	%r14, %rbx
	.p2align	4, 0x90
LBB2_3:                                 ## =>This Inner Loop Header: Depth=1
	movl	%r12d, %edi
	callq	_createChar
	movb	%al, (%rbx)
	addq	$1, %rbx
	addq	$-1, %r13
	jne	LBB2_3
## %bb.4:
	movl	%r15d, %eax
	jmp	LBB2_5
LBB2_1:
	xorl	%eax, %eax
LBB2_5:
	movb	$0, (%r14,%rax)
	movq	%r14, %rax
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
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rcx, %r14
	movl	%edx, %ebx
	imull	_no_sz(%rip), %ebx
	addl	%edi, %ebx
	imull	_no_ratio(%rip), %ebx
	addl	%esi, %ebx
	movq	_sizes@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movslq	%edi, %rcx
	movq	(%rax,%rcx,8), %rdi
	movq	_ratios@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movslq	%esi, %rcx
	vcvttsd2si	(%rax,%rcx,8), %esi
	callq	_init
	movq	%rax, %r15
	cmpl	$0, _debug(%rip)
	je	LBB3_2
## %bb.1:
	leaq	L_.str(%rip), %rdi
	xorl	%eax, %eax
	movq	%r15, %rsi
	callq	_printf
LBB3_2:
	callq	_gettime
	vmovsd	%xmm0, -32(%rbp)        ## 8-byte Spill
	movq	%r15, %rdi
	callq	*%r14
	callq	_gettime
	vsubsd	-32(%rbp), %xmm0, %xmm0 ## 8-byte Folded Reload
	movq	_results@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movslq	%ebx, %rcx
	vmovsd	%xmm0, (%rax,%rcx,8)
	cmpl	$0, _debug(%rip)
	je	LBB3_3
## %bb.4:
	leaq	L_.str.1(%rip), %rdi
	xorl	%eax, %eax
	movq	%r15, %rsi
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	_printf                 ## TAILCALL
LBB3_3:
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function gettime
_gettime:                               ## @gettime
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	leaq	-16(%rbp), %rsi
	xorl	%edi, %edi
	callq	_clock_gettime
	movabsq	$2361183241434822607, %rax ## imm = 0x20C49BA5E353F7CF
	imulq	-8(%rbp)
	movq	%rdx, %rax
	shrq	$63, %rax
	sarq	$7, %rdx
	addq	%rax, %rdx
	vcvtsi2sdq	%rdx, %xmm0, %xmm0
	addq	$16, %rsp
	popq	%rbp
	retq
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
	je	LBB5_5
## %bb.1:
	addq	$1, %rdi
	.p2align	4, 0x90
LBB5_2:                                 ## =>This Inner Loop Header: Depth=1
	movl	%eax, %ecx
	addb	$-97, %cl
	cmpb	$25, %cl
	ja	LBB5_4
## %bb.3:                               ##   in Loop: Header=BB5_2 Depth=1
	addb	$-32, %al
	movb	%al, -1(%rdi)
LBB5_4:                                 ##   in Loop: Header=BB5_2 Depth=1
	movzbl	(%rdi), %eax
	addq	$1, %rdi
	testb	%al, %al
	jne	LBB5_2
LBB5_5:
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
	je	LBB7_3
## %bb.1:
	xorl	%r12d, %r12d
	leaq	_toupperversion+24(%rip), %rbx
	.p2align	4, 0x90
LBB7_2:                                 ## =>This Inner Loop Header: Depth=1
	movl	%r15d, %edi
	movl	%r14d, %esi
	movl	%r12d, %edx
	callq	_run_toupper
	movq	(%rbx), %rcx
	addl	$1, %r12d
	addq	$16, %rbx
	testq	%rcx, %rcx
	jne	LBB7_2
LBB7_3:
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
	cmpl	$0, _no_sz(%rip)
	jle	LBB8_9
## %bb.1:
	xorl	%ecx, %ecx
	.p2align	4, 0x90
LBB8_2:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB8_4 Depth 2
                                        ##       Child Loop BB8_6 Depth 3
	cmpl	$0, _no_ratio(%rip)
	jle	LBB8_8
## %bb.3:                               ##   in Loop: Header=BB8_2 Depth=1
	xorl	%r13d, %r13d
	movq	%rcx, -48(%rbp)         ## 8-byte Spill
	.p2align	4, 0x90
LBB8_4:                                 ##   Parent Loop BB8_2 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB8_6 Depth 3
	movq	_sizes@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	(%rax,%rcx,8), %rsi
	movq	_ratios@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	vmovsd	(%rax,%r13,8), %xmm0    ## xmm0 = mem[0],zero
	movb	$1, %al
	leaq	L_.str.6(%rip), %rdi
	callq	_printf
	cmpl	$0, _no_version(%rip)
	movq	_results@GOTPCREL(%rip), %r15
	movq	%r15, %rcx
	leaq	L_.str.7(%rip), %rbx
	jle	LBB8_7
## %bb.5:                               ##   in Loop: Header=BB8_4 Depth=2
	leaq	_toupperversion(%rip), %r14
	xorl	%r12d, %r12d
	.p2align	4, 0x90
LBB8_6:                                 ##   Parent Loop BB8_2 Depth=1
                                        ##     Parent Loop BB8_4 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	movl	_no_sz(%rip), %eax
	imull	%r12d, %eax
	addl	-48(%rbp), %eax         ## 4-byte Folded Reload
	imull	_no_ratio(%rip), %eax
	addl	%r13d, %eax
	movq	(%r14), %rsi
	movq	%rcx, %r15
	movq	(%r15), %rcx
	cltq
	vmovsd	(%rcx,%rax,8), %xmm0    ## xmm0 = mem[0],zero
	movb	$1, %al
	movq	%rbx, %rdi
	callq	_printf
	movq	%r15, %rcx
	addq	$1, %r12
	movslq	_no_version(%rip), %rax
	addq	$16, %r14
	cmpq	%rax, %r12
	jl	LBB8_6
LBB8_7:                                 ##   in Loop: Header=BB8_4 Depth=2
	movl	$10, %edi
	callq	_putchar
	addq	$1, %r13
	movslq	_no_ratio(%rip), %rax
	cmpq	%rax, %r13
	movq	-48(%rbp), %rcx         ## 8-byte Reload
	jl	LBB8_4
LBB8_8:                                 ##   in Loop: Header=BB8_2 Depth=1
	addq	$1, %rcx
	movslq	_no_sz(%rip), %rax
	cmpq	%rax, %rcx
	jl	LBB8_2
LBB8_9:
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
	.globl	_main                   ## -- Begin function main
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
	subq	$72, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	xorl	%r13d, %r13d
	cmpl	$2, %edi
	jl	LBB9_16
## %bb.1:
	movl	%edi, -76(%rbp)         ## 4-byte Spill
	movslq	%edi, %rax
	movq	%rax, -112(%rbp)        ## 8-byte Spill
	movl	$50, %r15d
	xorl	%eax, %eax
	movq	%rax, -96(%rbp)         ## 8-byte Spill
	movl	$1, -52(%rbp)           ## 4-byte Folded Spill
	movl	$3, -56(%rbp)           ## 4-byte Folded Spill
	movl	$10000, %eax            ## imm = 0x2710
	movq	%rax, -88(%rbp)         ## 8-byte Spill
	movl	$800000, %r12d          ## imm = 0xC3500
	movl	$1, %ebx
	xorl	%eax, %eax
	movq	%rsi, -72(%rbp)         ## 8-byte Spill
	.p2align	4, 0x90
LBB9_2:                                 ## =>This Inner Loop Header: Depth=1
	movq	%rax, -48(%rbp)         ## 8-byte Spill
	movq	%rbx, -64(%rbp)         ## 8-byte Spill
	movq	(%rsi,%rbx,8), %rbx
	leaq	L_.str.9(%rip), %rdi
	movq	%rbx, %rsi
	callq	_strcmp
	testl	%eax, %eax
	jne	LBB9_4
## %bb.3:                               ##   in Loop: Header=BB9_2 Depth=1
	movl	$1, _debug(%rip)
LBB9_4:                                 ##   in Loop: Header=BB9_2 Depth=1
	leaq	L_.str.10(%rip), %rdi
	movq	%rbx, %rsi
	callq	_strcmp
	testl	%eax, %eax
	jne	LBB9_9
## %bb.5:                               ##   in Loop: Header=BB9_2 Depth=1
	movq	%rbx, -104(%rbp)        ## 8-byte Spill
	movq	-72(%rbp), %r14         ## 8-byte Reload
	movq	-64(%rbp), %rbx         ## 8-byte Reload
	movq	8(%r14,%rbx,8), %rdi
	callq	_atoi
	movslq	%eax, %r12
	movl	-56(%rbp), %eax         ## 4-byte Reload
	cmpl	-76(%rbp), %eax         ## 4-byte Folded Reload
	jge	LBB9_38
## %bb.6:                               ##   in Loop: Header=BB9_2 Depth=1
	movq	16(%r14,%rbx,8), %r14
	leaq	L_.str.11(%rip), %rdi
	movq	%r14, %rsi
	callq	_strcmp
	testl	%eax, %eax
	je	LBB9_38
## %bb.7:                               ##   in Loop: Header=BB9_2 Depth=1
	leaq	L_.str.9(%rip), %rdi
	movq	%r14, %rsi
	callq	_strcmp
	testl	%eax, %eax
	je	LBB9_38
## %bb.8:                               ##   in Loop: Header=BB9_2 Depth=1
	movq	%r14, %rdi
	callq	_atoi
	cltq
	movq	%rax, -48(%rbp)         ## 8-byte Spill
	movq	-72(%rbp), %rax         ## 8-byte Reload
	movq	-64(%rbp), %rcx         ## 8-byte Reload
	movq	24(%rax,%rcx,8), %rdi
	callq	_atoi
	cltq
	movq	%rax, -88(%rbp)         ## 8-byte Spill
	movq	-104(%rbp), %rbx        ## 8-byte Reload
LBB9_9:                                 ##   in Loop: Header=BB9_2 Depth=1
	leaq	L_.str.11(%rip), %rdi
	movq	%rbx, %rsi
	callq	_strcmp
	testl	%eax, %eax
	je	LBB9_11
## %bb.10:                              ##   in Loop: Header=BB9_2 Depth=1
	movq	-48(%rbp), %rax         ## 8-byte Reload
	movq	-72(%rbp), %rsi         ## 8-byte Reload
	movq	-64(%rbp), %rbx         ## 8-byte Reload
	jmp	LBB9_15
	.p2align	4, 0x90
LBB9_11:                                ##   in Loop: Header=BB9_2 Depth=1
	movq	-72(%rbp), %r14         ## 8-byte Reload
	movq	-64(%rbp), %rbx         ## 8-byte Reload
	movq	8(%r14,%rbx,8), %rdi
	callq	_atoi
	movl	%eax, %r15d
	movl	-56(%rbp), %eax         ## 4-byte Reload
	cmpl	-76(%rbp), %eax         ## 4-byte Folded Reload
	jge	LBB9_38
## %bb.12:                              ##   in Loop: Header=BB9_2 Depth=1
	movq	16(%r14,%rbx,8), %r14
	leaq	L_.str.10(%rip), %rdi
	movq	%r14, %rsi
	callq	_strcmp
	testl	%eax, %eax
	je	LBB9_38
## %bb.13:                              ##   in Loop: Header=BB9_2 Depth=1
	leaq	L_.str.9(%rip), %rdi
	movq	%r14, %rsi
	callq	_strcmp
	testl	%eax, %eax
	je	LBB9_38
## %bb.14:                              ##   in Loop: Header=BB9_2 Depth=1
	movq	%r14, %rdi
	callq	_atoi
                                        ## kill: def %eax killed %eax def %rax
	movq	%rax, -96(%rbp)         ## 8-byte Spill
	movq	-72(%rbp), %r14         ## 8-byte Reload
	movq	24(%r14,%rbx,8), %rdi
	callq	_atoi
	movq	%r14, %rsi
	movl	%eax, -52(%rbp)         ## 4-byte Spill
	movq	-48(%rbp), %rax         ## 8-byte Reload
LBB9_15:                                ##   in Loop: Header=BB9_2 Depth=1
	addq	$1, %rbx
	addl	$1, -56(%rbp)           ## 4-byte Folded Spill
	cmpq	-112(%rbp), %rbx        ## 8-byte Folded Reload
	jl	LBB9_2
	jmp	LBB9_17
LBB9_16:
	movl	$50, %r15d
	movl	$1, -52(%rbp)           ## 4-byte Folded Spill
	movl	$800000, %r12d          ## imm = 0xC3500
	movl	$10000, %eax            ## imm = 0x2710
	movq	%rax, -88(%rbp)         ## 8-byte Spill
	movl	$0, %eax
	movq	%rax, -96(%rbp)         ## 8-byte Spill
	xorl	%eax, %eax
LBB9_17:
	cmpq	$0, _toupperversion+8(%rip)
	jne	LBB9_18
	jmp	LBB9_21
LBB9_38:
	movq	-48(%rbp), %rax         ## 8-byte Reload
	cmpq	$0, _toupperversion+8(%rip)
	je	LBB9_21
LBB9_18:
	xorl	%r13d, %r13d
	leaq	_toupperversion+24(%rip), %rcx
	.p2align	4, 0x90
LBB9_19:                                ## =>This Inner Loop Header: Depth=1
	addl	$1, %r13d
	cmpq	$0, (%rcx)
	leaq	16(%rcx), %rcx
	jne	LBB9_19
## %bb.20:
	movl	%r13d, _no_version(%rip)
LBB9_21:
	movl	$1, %r14d
	movl	$1, %ecx
	testq	%rax, %rax
	je	LBB9_23
## %bb.22:
	subq	%r12, %rax
	xorl	%edx, %edx
	divq	-88(%rbp)               ## 8-byte Folded Reload
	movq	%rax, %rcx
	addl	$1, %ecx
LBB9_23:
	movl	%ecx, _no_sz(%rip)
	movq	-96(%rbp), %rax         ## 8-byte Reload
	testl	%eax, %eax
	je	LBB9_25
## %bb.24:
	subl	%r15d, %eax
                                        ## kill: def %eax killed %eax killed %rax
	cltd
	idivl	-52(%rbp)               ## 4-byte Folded Reload
	movl	%eax, %r14d
	addl	$1, %r14d
LBB9_25:
	movl	%r14d, _no_ratio(%rip)
	imull	%ecx, %r13d
	imull	%r14d, %r13d
	shlq	$3, %r13
	movq	%r13, %rdi
	movq	%rcx, %r13
	callq	_malloc
	movq	_results@GOTPCREL(%rip), %rcx
	movq	%rax, (%rcx)
	movl	%r14d, -64(%rbp)        ## 4-byte Spill
	movl	%r14d, %ebx
	leaq	(,%rbx,8), %rdi
	callq	_malloc
	movq	_ratios@GOTPCREL(%rip), %rcx
	movq	%rax, (%rcx)
	movl	%r13d, %r14d
	leaq	(,%r14,8), %rdi
	callq	_malloc
	movq	_sizes@GOTPCREL(%rip), %rcx
	movq	%rax, (%rcx)
	testl	%r13d, %r13d
	movq	-88(%rbp), %rdx         ## 8-byte Reload
	jle	LBB9_28
## %bb.26:
	movq	(%rcx), %rax
	.p2align	4, 0x90
LBB9_27:                                ## =>This Inner Loop Header: Depth=1
	movq	%r12, (%rax)
	addq	$8, %rax
	addq	%rdx, %r12
	addq	$-1, %r14
	jne	LBB9_27
LBB9_28:
	cmpl	$0, -64(%rbp)           ## 4-byte Folded Reload
	movl	-52(%rbp), %ecx         ## 4-byte Reload
	jle	LBB9_31
## %bb.29:
	movq	_ratios@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	.p2align	4, 0x90
LBB9_30:                                ## =>This Inner Loop Header: Depth=1
	vcvtsi2sdl	%r15d, %xmm1, %xmm0
	vmovsd	%xmm0, (%rax)
	addq	$8, %rax
	addl	%ecx, %r15d
	addq	$-1, %rbx
	jne	LBB9_30
LBB9_31:
	cmpl	$0, _no_sz(%rip)
	jle	LBB9_37
## %bb.32:
	xorl	%r14d, %r14d
	.p2align	4, 0x90
LBB9_33:                                ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB9_35 Depth 2
	cmpl	$0, _no_ratio(%rip)
	jle	LBB9_36
## %bb.34:                              ##   in Loop: Header=BB9_33 Depth=1
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB9_35:                                ##   Parent Loop BB9_33 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	%r14d, %edi
	movl	%ebx, %esi
	callq	_run
	addl	$1, %ebx
	cmpl	_no_ratio(%rip), %ebx
	jl	LBB9_35
LBB9_36:                                ##   in Loop: Header=BB9_33 Depth=1
	addl	$1, %r14d
	cmpl	_no_sz(%rip), %r14d
	jl	LBB9_33
LBB9_37:
	callq	_printresults
	xorl	%eax, %eax
	addq	$72, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
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
	.asciz	"VARIANT2: gcc -lm -march=native toupper.c -O1"

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
