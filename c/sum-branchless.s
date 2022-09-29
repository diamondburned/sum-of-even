	.text
	.intel_syntax noprefix
	.file	"sum-branchless.c"
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3                               # -- Begin function sum_branchless
.LCPI0_0:
	.quad	1                               # 0x1
	.text
	.globl	sum_branchless
	.p2align	4, 0x90
	.type	sum_branchless,@function
sum_branchless:                         # @sum_branchless
# %bb.0:
	push	rbp
	mov	rbp, rsp
	and	rsp, -8
	test	rsi, rsi
	jle	.LBB0_1
# %bb.2:
	cmp	rsi, 15
	ja	.LBB0_4
# %bb.3:
	xor	r8d, r8d
	xor	r10d, r10d
	jmp	.LBB0_11
.LBB0_1:
	xor	r8d, r8d
	jmp	.LBB0_12
.LBB0_4:
	mov	r10, rsi
	and	r10, -16
	lea	rcx, [r10 - 16]
	mov	r8, rcx
	shr	r8, 4
	inc	r8
	test	rcx, rcx
	je	.LBB0_5
# %bb.6:
	mov	r9, r8
	and	r9, -2
	neg	r9
	vpxor	xmm0, xmm0, xmm0
	xor	ecx, ecx
	vpbroadcastq	ymm4, qword ptr [rip + .LCPI0_0] # ymm4 = [1,1,1,1]
	vpcmpeqd	ymm5, ymm5, ymm5
	vpxor	xmm1, xmm1, xmm1
	vpxor	xmm2, xmm2, xmm2
	vpxor	xmm3, xmm3, xmm3
	.p2align	4, 0x90
.LBB0_7:                                # =>This Inner Loop Header: Depth=1
	vmovdqu	ymm6, ymmword ptr [rdi + 8*rcx]
	vmovdqu	ymm7, ymmword ptr [rdi + 8*rcx + 32]
	vmovdqu	ymm8, ymmword ptr [rdi + 8*rcx + 64]
	vmovdqu	ymm9, ymmword ptr [rdi + 8*rcx + 96]
	vpand	ymm10, ymm6, ymm4
	vpand	ymm11, ymm7, ymm4
	vpand	ymm12, ymm8, ymm4
	vpand	ymm13, ymm9, ymm4
	vpaddq	ymm10, ymm10, ymm5
	vpaddq	ymm11, ymm11, ymm5
	vpaddq	ymm12, ymm12, ymm5
	vpaddq	ymm13, ymm13, ymm5
	vpand	ymm6, ymm10, ymm6
	vpaddq	ymm0, ymm6, ymm0
	vpand	ymm6, ymm11, ymm7
	vpaddq	ymm1, ymm6, ymm1
	vpand	ymm6, ymm12, ymm8
	vpaddq	ymm2, ymm6, ymm2
	vpand	ymm6, ymm13, ymm9
	vpaddq	ymm3, ymm6, ymm3
	vmovdqu	ymm6, ymmword ptr [rdi + 8*rcx + 128]
	vmovdqu	ymm7, ymmword ptr [rdi + 8*rcx + 160]
	vmovdqu	ymm8, ymmword ptr [rdi + 8*rcx + 192]
	vmovdqu	ymm9, ymmword ptr [rdi + 8*rcx + 224]
	vpand	ymm10, ymm6, ymm4
	vpand	ymm11, ymm7, ymm4
	vpand	ymm12, ymm8, ymm4
	vpand	ymm13, ymm9, ymm4
	vpaddq	ymm10, ymm10, ymm5
	vpaddq	ymm11, ymm11, ymm5
	vpaddq	ymm12, ymm12, ymm5
	vpaddq	ymm13, ymm13, ymm5
	vpand	ymm6, ymm10, ymm6
	vpaddq	ymm0, ymm6, ymm0
	vpand	ymm6, ymm11, ymm7
	vpaddq	ymm1, ymm6, ymm1
	vpand	ymm6, ymm12, ymm8
	vpaddq	ymm2, ymm6, ymm2
	vpand	ymm6, ymm13, ymm9
	vpaddq	ymm3, ymm6, ymm3
	add	rcx, 32
	add	r9, 2
	jne	.LBB0_7
# %bb.8:
	test	r8b, 1
	je	.LBB0_10
.LBB0_9:
	vmovdqu	ymm4, ymmword ptr [rdi + 8*rcx]
	vmovdqu	ymm5, ymmword ptr [rdi + 8*rcx + 32]
	vmovdqu	ymm6, ymmword ptr [rdi + 8*rcx + 64]
	vmovdqu	ymm7, ymmword ptr [rdi + 8*rcx + 96]
	vpbroadcastq	ymm8, qword ptr [rip + .LCPI0_0] # ymm8 = [1,1,1,1]
	vpand	ymm9, ymm8, ymm7
	vpcmpeqd	ymm10, ymm10, ymm10
	vpaddq	ymm9, ymm9, ymm10
	vpand	ymm7, ymm9, ymm7
	vpaddq	ymm3, ymm7, ymm3
	vpand	ymm7, ymm8, ymm6
	vpaddq	ymm7, ymm10, ymm7
	vpand	ymm6, ymm7, ymm6
	vpaddq	ymm2, ymm6, ymm2
	vpand	ymm6, ymm8, ymm5
	vpaddq	ymm6, ymm10, ymm6
	vpand	ymm5, ymm6, ymm5
	vpaddq	ymm1, ymm5, ymm1
	vpand	ymm5, ymm8, ymm4
	vpaddq	ymm5, ymm10, ymm5
	vpand	ymm4, ymm5, ymm4
	vpaddq	ymm0, ymm4, ymm0
.LBB0_10:
	vpaddq	ymm1, ymm1, ymm3
	vpaddq	ymm0, ymm0, ymm2
	vpaddq	ymm0, ymm0, ymm1
	vextracti128	xmm1, ymm0, 1
	vpaddq	xmm0, xmm0, xmm1
	vpshufd	xmm1, xmm0, 78                  # xmm1 = xmm0[2,3,0,1]
	vpaddq	xmm0, xmm0, xmm1
	vmovq	r8, xmm0
	cmp	r10, rsi
	je	.LBB0_12
	.p2align	4, 0x90
.LBB0_11:                               # =>This Inner Loop Header: Depth=1
	mov	rcx, qword ptr [rdi + 8*r10]
	mov	eax, ecx
	and	eax, 1
	dec	rax
	and	rax, rcx
	add	r8, rax
	inc	r10
	cmp	rsi, r10
	jne	.LBB0_11
.LBB0_12:
	mov	qword ptr [rdx], r8
	mov	rsp, rbp
	pop	rbp
	vzeroupper
	ret
.LBB0_5:
	vpxor	xmm0, xmm0, xmm0
	xor	ecx, ecx
	vpxor	xmm1, xmm1, xmm1
	vpxor	xmm2, xmm2, xmm2
	vpxor	xmm3, xmm3, xmm3
	test	r8b, 1
	jne	.LBB0_9
	jmp	.LBB0_10
.Lfunc_end0:
	.size	sum_branchless, .Lfunc_end0-sum_branchless
                                        # -- End function
	.type	mask,@object                    # @mask
	.section	.rodata,"a",@progbits
	.globl	mask
	.p2align	2
mask:
	.long	4294967295                      # 0xffffffff
	.size	mask, 4

	.ident	"clang version 11.1.0"
	.section	".note.GNU-stack","",@progbits
	.addrsig
