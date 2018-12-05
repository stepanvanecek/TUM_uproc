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
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	addq	$32, %rdi
	callq	_malloc
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	shrq	$4, %rax
	shlq	$4, %rax
	addq	$16, %rax
	addq	$16, %rsp
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
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	callq	_rand
	movl	$100, %edi
	cltd
	idivl	%edi
	movb	%dl, %cl
	movb	%cl, -5(%rbp)
	movsbl	-5(%rbp), %edx
	cmpl	-4(%rbp), %edx
	jge	LBB1_2
## BB#1:
	movb	$0, -5(%rbp)
	jmp	LBB1_3
LBB1_2:
	movb	$1, -5(%rbp)
LBB1_3:
	callq	_rand
	movl	$26, %ecx
	cltd
	idivl	%ecx
	addl	$1, %edx
	movb	%dl, %sil
	movb	%sil, -6(%rbp)
	movsbl	-5(%rbp), %ecx
	shll	$5, %ecx
	addl	$64, %ecx
	movsbl	-6(%rbp), %edx
	addl	%edx, %ecx
	movb	%cl, %sil
	movsbl	%sil, %ecx
	movl	%ecx, %eax
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_init
	.p2align	4, 0x90
_init:                                  ## @init
	.cfi_startproc
## BB#0:
	pushq	%rbp
Lcfi6:
	.cfi_def_cfa_offset 16
Lcfi7:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Lcfi8:
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	$0, -16(%rbp)
	movq	-8(%rbp), %rdi
	addq	$1, %rdi
	callq	_mymalloc
	movl	$1, %edi
	movq	%rax, -24(%rbp)
	callq	_srand
	movl	$0, -16(%rbp)
LBB2_1:                                 ## =>This Inner Loop Header: Depth=1
	movslq	-16(%rbp), %rax
	cmpq	-8(%rbp), %rax
	jae	LBB2_4
## BB#2:                                ##   in Loop: Header=BB2_1 Depth=1
	movl	-12(%rbp), %edi
	callq	_createChar
	movb	%al, -25(%rbp)
	movb	-25(%rbp), %al
	movq	-24(%rbp), %rcx
	movslq	-16(%rbp), %rdx
	movb	%al, (%rcx,%rdx)
## BB#3:                                ##   in Loop: Header=BB2_1 Depth=1
	movl	-16(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -16(%rbp)
	jmp	LBB2_1
LBB2_4:
	movq	-24(%rbp), %rax
	movslq	-16(%rbp), %rcx
	movb	$0, (%rax,%rcx)
	movq	-24(%rbp), %rax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_run_toupper
	.p2align	4, 0x90
_run_toupper:                           ## @run_toupper
	.cfi_startproc
## BB#0:
	pushq	%rbp
Lcfi9:
	.cfi_def_cfa_offset 16
Lcfi10:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Lcfi11:
	.cfi_def_cfa_register %rbp
	subq	$96, %rsp
	movq	_ratios@GOTPCREL(%rip), %rax
	movq	_sizes@GOTPCREL(%rip), %r9
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	%edx, -12(%rbp)
	movq	%rcx, -24(%rbp)
	movq	%r8, -32(%rbp)
	movl	-8(%rbp), %edx
	movl	%edx, -52(%rbp)
	movl	-4(%rbp), %edx
	imull	_no_ratio(%rip), %edx
	addl	-52(%rbp), %edx
	movl	%edx, -52(%rbp)
	movl	-12(%rbp), %edx
	imull	_no_sz(%rip), %edx
	imull	_no_ratio(%rip), %edx
	addl	-52(%rbp), %edx
	movl	%edx, -52(%rbp)
	movq	(%r9), %rcx
	movslq	-4(%rbp), %r8
	movq	(%rcx,%r8,8), %rdi
	movq	(%rax), %rax
	movslq	-8(%rbp), %rcx
	vcvttsd2si	(%rax,%rcx,8), %esi
	callq	_init
	movq	%rax, -64(%rbp)
	cmpl	$0, _debug(%rip)
	je	LBB3_2
## BB#1:
	leaq	L_.str(%rip), %rdi
	movq	-64(%rbp), %rsi
	movb	$0, %al
	callq	_printf
	movl	%eax, -68(%rbp)         ## 4-byte Spill
LBB3_2:
	callq	_gettime
	vmovsd	%xmm0, -40(%rbp)
	cmpl	$0, _debug(%rip)
	je	LBB3_4
## BB#3:
	leaq	L_.str.1(%rip), %rdi
	vmovsd	-40(%rbp), %xmm0        ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
	movl	%eax, -72(%rbp)         ## 4-byte Spill
LBB3_4:
	movq	-24(%rbp), %rax
	movq	-64(%rbp), %rdi
	callq	*%rax
	callq	_gettime
	vmovsd	%xmm0, -48(%rbp)
	cmpl	$0, _debug(%rip)
	je	LBB3_6
## BB#5:
	leaq	L_.str.2(%rip), %rdi
	vmovsd	-48(%rbp), %xmm0        ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
	movl	%eax, -76(%rbp)         ## 4-byte Spill
LBB3_6:
	movq	_results@GOTPCREL(%rip), %rax
	vmovsd	-48(%rbp), %xmm0        ## xmm0 = mem[0],zero
	vsubsd	-40(%rbp), %xmm0, %xmm0
	movq	(%rax), %rax
	movslq	-52(%rbp), %rcx
	vmovsd	%xmm0, (%rax,%rcx,8)
	cmpl	$0, _debug(%rip)
	je	LBB3_8
## BB#7:
	leaq	L_.str.3(%rip), %rdi
	movq	_results@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movslq	-52(%rbp), %rcx
	vmovsd	(%rax,%rcx,8), %xmm0    ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
	movl	%eax, -80(%rbp)         ## 4-byte Spill
LBB3_8:
	cmpl	$0, _debug(%rip)
	je	LBB3_10
## BB#9:
	leaq	L_.str.4(%rip), %rdi
	movq	-64(%rbp), %rsi
	movb	$0, %al
	callq	_printf
	movl	%eax, -84(%rbp)         ## 4-byte Spill
LBB3_10:
	addq	$96, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.p2align	4, 0x90
_gettime:                               ## @gettime
	.cfi_startproc
## BB#0:
	pushq	%rbp
Lcfi12:
	.cfi_def_cfa_offset 16
Lcfi13:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Lcfi14:
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	xorl	%edi, %edi
	leaq	-16(%rbp), %rsi
	callq	_clock_gettime
	movq	-8(%rbp), %rsi
	movabsq	$2361183241434822607, %rcx ## imm = 0x20C49BA5E353F7CF
	movl	%eax, -20(%rbp)         ## 4-byte Spill
	movq	%rsi, %rax
	imulq	%rcx
	movq	%rdx, %rax
	shrq	$63, %rax
	sarq	$7, %rdx
	addq	%rax, %rdx
                                        ## implicit-def: %XMM0
	vcvtsi2sdq	%rdx, %xmm0, %xmm0
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.p2align	4, 0x90
_toupper_simple:                        ## @toupper_simple
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
	movq	%rdi, -8(%rbp)
	movl	$0, -12(%rbp)
LBB5_1:                                 ## =>This Inner Loop Header: Depth=1
	movq	-8(%rbp), %rax
	movslq	-12(%rbp), %rcx
	movsbl	(%rax,%rcx), %edx
	cmpl	$0, %edx
	je	LBB5_6
## BB#2:                                ##   in Loop: Header=BB5_1 Depth=1
	movq	-8(%rbp), %rax
	movslq	-12(%rbp), %rcx
	movsbl	(%rax,%rcx), %edx
	cmpl	$96, %edx
	jle	LBB5_5
## BB#3:                                ##   in Loop: Header=BB5_1 Depth=1
	movq	-8(%rbp), %rax
	movslq	-12(%rbp), %rcx
	movsbl	(%rax,%rcx), %edx
	cmpl	$123, %edx
	jge	LBB5_5
## BB#4:                                ##   in Loop: Header=BB5_1 Depth=1
	movq	-8(%rbp), %rax
	movslq	-12(%rbp), %rcx
	movsbl	(%rax,%rcx), %edx
	subl	$32, %edx
	movb	%dl, %sil
	movb	%sil, (%rax,%rcx)
LBB5_5:                                 ##   in Loop: Header=BB5_1 Depth=1
	movl	-12(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	jmp	LBB5_1
LBB5_6:
	popq	%rbp
	retq
	.cfi_endproc

	.p2align	4, 0x90
_toupper_optimised:                     ## @toupper_optimised
	.cfi_startproc
## BB#0:
	pushq	%rbp
Lcfi18:
	.cfi_def_cfa_offset 16
Lcfi19:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Lcfi20:
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	subq	$56, %rsp
Lcfi21:
	.cfi_offset %rbx, -24
	movq	%rdi, -16(%rbp)
	movl	$0, -24(%rbp)
	movl	$0, -28(%rbp)
LBB6_1:                                 ## =>This Inner Loop Header: Depth=1
	movq	-16(%rbp), %rax
	movslq	-24(%rbp), %rcx
	movsbl	(%rax,%rcx), %edx
	cmpl	$0, %edx
	je	LBB6_3
## BB#2:                                ##   in Loop: Header=BB6_1 Depth=1
	movq	-16(%rbp), %rax
	movslq	-24(%rbp), %rcx
	movq	-16(%rbp), %rdx
	movslq	-24(%rbp), %rsi
	movsbl	(%rdx,%rsi), %edi
	movl	$96, %ebx
	movl	$123, %r8d
	xorl	%edx, %edx
	movq	%rax, -40(%rbp)         ## 8-byte Spill
	movl	%edi, %eax
	movq	%rcx, -48(%rbp)         ## 8-byte Spill
	movl	%r8d, %ecx
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
	movq	-40(%rbp), %rsi         ## 8-byte Reload
	movq	-48(%rbp), %r9          ## 8-byte Reload
	movb	%al, (%rsi,%r9)
	movl	-24(%rbp), %eax
	## InlineAsm Start
	incl	%eax

	## InlineAsm End
	movl	%eax, -24(%rbp)
	jmp	LBB6_1
LBB6_3:
	cmpl	$0, _debug(%rip)
	je	LBB6_5
## BB#4:
	leaq	L_.str.15(%rip), %rdi
	movq	-16(%rbp), %rsi
	movb	$0, %al
	callq	_printf
	movl	%eax, -52(%rbp)         ## 4-byte Spill
LBB6_5:
	addq	$56, %rsp
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
Lcfi22:
	.cfi_def_cfa_offset 16
Lcfi23:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Lcfi24:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	$0, -12(%rbp)
LBB7_1:                                 ## =>This Inner Loop Header: Depth=1
	leaq	_toupperversion(%rip), %rax
	movslq	-12(%rbp), %rcx
	shlq	$4, %rcx
	addq	%rcx, %rax
	cmpq	$0, 8(%rax)
	je	LBB7_4
## BB#2:                                ##   in Loop: Header=BB7_1 Depth=1
	leaq	_toupperversion(%rip), %rax
	movl	-4(%rbp), %edi
	movl	-8(%rbp), %esi
	movl	-12(%rbp), %edx
	movslq	-12(%rbp), %rcx
	shlq	$4, %rcx
	movq	%rax, %r8
	addq	%rcx, %r8
	movq	8(%r8), %rcx
	movslq	-12(%rbp), %r8
	shlq	$4, %r8
	addq	%r8, %rax
	movq	(%rax), %r8
	callq	_run_toupper
## BB#3:                                ##   in Loop: Header=BB7_1 Depth=1
	movl	-12(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	jmp	LBB7_1
LBB7_4:
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_printresults
	.p2align	4, 0x90
_printresults:                          ## @printresults
	.cfi_startproc
## BB#0:
	pushq	%rbp
Lcfi25:
	.cfi_def_cfa_offset 16
Lcfi26:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Lcfi27:
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	leaq	L_.str.7(%rip), %rdi
	leaq	L_.str.8(%rip), %rsi
	movb	$0, %al
	callq	_printf
	movl	$0, -8(%rbp)
	movl	%eax, -20(%rbp)         ## 4-byte Spill
LBB8_1:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB8_3 Depth 2
                                        ##       Child Loop BB8_5 Depth 3
	movl	-8(%rbp), %eax
	cmpl	_no_sz(%rip), %eax
	jge	LBB8_12
## BB#2:                                ##   in Loop: Header=BB8_1 Depth=1
	movl	$0, -12(%rbp)
LBB8_3:                                 ##   Parent Loop BB8_1 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB8_5 Depth 3
	movl	-12(%rbp), %eax
	cmpl	_no_ratio(%rip), %eax
	jge	LBB8_10
## BB#4:                                ##   in Loop: Header=BB8_3 Depth=2
	leaq	L_.str.9(%rip), %rdi
	movq	_ratios@GOTPCREL(%rip), %rax
	movq	_sizes@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rcx
	movslq	-8(%rbp), %rdx
	movq	(%rcx,%rdx,8), %rsi
	movq	(%rax), %rax
	movslq	-12(%rbp), %rcx
	vmovsd	(%rax,%rcx,8), %xmm0    ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
	movl	$0, -4(%rbp)
	movl	%eax, -24(%rbp)         ## 4-byte Spill
LBB8_5:                                 ##   Parent Loop BB8_1 Depth=1
                                        ##     Parent Loop BB8_3 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	movl	-4(%rbp), %eax
	cmpl	_no_version(%rip), %eax
	jge	LBB8_8
## BB#6:                                ##   in Loop: Header=BB8_5 Depth=3
	leaq	L_.str.10(%rip), %rdi
	movq	_results@GOTPCREL(%rip), %rax
	leaq	_toupperversion(%rip), %rcx
	movl	-12(%rbp), %edx
	movl	%edx, -16(%rbp)
	movl	-8(%rbp), %edx
	imull	_no_ratio(%rip), %edx
	addl	-16(%rbp), %edx
	movl	%edx, -16(%rbp)
	movl	-4(%rbp), %edx
	imull	_no_sz(%rip), %edx
	imull	_no_ratio(%rip), %edx
	addl	-16(%rbp), %edx
	movl	%edx, -16(%rbp)
	movslq	-4(%rbp), %rsi
	shlq	$4, %rsi
	addq	%rsi, %rcx
	movq	(%rcx), %rsi
	movq	(%rax), %rax
	movslq	-16(%rbp), %rcx
	vmovsd	(%rax,%rcx,8), %xmm0    ## xmm0 = mem[0],zero
	movb	$1, %al
	callq	_printf
	movl	%eax, -28(%rbp)         ## 4-byte Spill
## BB#7:                                ##   in Loop: Header=BB8_5 Depth=3
	movl	-4(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4(%rbp)
	jmp	LBB8_5
LBB8_8:                                 ##   in Loop: Header=BB8_3 Depth=2
	leaq	L_.str.11(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movl	%eax, -32(%rbp)         ## 4-byte Spill
## BB#9:                                ##   in Loop: Header=BB8_3 Depth=2
	movl	-12(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	jmp	LBB8_3
LBB8_10:                                ##   in Loop: Header=BB8_1 Depth=1
	jmp	LBB8_11
LBB8_11:                                ##   in Loop: Header=BB8_1 Depth=1
	movl	-8(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -8(%rbp)
	jmp	LBB8_1
LBB8_12:
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## BB#0:
	pushq	%rbp
Lcfi28:
	.cfi_def_cfa_offset 16
Lcfi29:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Lcfi30:
	.cfi_def_cfa_register %rbp
	subq	$112, %rsp
	movl	$0, -4(%rbp)
	movl	%edi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	$800000, -24(%rbp)      ## imm = 0xC3500
	movq	$0, -32(%rbp)
	movq	$10000, -40(%rbp)       ## imm = 0x2710
	movl	$50, -44(%rbp)
	movl	$0, -48(%rbp)
	movl	$1, -52(%rbp)
	movl	$1, -56(%rbp)
LBB9_1:                                 ## =>This Inner Loop Header: Depth=1
	movl	-56(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jge	LBB9_22
## BB#2:                                ##   in Loop: Header=BB9_1 Depth=1
	xorl	%eax, %eax
	movq	-16(%rbp), %rcx
	movslq	-56(%rbp), %rdx
	movq	(%rcx,%rdx,8), %rsi
	leaq	L_.str.12(%rip), %rdi
	movl	%eax, -76(%rbp)         ## 4-byte Spill
	callq	_strcmp
	movl	-76(%rbp), %r8d         ## 4-byte Reload
	cmpl	%eax, %r8d
	jne	LBB9_4
## BB#3:                                ##   in Loop: Header=BB9_1 Depth=1
	movl	$1, _debug(%rip)
LBB9_4:                                 ##   in Loop: Header=BB9_1 Depth=1
	xorl	%eax, %eax
	movq	-16(%rbp), %rcx
	movslq	-56(%rbp), %rdx
	movq	(%rcx,%rdx,8), %rsi
	leaq	L_.str.13(%rip), %rdi
	movl	%eax, -80(%rbp)         ## 4-byte Spill
	callq	_strcmp
	movl	-80(%rbp), %r8d         ## 4-byte Reload
	cmpl	%eax, %r8d
	jne	LBB9_12
## BB#5:                                ##   in Loop: Header=BB9_1 Depth=1
	movq	-16(%rbp), %rax
	movl	-56(%rbp), %ecx
	addl	$1, %ecx
	movslq	%ecx, %rdx
	movq	(%rax,%rdx,8), %rdi
	callq	_atoi
	movslq	%eax, %rdx
	movq	%rdx, -24(%rbp)
	movl	-56(%rbp), %eax
	addl	$2, %eax
	cmpl	-8(%rbp), %eax
	jl	LBB9_7
## BB#6:
	jmp	LBB9_22
LBB9_7:                                 ##   in Loop: Header=BB9_1 Depth=1
	xorl	%eax, %eax
	movq	-16(%rbp), %rcx
	movl	-56(%rbp), %edx
	addl	$2, %edx
	movslq	%edx, %rsi
	movq	(%rcx,%rsi,8), %rsi
	leaq	L_.str.14(%rip), %rdi
	movl	%eax, -84(%rbp)         ## 4-byte Spill
	callq	_strcmp
	movl	-84(%rbp), %edx         ## 4-byte Reload
	cmpl	%eax, %edx
	jne	LBB9_9
## BB#8:
	jmp	LBB9_22
LBB9_9:                                 ##   in Loop: Header=BB9_1 Depth=1
	xorl	%eax, %eax
	movq	-16(%rbp), %rcx
	movl	-56(%rbp), %edx
	addl	$2, %edx
	movslq	%edx, %rsi
	movq	(%rcx,%rsi,8), %rsi
	leaq	L_.str.12(%rip), %rdi
	movl	%eax, -88(%rbp)         ## 4-byte Spill
	callq	_strcmp
	movl	-88(%rbp), %edx         ## 4-byte Reload
	cmpl	%eax, %edx
	jne	LBB9_11
## BB#10:
	jmp	LBB9_22
LBB9_11:                                ##   in Loop: Header=BB9_1 Depth=1
	movq	-16(%rbp), %rax
	movl	-56(%rbp), %ecx
	addl	$2, %ecx
	movslq	%ecx, %rdx
	movq	(%rax,%rdx,8), %rdi
	callq	_atoi
	movslq	%eax, %rdx
	movq	%rdx, -32(%rbp)
	movq	-16(%rbp), %rdx
	movl	-56(%rbp), %eax
	addl	$3, %eax
	movslq	%eax, %rdi
	movq	(%rdx,%rdi,8), %rdi
	callq	_atoi
	movslq	%eax, %rdx
	movq	%rdx, -40(%rbp)
LBB9_12:                                ##   in Loop: Header=BB9_1 Depth=1
	xorl	%eax, %eax
	movq	-16(%rbp), %rcx
	movslq	-56(%rbp), %rdx
	movq	(%rcx,%rdx,8), %rsi
	leaq	L_.str.14(%rip), %rdi
	movl	%eax, -92(%rbp)         ## 4-byte Spill
	callq	_strcmp
	movl	-92(%rbp), %r8d         ## 4-byte Reload
	cmpl	%eax, %r8d
	jne	LBB9_20
## BB#13:                               ##   in Loop: Header=BB9_1 Depth=1
	movq	-16(%rbp), %rax
	movl	-56(%rbp), %ecx
	addl	$1, %ecx
	movslq	%ecx, %rdx
	movq	(%rax,%rdx,8), %rdi
	callq	_atoi
	movl	%eax, -44(%rbp)
	movl	-56(%rbp), %eax
	addl	$2, %eax
	cmpl	-8(%rbp), %eax
	jl	LBB9_15
## BB#14:
	jmp	LBB9_22
LBB9_15:                                ##   in Loop: Header=BB9_1 Depth=1
	xorl	%eax, %eax
	movq	-16(%rbp), %rcx
	movl	-56(%rbp), %edx
	addl	$2, %edx
	movslq	%edx, %rsi
	movq	(%rcx,%rsi,8), %rsi
	leaq	L_.str.13(%rip), %rdi
	movl	%eax, -96(%rbp)         ## 4-byte Spill
	callq	_strcmp
	movl	-96(%rbp), %edx         ## 4-byte Reload
	cmpl	%eax, %edx
	jne	LBB9_17
## BB#16:
	jmp	LBB9_22
LBB9_17:                                ##   in Loop: Header=BB9_1 Depth=1
	xorl	%eax, %eax
	movq	-16(%rbp), %rcx
	movl	-56(%rbp), %edx
	addl	$2, %edx
	movslq	%edx, %rsi
	movq	(%rcx,%rsi,8), %rsi
	leaq	L_.str.12(%rip), %rdi
	movl	%eax, -100(%rbp)        ## 4-byte Spill
	callq	_strcmp
	movl	-100(%rbp), %edx        ## 4-byte Reload
	cmpl	%eax, %edx
	jne	LBB9_19
## BB#18:
	jmp	LBB9_22
LBB9_19:                                ##   in Loop: Header=BB9_1 Depth=1
	movq	-16(%rbp), %rax
	movl	-56(%rbp), %ecx
	addl	$2, %ecx
	movslq	%ecx, %rdx
	movq	(%rax,%rdx,8), %rdi
	callq	_atoi
	movl	%eax, -48(%rbp)
	movq	-16(%rbp), %rdx
	movl	-56(%rbp), %eax
	addl	$3, %eax
	movslq	%eax, %rdi
	movq	(%rdx,%rdi,8), %rdi
	callq	_atoi
	movl	%eax, -52(%rbp)
LBB9_20:                                ##   in Loop: Header=BB9_1 Depth=1
	jmp	LBB9_21
LBB9_21:                                ##   in Loop: Header=BB9_1 Depth=1
	movl	-56(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -56(%rbp)
	jmp	LBB9_1
LBB9_22:
	movl	$0, -68(%rbp)
LBB9_23:                                ## =>This Inner Loop Header: Depth=1
	leaq	_toupperversion(%rip), %rax
	movslq	-68(%rbp), %rcx
	shlq	$4, %rcx
	addq	%rcx, %rax
	cmpq	$0, 8(%rax)
	je	LBB9_26
## BB#24:                               ##   in Loop: Header=BB9_23 Depth=1
	movl	-68(%rbp), %eax
	addl	$1, %eax
	movl	%eax, _no_version(%rip)
## BB#25:                               ##   in Loop: Header=BB9_23 Depth=1
	movl	-68(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -68(%rbp)
	jmp	LBB9_23
LBB9_26:
	xorl	%eax, %eax
	movl	%eax, %ecx
	cmpq	-32(%rbp), %rcx
	jne	LBB9_28
## BB#27:
	movl	$1, _no_sz(%rip)
	jmp	LBB9_29
LBB9_28:
	movq	-32(%rbp), %rax
	subq	-24(%rbp), %rax
	xorl	%ecx, %ecx
	movl	%ecx, %edx
	divq	-40(%rbp)
	addq	$1, %rax
	movl	%eax, %ecx
	movl	%ecx, _no_sz(%rip)
LBB9_29:
	xorl	%eax, %eax
	cmpl	-48(%rbp), %eax
	jne	LBB9_31
## BB#30:
	movl	$1, _no_ratio(%rip)
	jmp	LBB9_32
LBB9_31:
	movl	-48(%rbp), %eax
	subl	-44(%rbp), %eax
	cltd
	idivl	-52(%rbp)
	addl	$1, %eax
	movl	%eax, _no_ratio(%rip)
LBB9_32:
	movl	-68(%rbp), %eax
	imull	_no_sz(%rip), %eax
	imull	_no_ratio(%rip), %eax
	movl	%eax, -72(%rbp)
	movl	-72(%rbp), %eax
	movl	%eax, %ecx
	shlq	$3, %rcx
	movq	%rcx, %rdi
	callq	_malloc
	movq	_results@GOTPCREL(%rip), %rcx
	movq	%rax, (%rcx)
	movl	_no_ratio(%rip), %edx
	movl	%edx, %eax
	shlq	$3, %rax
	movq	%rax, %rdi
	callq	_malloc
	movq	_ratios@GOTPCREL(%rip), %rcx
	movq	%rax, (%rcx)
	movl	_no_sz(%rip), %edx
	movl	%edx, %eax
	shlq	$3, %rax
	movq	%rax, %rdi
	callq	_malloc
	movq	_sizes@GOTPCREL(%rip), %rcx
	movq	%rax, (%rcx)
	movl	$0, -60(%rbp)
LBB9_33:                                ## =>This Inner Loop Header: Depth=1
	movl	-60(%rbp), %eax
	cmpl	_no_sz(%rip), %eax
	jge	LBB9_36
## BB#34:                               ##   in Loop: Header=BB9_33 Depth=1
	movq	_sizes@GOTPCREL(%rip), %rax
	movq	-24(%rbp), %rcx
	movslq	-60(%rbp), %rdx
	imulq	-40(%rbp), %rdx
	addq	%rdx, %rcx
	movq	(%rax), %rax
	movslq	-60(%rbp), %rdx
	movq	%rcx, (%rax,%rdx,8)
## BB#35:                               ##   in Loop: Header=BB9_33 Depth=1
	movl	-60(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -60(%rbp)
	jmp	LBB9_33
LBB9_36:
	movl	$0, -60(%rbp)
LBB9_37:                                ## =>This Inner Loop Header: Depth=1
	movl	-60(%rbp), %eax
	cmpl	_no_ratio(%rip), %eax
	jge	LBB9_40
## BB#38:                               ##   in Loop: Header=BB9_37 Depth=1
	movq	_ratios@GOTPCREL(%rip), %rax
	movl	-44(%rbp), %ecx
	movl	-60(%rbp), %edx
	imull	-52(%rbp), %edx
	addl	%edx, %ecx
                                        ## implicit-def: %XMM0
	vcvtsi2sdl	%ecx, %xmm0, %xmm0
	movq	(%rax), %rax
	movslq	-60(%rbp), %rsi
	vmovsd	%xmm0, (%rax,%rsi,8)
## BB#39:                               ##   in Loop: Header=BB9_37 Depth=1
	movl	-60(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -60(%rbp)
	jmp	LBB9_37
LBB9_40:
	movl	$0, -60(%rbp)
LBB9_41:                                ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB9_43 Depth 2
	movl	-60(%rbp), %eax
	cmpl	_no_sz(%rip), %eax
	jge	LBB9_48
## BB#42:                               ##   in Loop: Header=BB9_41 Depth=1
	movl	$0, -64(%rbp)
LBB9_43:                                ##   Parent Loop BB9_41 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	-64(%rbp), %eax
	cmpl	_no_ratio(%rip), %eax
	jge	LBB9_46
## BB#44:                               ##   in Loop: Header=BB9_43 Depth=2
	movl	-60(%rbp), %edi
	movl	-64(%rbp), %esi
	callq	_run
## BB#45:                               ##   in Loop: Header=BB9_43 Depth=2
	movl	-64(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -64(%rbp)
	jmp	LBB9_43
LBB9_46:                                ##   in Loop: Header=BB9_41 Depth=1
	jmp	LBB9_47
LBB9_47:                                ##   in Loop: Header=BB9_41 Depth=1
	movl	-60(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -60(%rbp)
	jmp	LBB9_41
LBB9_48:
	callq	_printresults
	xorl	%eax, %eax
	addq	$112, %rsp
	popq	%rbp
	retq
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
L_.str.7:                               ## @.str.7
	.asciz	"%s\n"

L_.str.8:                               ## @.str.8
	.asciz	"VARIANT1: gcc -lm -march=native toupper.c -O0 "

L_.str.9:                               ## @.str.9
	.asciz	"Size: %ld \tRatio: %f \tRunning time:"

L_.str.10:                              ## @.str.10
	.asciz	"\t%s: %f"

L_.str.11:                              ## @.str.11
	.asciz	"\n"

L_.str.12:                              ## @.str.12
	.asciz	"-d"

L_.str.13:                              ## @.str.13
	.asciz	"-l"

L_.str.14:                              ## @.str.14
	.asciz	"-r"

L_.str.15:                              ## @.str.15
	.asciz	"%s"


.subsections_via_symbols
