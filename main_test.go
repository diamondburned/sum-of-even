package main

import "testing"

var input []int

func init() {
	input = make([]int, 100000)
	for i := range input {
		input[i] = i
	}
}

func BenchmarkSumOfEvenBranchful(b *testing.B) {
	for i := 0; i < b.N; i++ {
		_ = sumOfEven(input)
	}
}

func BenchmarkSumOfEvenBranchfulSIMD(b *testing.B) {
	for i := 0; i < b.N; i++ {
		_ = sumOfEvenSIMD(input)
	}
}

func BenchmarkSumOfEvenBranchless(b *testing.B) {
	for i := 0; i < b.N; i++ {
		_ = sumOfEvenBranchless(input)
	}
}

func BenchmarkSumOfEvenBranchlessSIMD(b *testing.B) {
	for i := 0; i < b.N; i++ {
		_ = sumOfEvenBranchlessSIMD(input)
	}
}
