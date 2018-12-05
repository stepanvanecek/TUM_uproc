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
	pushq	%r12
	pushq	%rbx
Lcfi10:
	.cfi_offset %rbx, -48
Lcfi11:
	.cfi_offset %r12, -40
Lcfi12:
	.cfi_offset %r14, -32
Lcfi13:
	.cfi_offset %r15, -24
	movl	%esi, %r14d
	movq	%rdi, %r12
	leaq	1(%r12), %rdi
	callq	_mymalloc
	movq	%rax, %r15
	movl	$1, %edi
	callq	_srand
	xorl	%ebx, %ebx
	testq	%r12, %r12
	je	LBB2_2
	.p2align	4, 0x90
LBB2_1:                                 ## =>This Inner Loop Header: Depth=1
	movl	%r14d, %edi
	callq	_createChar
	movb	%al, (%r15,%rbx)
	addq	$1, %rbx
	cmpq	%r12, %rbx
	jb	LBB2_1
LBB2_2:
	movb	$0, (%r15,%rbx)
	movq	%r15, %rax
	popq	%rbx
	popq	%r12
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
Lcfi14:
	.cfi_def_cfa_offset 16
Lcfi15:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Lcfi16:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	subq	$16, %rsp
Lcfi17:
	.cfi_offset %rbx, -48
Lcfi18:
	.cfi_offset %r12, -40
Lcfi19:
	.cfi_offset %r14, -32
Lcfi20:
	.cfi_offset %r15, -24
	movl	%edx, %ebx
	imull	_no_sz(%rip), %ebx
	addl	%edi, %ebx
	imull	_no_ratio(%rip), %ebx
	movq	%rcx, %r15
	movl	%esi, %r12d
	movq	_sizes@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movslq	%edi, %rcx
	movq	(%rax,%rcx,8), %rdi
	movq	_ratios@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movslq	%r12d, %rcx
	vcvttsd2si	(%rax,%rcx,8), %esi
	callq	_init
	movq	%rax, %r14
	cmpl	$0, _debug(%rip)
	je	LBB3_2
## BB#1:
	leaq	L_.str(%rip), %rdi
	xorl	%eax, %eax
	movq	%r14, %rsi
	callq	_printf
LBB3_2:
	callq	_gettime
	cmpl	$0, _debug(%rip)
	vmovsd	%xmm0, -48(%rbp)        ## 8-byte Spill
	je	LBB3_4
## BB#3:
	leaq	L_.str.1(%rip), %rdi
	movb	$1, %al
	vmovsd	-48(%rbp), %xmm0        ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	callq	_printf
LBB3_4:
	addl	%r12d, %ebx
	movq	%r14, %rdi
	callq	*%r15
	callq	_gettime
	cmpl	$0, _debug(%rip)
	je	LBB3_6
## BB#5:
	leaq	L_.str.2(%rip), %rdi
	movb	$1, %al
	vmovsd	%xmm0, -40(%rbp)        ## 8-byte Spill
	vmovsd	-40(%rbp), %xmm0        ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	callq	_printf
	vmovsd	-40(%rbp), %xmm0        ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
LBB3_6:
	vsubsd	-48(%rbp), %xmm0, %xmm0 ## 8-byte Folded Reload
	movq	_results@GOTPCREL(%rip), %rax
	movq	(%rax), %rdx
	movslq	%ebx, %rcx
	vmovsd	%xmm0, (%rdx,%rcx,8)
	cmpl	$0, _debug(%rip)
	je	LBB3_8
## BB#7:
	movq	(%rax), %rax
	vmovsd	(%rax,%rcx,8), %xmm0    ## xmm0 = mem[0],zero
	leaq	L_.str.3(%rip), %rdi
	movb	$1, %al
	callq	_printf
	cmpl	$0, _debug(%rip)
	je	LBB3_8
## BB#9:
	leaq	L_.str.4(%rip), %rdi
	xorl	%eax, %eax
	movq	%r14, %rsi
	addq	$16, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	_printf                 ## TAILCALL
LBB3_8:
	addq	$16, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc

	.p2align	4, 0x90
_gettime:                               ## @gettime
	.cfi_startproc
## BB#0:
	pushq	%rbp
Lcfi21:
	.cfi_def_cfa_offset 16
Lcfi22:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Lcfi23:
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

	.p2align	4, 0x90
_toupper_simple:                        ## @toupper_simple
	.cfi_startproc
## BB#0:
	pushq	%rbp
Lcfi24:
	.cfi_def_cfa_offset 16
Lcfi25:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Lcfi26:
	.cfi_def_cfa_register %rbp
	movb	(%rdi), %al
	testb	%al, %al
	je	LBB5_5
## BB#1:
	addq	$1, %rdi
	.p2align	4, 0x90
LBB5_2:                                 ## =>This Inner Loop Header: Depth=1
	movl	%eax, %ecx
	addb	$-97, %cl
	cmpb	$25, %cl
	ja	LBB5_4
## BB#3:                                ##   in Loop: Header=BB5_2 Depth=1
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

	.p2align	4, 0x90
_toupper_optimised:                     ## @toupper_optimised
	.cfi_startproc
## BB#0:
	pushq	%rbp
Lcfi27:
	.cfi_def_cfa_offset 16
Lcfi28:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Lcfi29:
	.cfi_def_cfa_register %rbp
	pushq	%rbx
Lcfi30:
	.cfi_offset %rbx, -24
	movq	%rdi, %r8
	movb	(%r8), %al
	testb	%al, %al
	je	LBB6_3
## BB#1:
	xorl	%edi, %edi
	movq	%r8, %rsi
	.p2align	4, 0x90
LBB6_2:                                 ## =>This Inner Loop Header: Depth=1
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
	jne	LBB6_2
LBB6_3:
	cmpl	$0, _debug(%rip)
	je	LBB6_4
## BB#5:
	leaq	L_.str.15(%rip), %rdi
	xorl	%eax, %eax
	movq	%r8, %rsi
	popq	%rbx
	popq	%rbp
	jmp	_printf                 ## TAILCALL
LBB6_4:
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
Lcfi31:
	.cfi_def_cfa_offset 16
Lcfi32:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Lcfi33:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
Lcfi34:
	.cfi_offset %rbx, -48
Lcfi35:
	.cfi_offset %r12, -40
Lcfi36:
	.cfi_offset %r14, -32
Lcfi37:
	.cfi_offset %r15, -24
	movl	%esi, %r14d
	movl	%edi, %r15d
	movq	_toupperversion+8(%rip), %rcx
	testq	%rcx, %rcx
	je	LBB7_3
## BB#1:
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

	.globl	_printresults
	.p2align	4, 0x90
_printresults:                          ## @printresults
	.cfi_startproc
## BB#0:
	pushq	%rbp
Lcfi38:
	.cfi_def_cfa_offset 16
Lcfi39:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Lcfi40:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
Lcfi41:
	.cfi_offset %rbx, -56
Lcfi42:
	.cfi_offset %r12, -48
Lcfi43:
	.cfi_offset %r13, -40
Lcfi44:
	.cfi_offset %r14, -32
Lcfi45:
	.cfi_offset %r15, -24
	leaq	L_.str.8(%rip), %rdi
	callq	_puts
	cmpl	$0, _no_sz(%rip)
	jle	LBB8_9
## BB#1:
	xorl	%ecx, %ecx
	.p2align	4, 0x90
LBB8_2:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB8_4 Depth 2
                                        ##       Child Loop BB8_6 Depth 3
	cmpl	$0, _no_ratio(%rip)
	jle	LBB8_8
## BB#3:                                ##   in Loop: Header=BB8_2 Depth=1
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
	leaq	L_.str.9(%rip), %rdi
	callq	_printf
	cmpl	$0, _no_version(%rip)
	movq	_results@GOTPCREL(%rip), %r15
	movq	%r15, %rcx
	leaq	L_.str.10(%rip), %rbx
	jle	LBB8_7
## BB#5:                                ##   in Loop: Header=BB8_4 Depth=2
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

	.globl	_main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## BB#0:
	pushq	%rbp
Lcfi46:
	.cfi_def_cfa_offset 16
Lcfi47:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Lcfi48:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$56, %rsp
Lcfi49:
	.cfi_offset %rbx, -56
Lcfi50:
	.cfi_offset %r12, -48
Lcfi51:
	.cfi_offset %r13, -40
Lcfi52:
	.cfi_offset %r14, -32
Lcfi53:
	.cfi_offset %r15, -24
	movq	%rsi, %r13
	xorl	%ebx, %ebx
	cmpl	$2, %edi
	jl	LBB9_1
## BB#2:
	movslq	%edi, %rax
	movq	%rax, -80(%rbp)         ## 8-byte Spill
	movl	$50, %r15d
	xorl	%eax, %eax
	movq	%rax, -64(%rbp)         ## 8-byte Spill
	movl	$1, -44(%rbp)           ## 4-byte Folded Spill
	movl	$10000, %eax            ## imm = 0x2710
	movq	%rax, -56(%rbp)         ## 8-byte Spill
	movl	$800000, %r14d          ## imm = 0xC3500
	movl	$3, %r12d
	xorl	%eax, %eax
	movq	%rax, -72(%rbp)         ## 8-byte Spill
	movq	%r13, -88(%rbp)         ## 8-byte Spill
	.p2align	4, 0x90
LBB9_3:                                 ## =>This Inner Loop Header: Depth=1
	movq	-16(%r13,%r12,8), %rsi
	leaq	L_.str.12(%rip), %rdi
	callq	_strcmp
	testl	%eax, %eax
	jne	LBB9_5
## BB#4:                                ##   in Loop: Header=BB9_3 Depth=1
	movl	$1, _debug(%rip)
LBB9_5:                                 ##   in Loop: Header=BB9_3 Depth=1
	movq	-16(%r13,%r12,8), %rsi
	leaq	L_.str.13(%rip), %rdi
	callq	_strcmp
	testl	%eax, %eax
	jne	LBB9_10
## BB#6:                                ##   in Loop: Header=BB9_3 Depth=1
	movq	-8(%r13,%r12,8), %rdi
	callq	_atoi
	movslq	%eax, %r14
	cmpq	-80(%rbp), %r12         ## 8-byte Folded Reload
	jge	LBB9_16
## BB#7:                                ##   in Loop: Header=BB9_3 Depth=1
	movq	(%r13,%r12,8), %r13
	leaq	L_.str.14(%rip), %rdi
	movq	%r13, %rsi
	callq	_strcmp
	testl	%eax, %eax
	je	LBB9_16
## BB#8:                                ##   in Loop: Header=BB9_3 Depth=1
	leaq	L_.str.12(%rip), %rdi
	movq	%r13, %rsi
	callq	_strcmp
	testl	%eax, %eax
	je	LBB9_16
## BB#9:                                ##   in Loop: Header=BB9_3 Depth=1
	movq	%r13, %rdi
	callq	_atoi
	cltq
	movq	%rax, -72(%rbp)         ## 8-byte Spill
	movq	-88(%rbp), %r13         ## 8-byte Reload
	movq	8(%r13,%r12,8), %rdi
	callq	_atoi
	cltq
	movq	%rax, -56(%rbp)         ## 8-byte Spill
LBB9_10:                                ##   in Loop: Header=BB9_3 Depth=1
	movq	-16(%r13,%r12,8), %rsi
	leaq	L_.str.14(%rip), %rdi
	callq	_strcmp
	testl	%eax, %eax
	jne	LBB9_15
## BB#11:                               ##   in Loop: Header=BB9_3 Depth=1
	movq	-8(%r13,%r12,8), %rdi
	callq	_atoi
	movl	%eax, %r15d
	cmpq	-80(%rbp), %r12         ## 8-byte Folded Reload
	jge	LBB9_16
## BB#12:                               ##   in Loop: Header=BB9_3 Depth=1
	movq	(%r13,%r12,8), %r13
	leaq	L_.str.13(%rip), %rdi
	movq	%r13, %rsi
	callq	_strcmp
	testl	%eax, %eax
	je	LBB9_16
## BB#13:                               ##   in Loop: Header=BB9_3 Depth=1
	leaq	L_.str.12(%rip), %rdi
	movq	%r13, %rsi
	callq	_strcmp
	testl	%eax, %eax
	je	LBB9_16
## BB#14:                               ##   in Loop: Header=BB9_3 Depth=1
	movq	%r13, %rdi
	callq	_atoi
                                        ## kill: %EAX<def> %EAX<kill> %RAX<def>
	movq	%rax, -64(%rbp)         ## 8-byte Spill
	movq	-88(%rbp), %r13         ## 8-byte Reload
	movq	8(%r13,%r12,8), %rdi
	callq	_atoi
	movl	%eax, -44(%rbp)         ## 4-byte Spill
LBB9_15:                                ##   in Loop: Header=BB9_3 Depth=1
	leaq	1(%r12), %rax
	addq	$-1, %r12
	cmpq	-80(%rbp), %r12         ## 8-byte Folded Reload
	movq	%rax, %r12
	jl	LBB9_3
	jmp	LBB9_16
LBB9_1:
	movl	$50, %r15d
	movl	$1, -44(%rbp)           ## 4-byte Folded Spill
	movl	$800000, %r14d          ## imm = 0xC3500
	movl	$10000, %eax            ## imm = 0x2710
	movq	%rax, -56(%rbp)         ## 8-byte Spill
	movl	$0, %eax
	movq	%rax, -64(%rbp)         ## 8-byte Spill
	xorl	%eax, %eax
	movq	%rax, -72(%rbp)         ## 8-byte Spill
LBB9_16:
	cmpq	$0, _toupperversion+8(%rip)
	movq	-72(%rbp), %rsi         ## 8-byte Reload
	je	LBB9_20
## BB#17:
	xorl	%ebx, %ebx
	leaq	_toupperversion+24(%rip), %rax
	.p2align	4, 0x90
LBB9_18:                                ## =>This Inner Loop Header: Depth=1
	addl	$1, %ebx
	cmpq	$0, (%rax)
	leaq	16(%rax), %rax
	jne	LBB9_18
## BB#19:
	movl	%ebx, _no_version(%rip)
LBB9_20:
	movl	$1, %ecx
	movl	$1, %eax
	testq	%rsi, %rsi
	je	LBB9_22
## BB#21:
	subq	%r14, %rsi
	xorl	%edx, %edx
	movq	%rsi, %rax
	divq	-56(%rbp)               ## 8-byte Folded Reload
	addl	$1, %eax
LBB9_22:
	movl	%eax, _no_sz(%rip)
	movq	-64(%rbp), %rax         ## 8-byte Reload
	testl	%eax, %eax
	je	LBB9_24
## BB#23:
	subl	%r15d, %eax
                                        ## kill: %EAX<def> %EAX<kill> %RAX<kill>
	cltd
	idivl	-44(%rbp)               ## 4-byte Folded Reload
	movl	%eax, %ecx
	addl	$1, %ecx
LBB9_24:
	movl	%ecx, _no_ratio(%rip)
	imull	%ecx, %ebx
	imull	_no_sz(%rip), %ebx
	shlq	$3, %rbx
	movq	%rbx, %rdi
	callq	_malloc
	movq	_results@GOTPCREL(%rip), %rcx
	movq	%rax, (%rcx)
	movl	_no_ratio(%rip), %edi
	shlq	$3, %rdi
	callq	_malloc
	movq	_ratios@GOTPCREL(%rip), %r12
	movq	%rax, (%r12)
	movl	_no_sz(%rip), %ebx
	movq	%rbx, %rdi
	shlq	$3, %rdi
	callq	_malloc
	movq	_sizes@GOTPCREL(%rip), %rcx
	movq	%rax, (%rcx)
	testl	%ebx, %ebx
	movq	-56(%rbp), %rsi         ## 8-byte Reload
	jle	LBB9_27
## BB#25:
	movq	(%rcx), %rax
	movslq	_no_sz(%rip), %rcx
	xorl	%edx, %edx
	.p2align	4, 0x90
LBB9_26:                                ## =>This Inner Loop Header: Depth=1
	movq	%r14, (%rax,%rdx,8)
	addq	$1, %rdx
	addq	%rsi, %r14
	cmpq	%rcx, %rdx
	jl	LBB9_26
LBB9_27:
	cmpl	$0, _no_ratio(%rip)
	movl	-44(%rbp), %esi         ## 4-byte Reload
	jle	LBB9_30
## BB#28:
	movq	(%r12), %rax
	movslq	_no_ratio(%rip), %rcx
	xorl	%edx, %edx
	.p2align	4, 0x90
LBB9_29:                                ## =>This Inner Loop Header: Depth=1
	vcvtsi2sdl	%r15d, %xmm1, %xmm0
	vmovsd	%xmm0, (%rax,%rdx,8)
	addq	$1, %rdx
	addl	%esi, %r15d
	cmpq	%rcx, %rdx
	jl	LBB9_29
LBB9_30:
	cmpl	$0, _no_sz(%rip)
	jle	LBB9_36
## BB#31:
	xorl	%r14d, %r14d
	.p2align	4, 0x90
LBB9_32:                                ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB9_34 Depth 2
	cmpl	$0, _no_ratio(%rip)
	jle	LBB9_35
## BB#33:                               ##   in Loop: Header=BB9_32 Depth=1
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB9_34:                                ##   Parent Loop BB9_32 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	%r14d, %edi
	movl	%ebx, %esi
	callq	_run
	addl	$1, %ebx
	cmpl	_no_ratio(%rip), %ebx
	jl	LBB9_34
LBB9_35:                                ##   in Loop: Header=BB9_32 Depth=1
	addl	$1, %r14d
	cmpl	_no_sz(%rip), %r14d
	jl	LBB9_32
LBB9_36:
	callq	_printresults
	xorl	%eax, %eax
	addq	$56, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
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
	.asciz	"VARIANT2: gcc -lm -march=native toupper.c -O1"

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
