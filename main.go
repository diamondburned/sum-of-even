package main

import (
	"fmt"
)

func main() {
	fmt.Println(sumOfEven([]int{0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}))
	fmt.Println(sumOfEvenSIMD([]int{0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}))
	fmt.Println(sumOfEvenBranchless([]int{0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}))
	fmt.Println(sumOfEvenBranchlessSIMD([]int{0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}))
	// fmt.Println(missing([]int{0, 1, 2, 3, 5, 6, 7, 8, 9, 10}))
}

const mask = ^0

func sumOfEvenBranchless(vs []int) int {
	var sum int
	for _, v := range vs {
		m := ^(v & 1 * mask)
		sum += v & m
	}
	return sum
}

func sumOfEven(vs []int) int {
	var sum int
	for _, v := range vs {
		if v%2 == 0 {
			sum += v
		}
	}
	return sum
}
