package main

import (
	"reflect"
	"runtime"
	"unsafe"
)

//go:noescape
func _sum_branchless(arrayPtr uintptr, arrayLen int64, sum *int64)

func sumOfEvenBranchlessSIMD(vs []int) int {
	var sum int64
	header := (*reflect.SliceHeader)(unsafe.Pointer(&vs))
	_sum_branchless(header.Data, int64(header.Len), &sum)
	runtime.KeepAlive(vs)
	return int(sum)
}
