package main

import (
	"runtime"
	"unsafe"
)

//go:noescape
func _sum(arrayPtr unsafe.Pointer, arrayLen int64, sum *int64)

func sumOfEvenSIMD(vs []int) int {
	var sum int64
	_sum(unsafe.Pointer(&vs[0]), int64(len(vs)), &sum)
	runtime.KeepAlive(vs)
	return int(sum)
}
