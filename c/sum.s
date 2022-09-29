	.text
	.intel_syntax noprefix
	.file	"sum.c"
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3                               # -- Begin function sum
.LCPI0_0:
	.quad	1                               # 0x1
	.text
	.globl	sum
	.p2align	4, 0x90
	.type	sum,@function
sum:                                    # @sum
# %bb.0:
	push	rbp
	mov	rbp, rsp
	and	rsp, -8
	test	rsi, rsi
	jle	.LBB0_1
# %bb.2:
	cmp	rsi, 15
	ja	.LBB0_6
# %bb.3:
	xor	r10d, r10d
	xor	ecx, ecx
	jmp	.LBB0_4
.LBB0_1:
	xor	ecx, ecx
	jmp	.LBB0_13
.LBB0_6:
	mov	r10, rsi
	and	r10, -16
	lea	rcx, [r10 - 16]
	mov	r8, rcx
	shr	r8, 4
	inc	r8
	test	rcx, rcx
	je	.LBB0_7
# %bb.8:
	mov	r9, r8
	and	r9, -2
	neg	r9
	vpxor	xmm4, xmm4, xmm4
	xor	ecx, ecx
	vpbroadcastq	ymm5, qword ptr [rip + .LCPI0_0] # ymm5 = [1,1,1,1]
	vpxor	xmm0, xmm0, xmm0
	vpxor	xmm1, xmm1, xmm1
	vpxor	xmm2, xmm2, xmm2
	vpxor	xmm3, xmm3, xmm3
	.p2align	4, 0x90
.LBB0_9:                                # =>This Inner Loop Header: Depth=1
	vmovdqu	ymm6, ymmword ptr [rdi + 8*rcx]
	vmovdqu	ymm7, ymmword ptr [rdi + 8*rcx + 32]
	vmovdqu	ymm8, ymmword ptr [rdi + 8*rcx + 64]
	vmovdqu	ymm9, ymmword ptr [rdi + 8*rcx + 96]
	vpand	ymm10, ymm6, ymm5
	vpand	ymm11, ymm7, ymm5
	vpand	ymm12, ymm8, ymm5
	vpand	ymm13, ymm9, ymm5
	vpcmpeqq	ymm10, ymm10, ymm4
	vpand	ymm6, ymm10, ymm6
	vpaddq	ymm0, ymm6, ymm0
	vpcmpeqq	ymm6, ymm11, ymm4
	vpand	ymm6, ymm6, ymm7
	vpaddq	ymm1, ymm6, ymm1
	vpcmpeqq	ymm6, ymm12, ymm4
	vpand	ymm6, ymm8, ymm6
	vpaddq	ymm2, ymm6, ymm2
	vpcmpeqq	ymm6, ymm13, ymm4
	vpand	ymm6, ymm9, ymm6
	vpaddq	ymm3, ymm6, ymm3
	vmovdqu	ymm6, ymmword ptr [rdi + 8*rcx + 128]
	vmovdqu	ymm7, ymmword ptr [rdi + 8*rcx + 160]
	vmovdqu	ymm8, ymmword ptr [rdi + 8*rcx + 192]
	vmovdqu	ymm9, ymmword ptr [rdi + 8*rcx + 224]
	vpand	ymm10, ymm6, ymm5
	vpand	ymm11, ymm7, ymm5
	vpand	ymm12, ymm8, ymm5
	vpand	ymm13, ymm9, ymm5
	vpcmpeqq	ymm10, ymm10, ymm4
	vpand	ymm6, ymm10, ymm6
	vpaddq	ymm0, ymm6, ymm0
	vpcmpeqq	ymm6, ymm11, ymm4
	vpand	ymm6, ymm6, ymm7
	vpaddq	ymm1, ymm6, ymm1
	vpcmpeqq	ymm6, ymm12, ymm4
	vpand	ymm6, ymm8, ymm6
	vpaddq	ymm2, ymm6, ymm2
	vpcmpeqq	ymm6, ymm13, ymm4
	vpand	ymm6, ymm9, ymm6
	vpaddq	ymm3, ymm6, ymm3
	add	rcx, 32
	add	r9, 2
	jne	.LBB0_9
# %bb.10:
	test	r8b, 1
	je	.LBB0_12
.LBB0_11:
	vmovdqu	ymm4, ymmword ptr [rdi + 8*rcx]
	vmovdqu	ymm5, ymmword ptr [rdi + 8*rcx + 32]
	vmovdqu	ymm6, ymmword ptr [rdi + 8*rcx + 64]
	vmovdqu	ymm7, ymmword ptr [rdi + 8*rcx + 96]
	vpbroadcastq	ymm8, qword ptr [rip + .LCPI0_0] # ymm8 = [1,1,1,1]
	vpand	ymm9, ymm8, ymm7
	vpxor	xmm10, xmm10, xmm10
	vpcmpeqq	ymm9, ymm9, ymm10
	vpand	ymm7, ymm9, ymm7
	vpaddq	ymm3, ymm7, ymm3
	vpand	ymm7, ymm8, ymm6
	vpcmpeqq	ymm7, ymm7, ymm10
	vpand	ymm6, ymm7, ymm6
	vpaddq	ymm2, ymm6, ymm2
	vpand	ymm6, ymm8, ymm5
	vpcmpeqq	ymm6, ymm6, ymm10
	vpand	ymm5, ymm6, ymm5
	vpaddq	ymm1, ymm5, ymm1
	vpand	ymm5, ymm8, ymm4
	vpcmpeqq	ymm5, ymm5, ymm10
	vpand	ymm4, ymm5, ymm4
	vpaddq	ymm0, ymm4, ymm0
.LBB0_12:
	vpaddq	ymm1, ymm1, ymm3
	vpaddq	ymm0, ymm0, ymm2
	vpaddq	ymm0, ymm0, ymm1
	vextracti128	xmm1, ymm0, 1
	vpaddq	xmm0, xmm0, xmm1
	vpshufd	xmm1, xmm0, 78                  # xmm1 = xmm0[2,3,0,1]
	vpaddq	xmm0, xmm0, xmm1
	vmovq	rcx, xmm0
	cmp	r10, rsi
	je	.LBB0_13
.LBB0_4:
	xor	r8d, r8d
	.p2align	4, 0x90
.LBB0_5:                                # =>This Inner Loop Header: Depth=1
	mov	rax, qword ptr [rdi + 8*r10]
	test	al, 1
	cmovne	rax, r8
	add	rcx, rax
	inc	r10
	cmp	rsi, r10
	jne	.LBB0_5
.LBB0_13:
	mov	qword ptr [rdx], rcx
	mov	rsp, rbp
	pop	rbp
	vzeroupper
	ret
.LBB0_7:
	vpxor	xmm0, xmm0, xmm0
	xor	ecx, ecx
	vpxor	xmm1, xmm1, xmm1
	vpxor	xmm2, xmm2, xmm2
	vpxor	xmm3, xmm3, xmm3
	test	r8b, 1
	jne	.LBB0_11
	jmp	.LBB0_12
.Lfunc_end0:
	.size	sum, .Lfunc_end0-sum
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
