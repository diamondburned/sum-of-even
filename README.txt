sum-of-even
-----------

―❤―▶ go test -bench=.
goos: linux
goarch: amd64
pkg: sum-of-even
cpu: 12th Gen Intel(R) Core(TM) i5-1240P
BenchmarkSumOfEvenBranchful-16         	   75817	     15762 ns/op
BenchmarkSumOfEvenBranchfulSIMD-16     	   80732	     15077 ns/op
BenchmarkSumOfEvenBranchless-16        	   63021	     21568 ns/op
BenchmarkSumOfEvenBranchlessSIMD-16    	   96722	     12411 ns/op
PASS
ok  	sum-of-even	5.609s
