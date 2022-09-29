all: sum_amd64.s sum-branchless_amd64.s

sum_amd64.s: c/sum.c
	clang -Wall -O3 -msse2 -march=skylake -masm=intel -mno-red-zone -mstackrealign -mllvm -inline-threshold=1000 -fno-asynchronous-unwind-tables -fno-exceptions -fno-rtti -S -o ./c/sum.s ./c/sum.c 
	c2goasm -a ./c/sum.s ./sum_amd64.s

sum-branchless_amd64.s: c/sum-branchless.c
	clang -Wall -O3 -msse2 -march=skylake -masm=intel -mno-red-zone -mstackrealign -mllvm -inline-threshold=1000 -fno-asynchronous-unwind-tables -fno-exceptions -fno-rtti -S -o ./c/sum-branchless.s ./c/sum-branchless.c 
	c2goasm -a ./c/sum-branchless.s ./sum-branchless_amd64.s

