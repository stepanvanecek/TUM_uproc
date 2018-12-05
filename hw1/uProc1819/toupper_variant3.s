	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 13
	.globl	_mymalloc
	.p2align	4, 0x90
_mymalloc:                              ## @mymalloc
	.cfi_startproc
## BB#0:
	pushq	%rbp
Lcfi0:
	.cfi_def_cfa_offset 16
Lcfi1:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Lcfi2:
	.cfi_def_cfa_register %rbp
	addq	$32, %rdi
	callq	_malloc
	addq	$16, %rax
	andq	$-16, %rax
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_createChar
	.p2align	4, 0x90
_createChar:                            ## @createChar
	.cfi_startproc
## BB#0:
	pushq	%rbp
Lcfi3:
	.cfi_def_cfa_offset 16
Lcfi4:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Lcfi5:
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	pushq	%rax
Lcfi6:
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
	movl	$64, %eax
	movl	$96, %ebx
	cmovll	%eax, %ebx
	callq	_rand
	cltq
	imulq	$1321528399, %rax, %rcx ## imm = 0x4EC4EC4F
	movq	%rcx, %rdx
	shrq	$63, %rdx
	sarq	$35, %rcx
	addl	%edx, %ecx
	imull	$26, %ecx, %ecx
	subl	%ecx, %eax
	leal	1(%rbx,%rax), %eax
	movsbl	%al, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_init
	.p2align	4, 0x90
_init:                                  ## @init
	.cfi_startproc
## BB#0:
	pushq	%rbp
Lcfi7:
	.cfi_def_cfa_offset 16
Lcfi8:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Lcfi9:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
Lcfi10:
	.cfi_offset %rbx, -56
Lcfi11:
	.cfi_offset %r12, -48
Lcfi12:
	.cfi_offset %r13, -40
Lcfi13:
	.cfi_offset %r14, -32
Lcfi14:
	.cfi_offset %r15, -24
	movl	%esi, %r14d
	movq	%rdi, %r15
	leaq	33(%r15), %rdi
	callq	_malloc
	movq	%rax, %r12
	addq	$16, %r12
	andq	$-16, %r12
	movl	$1, %edi
	callq	_srand
	xorl	%ebx, %ebx
	testq	%r15, %r15
	je	LBB2_2
	.p2align	4, 0x90
LBB2_1:                                 ## =>This Inner Loop Header: Depth=1
	callq	_rand
	cltq
	imulq	$1374389535, %rax, %rcx ## imm = 0x51EB851F
	movq	%rcx, %rdx
	shrq	$63, %rdx
	sarq	$37, %rcx
	addl	%edx, %ecx
	imull	$100, %ecx, %ecx
	subl	%ecx, %eax
	cmpl	%r14d, %eax
	movl	$96, %r13d
	movl	$64, %eax
	cmovll	%eax, %r13d
	callq	_rand
	cltq
	imulq	$1321528399, %rax, %rcx ## imm = 0x4EC4EC4F
	movq	%rcx, %rdx
	shrq	$63, %rdx
	sarq	$35, %rcx
	addl	%edx, %ecx
	imull	$26, %ecx, %ecx
	subl	%ecx, %eax
	leal	1(%r13,%rax), %eax
	movb	%al, (%r12,%rbx)
	addq	$1, %rbx
	cmpq	%r15, %rbx
	jb	LBB2_1
LBB2_2:
	movb	$0, (%r12,%rbx)
	movq	%r12, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_run_toupper
	.p2align	4, 0x90
_run_toupper:                           ## @run_toupper
	.cfi_startproc
## BB#0:
	pushq	%rbp
Lcfi15:
	.cfi_def_cfa_offset 16
Lcfi16:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Lcfi17:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$40, %rsp
Lcfi18:
	.cfi_offset %rbx, -56
Lcfi19:
	.cfi_offset %r12, -48
Lcfi20:
	.cfi_offset %r13, -40
Lcfi21:
	.cfi_offset %r14, -32
Lcfi22:
	.cfi_offset %r15, -24
	movl	%edx, %r14d
	imull	_no_sz(%rip), %r14d
	addl	%edi, %r14d
	imull	_no_ratio(%rip), %r14d
	movq	%rcx, %r12
	movq	_sizes@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movslq	%edi, %rcx
	movq	(%rax,%rcx,8), %rbx
	movq	_ratios@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movl	%esi, -56(%rbp)         ## 4-byte Spill
	movslq	%esi, %rcx
	vcvttsd2si	(%rax,%rcx,8), %r15d
	leaq	33(%rbx), %rdi
	callq	_malloc
	movq	%rax, %r13
	addq	$16, %r13
	andq	$-16, %r13
	movl	$1, %edi
	callq	_srand
	testq	%rbx, %rbx
	je	LBB3_1
## BB#2:
	movq	%r12, -64(%rbp)         ## 8-byte Spill
	movl	%r14d, -48(%rbp)        ## 4-byte Spill
	xorl	%r12d, %r12d
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
	movl	$96, %r14d
	movl	$64, %eax
	cmovll	%eax, %r14d
	callq	_rand
	cltq
	imulq	$1321528399, %rax, %rcx ## imm = 0x4EC4EC4F
	movq	%rcx, %rdx
	shrq	$63, %rdx
	sarq	$35, %rcx
	addl	%edx, %ecx
	imull	$26, %ecx, %ecx
	subl	%ecx, %eax
	leal	1(%r14,%rax), %eax
	movb	%al, (%r13,%r12)
	addq	$1, %r12
	cmpq	%r12, %rbx
	jne	LBB3_3
## BB#4:
	movl	-48(%rbp), %r14d        ## 4-byte Reload
	movq	-64(%rbp), %r12         ## 8-byte Reload
	jmp	LBB3_5
LBB3_1:
	xorl	%ebx, %ebx
LBB3_5:
	movb	$0, (%r13,%rbx)
	cmpl	$0, _debug(%rip)
	je	LBB3_7
## BB#6:
	leaq	L_.str(%rip), %rdi
	xorl	%eax, %eax
	movq	%r13, %rsi
	callq	_printf
LBB3_7:
	leaq	-80(%rbp), %rsi
	xorl	%edi, %edi
	callq	_clock_gettime
	movabsq	$2361183241434822607, %rax ## imm = 0x20C49BA5E353F7CF
	imulq	-72(%rbp)
	movq	%rdx, %rax
	shrq	$63, %rax
	sarq	$7, %rdx
	addq	%rax, %rdx
	vcvtsi2sdq	%rdx, %xmm0, %xmm0
	cmpl	$0, _debug(%rip)
	vmovsd	%xmm0, -48(%rbp)        ## 8-byte Spill
	je	LBB3_9
## BB#8:
	leaq	L_.str.1(%rip), %rdi
	movb	$1, %al
	vmovsd	-48(%rbp), %xmm0        ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	callq	_printf
LBB3_9:
	addl	-56(%rbp), %r14d        ## 4-byte Folded Reload
	movq	%r13, %rdi
	callq	*%r12
	leaq	-80(%rbp), %rsi
	xorl	%edi, %edi
	callq	_clock_gettime
	movabsq	$2361183241434822607, %rax ## imm = 0x20C49BA5E353F7CF
	imulq	-72(%rbp)
	movq	%rdx, %rax
	shrq	$63, %rax
	sarq	$7, %rdx
	addq	%rax, %rdx
	vcvtsi2sdq	%rdx, %xmm1, %xmm0
	cmpl	$0, _debug(%rip)
	je	LBB3_10
## BB#11:
	leaq	L_.str.2(%rip), %rdi
	movb	$1, %al
	vmovsd	%xmm0, -56(%rbp)        ## 8-byte Spill
	callq	_printf
	cmpl	$0, _debug(%rip)
	vmovsd	-56(%rbp), %xmm0        ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	vsubsd	-48(%rbp), %xmm0, %xmm0 ## 8-byte Folded Reload
	movq	_results@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movslq	%r14d, %rcx
	vmovsd	%xmm0, (%rax,%rcx,8)
	je	LBB3_14
## BB#12:
	leaq	L_.str.3(%rip), %rdi
	movb	$1, %al
	callq	_printf
	cmpl	$0, _debug(%rip)
	je	LBB3_14
## BB#13:
	leaq	L_.str.4(%rip), %rdi
	xorl	%eax, %eax
	movq	%r13, %rsi
	callq	_printf
	jmp	LBB3_14
LBB3_10:
	vsubsd	-48(%rbp), %xmm0, %xmm0 ## 8-byte Folded Reload
	movq	_results@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movslq	%r14d, %rcx
	vmovsd	%xmm0, (%rax,%rcx,8)
LBB3_14:
	addq	$40, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc

	.p2align	4, 0x90
_toupper_simple:                        ## @toupper_simple
	.cfi_startproc
## BB#0:
	pushq	%rbp
Lcfi23:
	.cfi_def_cfa_offset 16
Lcfi24:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Lcfi25:
	.cfi_def_cfa_register %rbp
	movb	(%rdi), %al
	testb	%al, %al
	je	LBB4_5
## BB#1:
	addq	$1, %rdi
	.p2align	4, 0x90
LBB4_2:                                 ## =>This Inner Loop Header: Depth=1
	movl	%eax, %ecx
	addb	$-97, %cl
	cmpb	$25, %cl
	ja	LBB4_4
## BB#3:                                ##   in Loop: Header=BB4_2 Depth=1
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

	.p2align	4, 0x90
_toupper_optimised:                     ## @toupper_optimised
	.cfi_startproc
## BB#0:
	pushq	%rbp
Lcfi26:
	.cfi_def_cfa_offset 16
Lcfi27:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Lcfi28:
	.cfi_def_cfa_register %rbp
	pushq	%rbx
Lcfi29:
	.cfi_offset %rbx, -24
	movq	%rdi, %r8
	movb	(%r8), %al
	testb	%al, %al
	je	LBB5_3
## BB#1:
	xorl	%edi, %edi
	movq	%r8, %rsi
	.p2align	4, 0x90
LBB5_2:                                 ## =>This Inner Loop Header: Depth=1
	movsbl	%al, %eax
	movl	$96, %ebx
	movl	$123, %ecx
	xorl	%edx, %edx
	## InlineAsm Start
	cmpl	%ebx, %eax
	jg	GREATER
	jmp	REST
GREATER:
	cmpl	%ecx, %eax
	jg	REST
	incl	%edx
REST:
	cmpl	$0, %edx
	jg	DEC
	jmp	END
DEC:
	subl	$32, %eax
END:
	## InlineAsm End
	movb	%al, (%rsi)
	movl	%edi, %eax
	## InlineAsm Start
	incl	%eax

	## InlineAsm End
	movl	%eax, %edi
	movslq	%edi, %rax
	leaq	(%r8,%rax), %rsi
	movzbl	(%r8,%rax), %eax
	testb	%al, %al
	jne	LBB5_2
LBB5_3:
	cmpl	$0, _debug(%rip)
	je	LBB5_4
## BB#5:
	leaq	L_.str.15(%rip), %rdi
	xorl	%eax, %eax
	movq	%r8, %rsi
	popq	%rbx
	popq	%rbp
	jmp	_printf                 ## TAILCALL
LBB5_4:
	popq	%rbx
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_run
	.p2align	4, 0x90
_run:                                   ## @run
	.cfi_startproc
## BB#0:
	pushq	%rbp
Lcfi30:
	.cfi_def_cfa_offset 16
Lcfi31:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Lcfi32:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
Lcfi33:
	.cfi_offset %rbx, -48
Lcfi34:
	.cfi_offset %r12, -40
Lcfi35:
	.cfi_offset %r14, -32
Lcfi36:
	.cfi_offset %r15, -24
	movl	%esi, %r14d
	movl	%edi, %r15d
	movq	_toupperversion+8(%rip), %rcx
	testq	%rcx, %rcx
	je	LBB6_3
## BB#1:
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

	.globl	_printresults
	.p2align	4, 0x90
_printresults:                          ## @printresults
	.cfi_startproc
## BB#0:
	pushq	%rbp
Lcfi37:
	.cfi_def_cfa_offset 16
Lcfi38:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Lcfi39:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
Lcfi40:
	.cfi_offset %rbx, -56
Lcfi41:
	.cfi_offset %r12, -48
Lcfi42:
	.cfi_offset %r13, -40
Lcfi43:
	.cfi_offset %r14, -32
Lcfi44:
	.cfi_offset %r15, -24
	leaq	L_.str.8(%rip), %rdi
	callq	_puts
	movl	_no_sz(%rip), %ecx
	testl	%ecx, %ecx
	jle	LBB7_10
## BB#1:
	movl	_no_ratio(%rip), %eax
	xorl	%esi, %esi
	.p2align	4, 0x90
LBB7_2:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB7_4 Depth 2
                                        ##       Child Loop BB7_6 Depth 3
	testl	%eax, %eax
	jle	LBB7_9
## BB#3:                                ##   in Loop: Header=BB7_2 Depth=1
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
	leaq	L_.str.9(%rip), %rdi
	callq	_printf
	cmpl	$0, _no_version(%rip)
	movq	_results@GOTPCREL(%rip), %r15
	leaq	L_.str.10(%rip), %rbx
	jle	LBB7_7
## BB#5:                                ##   in Loop: Header=BB7_4 Depth=2
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
## BB#8:                                ##   in Loop: Header=BB7_2 Depth=1
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

	.section	__TEXT,__const
	.p2align	5
LCPI8_0:
	.quad	0                       ## 0x0
	.quad	1                       ## 0x1
	.quad	2                       ## 0x2
	.quad	3                       ## 0x3
LCPI8_1:
	.quad	4                       ## 0x4
	.quad	5                       ## 0x5
	.quad	6                       ## 0x6
	.quad	7                       ## 0x7
LCPI8_2:
	.quad	8                       ## 0x8
	.quad	9                       ## 0x9
	.quad	10                      ## 0xa
	.quad	11                      ## 0xb
LCPI8_3:
	.quad	12                      ## 0xc
	.quad	13                      ## 0xd
	.quad	14                      ## 0xe
	.quad	15                      ## 0xf
LCPI8_4:
	.quad	16                      ## 0x10
	.quad	17                      ## 0x11
	.quad	18                      ## 0x12
	.quad	19                      ## 0x13
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3
LCPI8_5:
	.quad	4                       ## 0x4
LCPI8_6:
	.quad	8                       ## 0x8
LCPI8_7:
	.quad	12                      ## 0xc
LCPI8_8:
	.quad	16                      ## 0x10
LCPI8_9:
	.quad	20                      ## 0x14
LCPI8_10:
	.quad	24                      ## 0x18
LCPI8_11:
	.quad	28                      ## 0x1c
LCPI8_12:
	.quad	32                      ## 0x20
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## BB#0:
	pushq	%rbp
Lcfi45:
	.cfi_def_cfa_offset 16
Lcfi46:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Lcfi47:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	andq	$-32, %rsp
	subq	$160, %rsp
Lcfi48:
	.cfi_offset %rbx, -56
Lcfi49:
	.cfi_offset %r12, -48
Lcfi50:
	.cfi_offset %r13, -40
Lcfi51:
	.cfi_offset %r14, -32
Lcfi52:
	.cfi_offset %r15, -24
	xorl	%r13d, %r13d
	cmpl	$2, %edi
	jl	LBB8_15
## BB#1:
	movq	%rsi, 96(%rsp)          ## 8-byte Spill
	movslq	%edi, %r12
	movl	$50, 8(%rsp)            ## 4-byte Folded Spill
	xorl	%eax, %eax
	movq	%rax, 16(%rsp)          ## 8-byte Spill
	movl	$1, 12(%rsp)            ## 4-byte Folded Spill
	movl	$10000, %ebx            ## imm = 0x2710
	movl	$800000, %r15d          ## imm = 0xC3500
	movl	$3, %r14d
	xorl	%eax, %eax
	movq	%rax, 24(%rsp)          ## 8-byte Spill
	movq	%r12, 88(%rsp)          ## 8-byte Spill
	.p2align	4, 0x90
LBB8_2:                                 ## =>This Inner Loop Header: Depth=1
	movq	%rbx, 32(%rsp)          ## 8-byte Spill
	movq	96(%rsp), %rax          ## 8-byte Reload
	movq	-16(%rax,%r14,8), %rbx
	leaq	L_.str.12(%rip), %rdi
	movq	%rbx, %rsi
	callq	_strcmp
	testl	%eax, %eax
	jne	LBB8_4
## BB#3:                                ##   in Loop: Header=BB8_2 Depth=1
	movl	$1, _debug(%rip)
LBB8_4:                                 ##   in Loop: Header=BB8_2 Depth=1
	leaq	L_.str.13(%rip), %rdi
	movq	%rbx, %rsi
	callq	_strcmp
	testl	%eax, %eax
	jne	LBB8_9
## BB#5:                                ##   in Loop: Header=BB8_2 Depth=1
	movq	96(%rsp), %r12          ## 8-byte Reload
	movq	-8(%r12,%r14,8), %rdi
	callq	_atoi
	movslq	%eax, %r15
	cmpq	88(%rsp), %r14          ## 8-byte Folded Reload
	jge	LBB8_61
## BB#6:                                ##   in Loop: Header=BB8_2 Depth=1
	movq	(%r12,%r14,8), %r12
	leaq	L_.str.14(%rip), %rdi
	movq	%r12, %rsi
	callq	_strcmp
	testl	%eax, %eax
	je	LBB8_61
## BB#7:                                ##   in Loop: Header=BB8_2 Depth=1
	leaq	L_.str.12(%rip), %rdi
	movq	%r12, %rsi
	callq	_strcmp
	testl	%eax, %eax
	je	LBB8_61
## BB#8:                                ##   in Loop: Header=BB8_2 Depth=1
	movq	%r12, %rdi
	callq	_atoi
	cltq
	movq	%rax, 24(%rsp)          ## 8-byte Spill
	movq	96(%rsp), %rax          ## 8-byte Reload
	movq	8(%rax,%r14,8), %rdi
	callq	_atoi
	cltq
	movq	%rax, 32(%rsp)          ## 8-byte Spill
	movq	88(%rsp), %r12          ## 8-byte Reload
LBB8_9:                                 ##   in Loop: Header=BB8_2 Depth=1
	leaq	L_.str.14(%rip), %rdi
	movq	%rbx, %rsi
	callq	_strcmp
	testl	%eax, %eax
	jne	LBB8_14
## BB#10:                               ##   in Loop: Header=BB8_2 Depth=1
	movq	96(%rsp), %rbx          ## 8-byte Reload
	movq	-8(%rbx,%r14,8), %rdi
	callq	_atoi
	movl	%eax, 8(%rsp)           ## 4-byte Spill
	cmpq	%r12, %r14
	jge	LBB8_61
## BB#11:                               ##   in Loop: Header=BB8_2 Depth=1
	movq	(%rbx,%r14,8), %rbx
	leaq	L_.str.13(%rip), %rdi
	movq	%rbx, %rsi
	callq	_strcmp
	testl	%eax, %eax
	je	LBB8_61
## BB#12:                               ##   in Loop: Header=BB8_2 Depth=1
	leaq	L_.str.12(%rip), %rdi
	movq	%rbx, %rsi
	callq	_strcmp
	testl	%eax, %eax
	je	LBB8_61
## BB#13:                               ##   in Loop: Header=BB8_2 Depth=1
	movq	%rbx, %rdi
	callq	_atoi
                                        ## kill: %EAX<def> %EAX<kill> %RAX<def>
	movq	%rax, 16(%rsp)          ## 8-byte Spill
	movq	96(%rsp), %rax          ## 8-byte Reload
	movq	8(%rax,%r14,8), %rdi
	callq	_atoi
	movl	%eax, 12(%rsp)          ## 4-byte Spill
LBB8_14:                                ##   in Loop: Header=BB8_2 Depth=1
	movq	32(%rsp), %rbx          ## 8-byte Reload
	leaq	1(%r14), %rax
	addq	$-1, %r14
	cmpq	%r12, %r14
	movq	%rax, %r14
	jl	LBB8_2
	jmp	LBB8_16
LBB8_15:
	movl	$50, 8(%rsp)            ## 4-byte Folded Spill
	movl	$1, 12(%rsp)            ## 4-byte Folded Spill
	movl	$800000, %r15d          ## imm = 0xC3500
	movl	$10000, %ebx            ## imm = 0x2710
	movl	$0, %eax
	movq	%rax, 16(%rsp)          ## 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, 24(%rsp)          ## 8-byte Spill
	jmp	LBB8_16
LBB8_61:
	movq	32(%rsp), %rbx          ## 8-byte Reload
LBB8_16:
	movq	24(%rsp), %rcx          ## 8-byte Reload
	cmpq	$0, _toupperversion+8(%rip)
	je	LBB8_20
## BB#17:
	xorl	%r13d, %r13d
	leaq	_toupperversion+24(%rip), %rax
	.p2align	4, 0x90
LBB8_18:                                ## =>This Inner Loop Header: Depth=1
	addl	$1, %r13d
	cmpq	$0, (%rax)
	leaq	16(%rax), %rax
	jne	LBB8_18
## BB#19:
	movl	%r13d, _no_version(%rip)
LBB8_20:
	movl	$1, %r14d
	movl	$1, %r12d
	testq	%rcx, %rcx
	movq	16(%rsp), %rax          ## 8-byte Reload
	je	LBB8_25
## BB#21:
	subq	%r15, %rcx
	movq	%rcx, %rax
	orq	%rbx, %rax
	shrq	$32, %rax
	movq	%rcx, %rax
	je	LBB8_23
## BB#22:
	xorl	%edx, %edx
	divq	%rbx
	movq	%rax, %r12
	jmp	LBB8_24
LBB8_23:
	xorl	%edx, %edx
                                        ## kill: %EAX<def> %EAX<kill> %RAX<kill>
	divl	%ebx
	movl	%eax, %r12d
LBB8_24:
	movq	16(%rsp), %rax          ## 8-byte Reload
	addl	$1, %r12d
LBB8_25:
	movl	%r12d, _no_sz(%rip)
	testl	%eax, %eax
	je	LBB8_27
## BB#26:
	subl	8(%rsp), %eax           ## 4-byte Folded Reload
                                        ## kill: %EAX<def> %EAX<kill> %RAX<kill>
	cltd
	idivl	12(%rsp)                ## 4-byte Folded Reload
	movl	%eax, %r14d
	addl	$1, %r14d
LBB8_27:
	movl	%r14d, _no_ratio(%rip)
	imull	%r14d, %r13d
	imull	%r12d, %r13d
	shlq	$3, %r13
	movq	%r13, %rdi
	callq	_malloc
	movq	_results@GOTPCREL(%rip), %rcx
	movq	%rax, (%rcx)
	movl	%r14d, %edi
	shlq	$3, %rdi
	callq	_malloc
	movq	%rax, %r13
	movq	_ratios@GOTPCREL(%rip), %rax
	movq	%r13, (%rax)
	movl	%r12d, %edi
	shlq	$3, %rdi
	callq	_malloc
	movq	_sizes@GOTPCREL(%rip), %rcx
	movq	%rax, (%rcx)
	testl	%r12d, %r12d
	jle	LBB8_35
## BB#28:
	movslq	%r12d, %rcx
	cmpl	$15, %r12d
	jbe	LBB8_32
## BB#29:
	movq	%rcx, %rdx
	andq	$-16, %rdx
	je	LBB8_32
## BB#30:
	vmovq	%rbx, %xmm0
	vpbroadcastq	%xmm0, %ymm0
	vmovq	%r15, %xmm1
	vpbroadcastq	%xmm1, %ymm1
	leaq	-16(%rdx), %rdi
	movq	%rdi, %rsi
	shrq	$4, %rsi
	vmovdqa	LCPI8_0(%rip), %ymm2    ## ymm2 = [0,1,2,3]
	btl	$4, %edi
	jb	LBB8_56
## BB#31:
	vpmuludq	%ymm2, %ymm0, %ymm3
	vpsrlq	$32, %ymm0, %ymm4
	vpmuludq	%ymm2, %ymm4, %ymm2
	vpsllq	$32, %ymm2, %ymm2
	vpaddq	%ymm2, %ymm3, %ymm2
	vmovdqa	LCPI8_1(%rip), %ymm3    ## ymm3 = [4,5,6,7]
	vpmuludq	%ymm3, %ymm0, %ymm5
	vpmuludq	%ymm3, %ymm4, %ymm3
	vpsllq	$32, %ymm3, %ymm3
	vpaddq	%ymm3, %ymm5, %ymm3
	vmovdqa	LCPI8_2(%rip), %ymm5    ## ymm5 = [8,9,10,11]
	vpmuludq	%ymm5, %ymm0, %ymm6
	vpmuludq	%ymm5, %ymm4, %ymm5
	vpsllq	$32, %ymm5, %ymm5
	vpaddq	%ymm5, %ymm6, %ymm5
	vmovdqa	LCPI8_3(%rip), %ymm6    ## ymm6 = [12,13,14,15]
	vpmuludq	%ymm6, %ymm0, %ymm7
	vpmuludq	%ymm6, %ymm4, %ymm4
	vpsllq	$32, %ymm4, %ymm4
	vpaddq	%ymm4, %ymm7, %ymm4
	vpaddq	%ymm1, %ymm2, %ymm2
	vpaddq	%ymm1, %ymm3, %ymm3
	vpaddq	%ymm1, %ymm5, %ymm5
	vpaddq	%ymm1, %ymm4, %ymm4
	vmovdqu	%ymm2, (%rax)
	vmovdqu	%ymm3, 32(%rax)
	vmovdqu	%ymm5, 64(%rax)
	vmovdqu	%ymm4, 96(%rax)
	vmovdqa	LCPI8_4(%rip), %ymm2    ## ymm2 = [16,17,18,19]
	movl	$16, %edi
	testq	%rsi, %rsi
	jne	LBB8_57
	jmp	LBB8_59
LBB8_32:
	xorl	%edx, %edx
LBB8_33:
	movq	%rdx, %rsi
	imulq	%rbx, %rsi
	addq	%rsi, %r15
	.p2align	4, 0x90
LBB8_34:                                ## =>This Inner Loop Header: Depth=1
	movq	%r15, (%rax,%rdx,8)
	addq	$1, %rdx
	addq	%rbx, %r15
	cmpq	%rcx, %rdx
	jl	LBB8_34
LBB8_35:
	testl	%r14d, %r14d
	movl	12(%rsp), %ebx          ## 4-byte Reload
	jle	LBB8_44
## BB#36:
	movl	8(%rsp), %eax           ## 4-byte Reload
	movslq	%r14d, %rcx
	cmpl	$15, %r14d
	jbe	LBB8_41
## BB#37:
	movq	%rcx, %rdx
	andq	$-16, %rdx
	je	LBB8_41
## BB#38:
	movslq	%ebx, %rsi
	vmovq	%rsi, %xmm0
	vpbroadcastq	%xmm0, %ymm0
	vmovq	%rax, %xmm1
	vpbroadcastq	%xmm1, %ymm1
	leaq	96(%r13), %rsi
	vmovdqa	LCPI8_0(%rip), %ymm2    ## ymm2 = [0,1,2,3]
	vpbroadcastq	LCPI8_5(%rip), %ymm3
	vpbroadcastq	LCPI8_6(%rip), %ymm4
	vpbroadcastq	LCPI8_7(%rip), %ymm5
	vpsrlq	$32, %ymm0, %ymm6
	vpbroadcastq	LCPI8_8(%rip), %ymm7
	movq	%rdx, %rdi
	.p2align	4, 0x90
LBB8_39:                                ## =>This Inner Loop Header: Depth=1
	vpaddq	%ymm3, %ymm2, %ymm8
	vpaddq	%ymm4, %ymm2, %ymm9
	vpaddq	%ymm5, %ymm2, %ymm10
	vpsrlq	$32, %ymm2, %ymm11
	vpmuludq	%ymm0, %ymm11, %ymm11
	vpmuludq	%ymm6, %ymm2, %ymm12
	vpaddq	%ymm11, %ymm12, %ymm11
	vpsllq	$32, %ymm11, %ymm11
	vpmuludq	%ymm0, %ymm2, %ymm12
	vpaddq	%ymm11, %ymm12, %ymm11
	vpmuludq	%ymm6, %ymm8, %ymm12
	vpsrlq	$32, %ymm8, %ymm13
	vpmuludq	%ymm0, %ymm13, %ymm13
	vpaddq	%ymm13, %ymm12, %ymm12
	vpsllq	$32, %ymm12, %ymm12
	vpmuludq	%ymm0, %ymm8, %ymm8
	vpaddq	%ymm12, %ymm8, %ymm8
	vpmuludq	%ymm6, %ymm9, %ymm12
	vpsrlq	$32, %ymm9, %ymm13
	vpmuludq	%ymm0, %ymm13, %ymm13
	vpaddq	%ymm13, %ymm12, %ymm12
	vpsllq	$32, %ymm12, %ymm12
	vpmuludq	%ymm0, %ymm9, %ymm9
	vpaddq	%ymm12, %ymm9, %ymm9
	vpmuludq	%ymm6, %ymm10, %ymm12
	vpsrlq	$32, %ymm10, %ymm13
	vpmuludq	%ymm0, %ymm13, %ymm13
	vpaddq	%ymm13, %ymm12, %ymm12
	vpsllq	$32, %ymm12, %ymm12
	vpmuludq	%ymm0, %ymm10, %ymm10
	vpaddq	%ymm12, %ymm10, %ymm10
	vpaddq	%ymm1, %ymm11, %ymm11
	vpaddq	%ymm1, %ymm8, %ymm8
	vpaddq	%ymm1, %ymm9, %ymm9
	vpaddq	%ymm1, %ymm10, %ymm10
	vpshufd	$232, %ymm11, %ymm11    ## ymm11 = ymm11[0,2,2,3,4,6,6,7]
	vpermq	$232, %ymm11, %ymm11    ## ymm11 = ymm11[0,2,2,3]
	vpshufd	$232, %ymm8, %ymm8      ## ymm8 = ymm8[0,2,2,3,4,6,6,7]
	vpermq	$232, %ymm8, %ymm8      ## ymm8 = ymm8[0,2,2,3]
	vpshufd	$232, %ymm9, %ymm9      ## ymm9 = ymm9[0,2,2,3,4,6,6,7]
	vpermq	$232, %ymm9, %ymm9      ## ymm9 = ymm9[0,2,2,3]
	vpshufd	$232, %ymm10, %ymm10    ## ymm10 = ymm10[0,2,2,3,4,6,6,7]
	vpermq	$232, %ymm10, %ymm10    ## ymm10 = ymm10[0,2,2,3]
	vcvtdq2pd	%xmm11, %ymm11
	vcvtdq2pd	%xmm8, %ymm8
	vcvtdq2pd	%xmm9, %ymm9
	vcvtdq2pd	%xmm10, %ymm10
	vmovdqu	%ymm11, -96(%rsi)
	vmovdqu	%ymm8, -64(%rsi)
	vmovdqu	%ymm9, -32(%rsi)
	vmovdqu	%ymm10, (%rsi)
	vpaddq	%ymm7, %ymm2, %ymm2
	subq	$-128, %rsi
	addq	$-16, %rdi
	jne	LBB8_39
## BB#40:
	cmpq	%rdx, %rcx
	jne	LBB8_42
	jmp	LBB8_44
LBB8_41:
	xorl	%edx, %edx
LBB8_42:
	movl	%edx, %esi
	imull	%ebx, %esi
	addl	%esi, %eax
	.p2align	4, 0x90
LBB8_43:                                ## =>This Inner Loop Header: Depth=1
	vxorps	%xmm12, %xmm12, %xmm12
	vcvtsi2sdl	%eax, %xmm12, %xmm0
	vmovsd	%xmm0, (%r13,%rdx,8)
	addq	$1, %rdx
	addl	%ebx, %eax
	cmpq	%rcx, %rdx
	jl	LBB8_43
LBB8_44:
	testl	%r12d, %r12d
	jle	LBB8_55
## BB#45:
	xorl	%r15d, %r15d
	leaq	_toupperversion+24(%rip), %r13
	.p2align	4, 0x90
LBB8_46:                                ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB8_48 Depth 2
                                        ##       Child Loop BB8_50 Depth 3
	testl	%r14d, %r14d
	jle	LBB8_54
## BB#47:                               ##   in Loop: Header=BB8_46 Depth=1
	xorl	%r12d, %r12d
	.p2align	4, 0x90
LBB8_48:                                ##   Parent Loop BB8_46 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB8_50 Depth 3
	movq	_toupperversion+8(%rip), %rcx
	testq	%rcx, %rcx
	je	LBB8_52
## BB#49:                               ##   in Loop: Header=BB8_48 Depth=2
	xorl	%r14d, %r14d
	movq	%r13, %rbx
	.p2align	4, 0x90
LBB8_50:                                ##   Parent Loop BB8_46 Depth=1
                                        ##     Parent Loop BB8_48 Depth=2
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
	jne	LBB8_50
## BB#51:                               ##   in Loop: Header=BB8_48 Depth=2
	movl	_no_ratio(%rip), %r14d
LBB8_52:                                ##   in Loop: Header=BB8_48 Depth=2
	addl	$1, %r12d
	cmpl	%r14d, %r12d
	jl	LBB8_48
## BB#53:                               ##   in Loop: Header=BB8_46 Depth=1
	movl	_no_sz(%rip), %r12d
LBB8_54:                                ##   in Loop: Header=BB8_46 Depth=1
	addl	$1, %r15d
	cmpl	%r12d, %r15d
	jl	LBB8_46
LBB8_55:
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
LBB8_56:
	xorl	%edi, %edi
	testq	%rsi, %rsi
	je	LBB8_59
LBB8_57:
	movq	%rdx, %rsi
	subq	%rdi, %rsi
	leaq	224(%rax,%rdi,8), %rdi
	vbroadcastsd	LCPI8_5(%rip), %ymm3
	vmovaps	%ymm3, 96(%rsp)         ## 32-byte Spill
	vpbroadcastq	LCPI8_6(%rip), %ymm3
	vmovdqa	%ymm3, 32(%rsp)         ## 32-byte Spill
	vpbroadcastq	LCPI8_7(%rip), %ymm5
	vpsrlq	$32, %ymm0, %ymm6
	vpbroadcastq	LCPI8_8(%rip), %ymm7
	vpbroadcastq	LCPI8_9(%rip), %ymm8
	vpbroadcastq	LCPI8_10(%rip), %ymm9
	vpbroadcastq	LCPI8_11(%rip), %ymm10
	vpbroadcastq	LCPI8_12(%rip), %ymm11
	.p2align	4, 0x90
LBB8_58:                                ## =>This Inner Loop Header: Depth=1
	vpaddq	96(%rsp), %ymm2, %ymm12 ## 32-byte Folded Reload
	vpaddq	32(%rsp), %ymm2, %ymm13 ## 32-byte Folded Reload
	vpaddq	%ymm5, %ymm2, %ymm14
	vpsrlq	$32, %ymm2, %ymm15
	vpmuludq	%ymm0, %ymm15, %ymm15
	vpmuludq	%ymm6, %ymm2, %ymm3
	vpaddq	%ymm15, %ymm3, %ymm3
	vpsllq	$32, %ymm3, %ymm3
	vpmuludq	%ymm0, %ymm2, %ymm15
	vpaddq	%ymm3, %ymm15, %ymm3
	vpmuludq	%ymm6, %ymm12, %ymm15
	vpsrlq	$32, %ymm12, %ymm4
	vpmuludq	%ymm0, %ymm4, %ymm4
	vpaddq	%ymm4, %ymm15, %ymm4
	vpsllq	$32, %ymm4, %ymm4
	vpmuludq	%ymm0, %ymm12, %ymm12
	vpaddq	%ymm4, %ymm12, %ymm4
	vpmuludq	%ymm6, %ymm13, %ymm12
	vpsrlq	$32, %ymm13, %ymm15
	vpmuludq	%ymm0, %ymm15, %ymm15
	vpaddq	%ymm15, %ymm12, %ymm12
	vpsllq	$32, %ymm12, %ymm12
	vpmuludq	%ymm0, %ymm13, %ymm13
	vpaddq	%ymm12, %ymm13, %ymm12
	vpmuludq	%ymm6, %ymm14, %ymm13
	vpsrlq	$32, %ymm14, %ymm15
	vpmuludq	%ymm0, %ymm15, %ymm15
	vpaddq	%ymm15, %ymm13, %ymm13
	vpsllq	$32, %ymm13, %ymm13
	vpmuludq	%ymm0, %ymm14, %ymm14
	vpaddq	%ymm13, %ymm14, %ymm13
	vpaddq	%ymm1, %ymm3, %ymm3
	vpaddq	%ymm1, %ymm4, %ymm4
	vpaddq	%ymm1, %ymm12, %ymm12
	vpaddq	%ymm1, %ymm13, %ymm13
	vmovdqu	%ymm3, -224(%rdi)
	vmovdqu	%ymm4, -192(%rdi)
	vmovdqu	%ymm12, -160(%rdi)
	vmovdqu	%ymm13, -128(%rdi)
	vpaddq	%ymm7, %ymm2, %ymm3
	vpaddq	%ymm8, %ymm2, %ymm4
	vpaddq	%ymm9, %ymm2, %ymm12
	vpaddq	%ymm10, %ymm2, %ymm13
	vpmuludq	%ymm6, %ymm3, %ymm14
	vpsrlq	$32, %ymm3, %ymm15
	vpmuludq	%ymm0, %ymm15, %ymm15
	vpaddq	%ymm15, %ymm14, %ymm14
	vpsllq	$32, %ymm14, %ymm14
	vpmuludq	%ymm0, %ymm3, %ymm3
	vpaddq	%ymm14, %ymm3, %ymm3
	vpmuludq	%ymm6, %ymm4, %ymm14
	vpsrlq	$32, %ymm4, %ymm15
	vpmuludq	%ymm0, %ymm15, %ymm15
	vpaddq	%ymm15, %ymm14, %ymm14
	vpsllq	$32, %ymm14, %ymm14
	vpmuludq	%ymm0, %ymm4, %ymm4
	vpaddq	%ymm14, %ymm4, %ymm4
	vpmuludq	%ymm6, %ymm12, %ymm14
	vpsrlq	$32, %ymm12, %ymm15
	vpmuludq	%ymm0, %ymm15, %ymm15
	vpaddq	%ymm15, %ymm14, %ymm14
	vpsllq	$32, %ymm14, %ymm14
	vpmuludq	%ymm0, %ymm12, %ymm12
	vpaddq	%ymm14, %ymm12, %ymm12
	vpmuludq	%ymm6, %ymm13, %ymm14
	vpsrlq	$32, %ymm13, %ymm15
	vpmuludq	%ymm0, %ymm15, %ymm15
	vpaddq	%ymm15, %ymm14, %ymm14
	vpsllq	$32, %ymm14, %ymm14
	vpmuludq	%ymm0, %ymm13, %ymm13
	vpaddq	%ymm14, %ymm13, %ymm13
	vpaddq	%ymm1, %ymm3, %ymm3
	vmovdqu	%ymm3, -96(%rdi)
	vpaddq	%ymm1, %ymm4, %ymm3
	vmovdqu	%ymm3, -64(%rdi)
	vpaddq	%ymm1, %ymm12, %ymm3
	vmovdqu	%ymm3, -32(%rdi)
	vpaddq	%ymm1, %ymm13, %ymm3
	vmovdqu	%ymm3, (%rdi)
	vpaddq	%ymm11, %ymm2, %ymm2
	addq	$256, %rdi              ## imm = 0x100
	addq	$-32, %rsi
	jne	LBB8_58
LBB8_59:
	cmpq	%rdx, %rcx
	jne	LBB8_33
	jmp	LBB8_35
	.cfi_endproc

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
	.asciz	"Before: %0.4s...\n"

L_.str.1:                               ## @.str.1
	.asciz	"Start Time: %f...\n"

L_.str.2:                               ## @.str.2
	.asciz	"Stop Time: %f...\n"

	.comm	_results,8,3            ## @results
L_.str.3:                               ## @.str.3
	.asciz	"Total Time: %f...\n"

L_.str.4:                               ## @.str.4
	.asciz	"After:  %0.4s...\n"

L_.str.5:                               ## @.str.5
	.asciz	"simple"

L_.str.6:                               ## @.str.6
	.asciz	"optimised"

	.section	__DATA,__data
	.globl	_toupperversion         ## @toupperversion
	.p2align	4
_toupperversion:
	.quad	L_.str.5
	.quad	_toupper_simple
	.quad	L_.str.6
	.quad	_toupper_optimised
	.space	16

	.section	__TEXT,__cstring,cstring_literals
L_.str.8:                               ## @.str.8
	.asciz	"VARIANT3: gcc -lm -march=native toupper.c -O2"

L_.str.9:                               ## @.str.9
	.asciz	"Size: %ld \tRatio: %f \tRunning time:"

L_.str.10:                              ## @.str.10
	.asciz	"\t%s: %f"

L_.str.12:                              ## @.str.12
	.asciz	"-d"

L_.str.13:                              ## @.str.13
	.asciz	"-l"

L_.str.14:                              ## @.str.14
	.asciz	"-r"

L_.str.15:                              ## @.str.15
	.asciz	"%s"


.subsections_via_symbols
