package diffsquares

func SquareOfSums(n int) int {
	return <-square(sum(generate(n)))
}

func SumOfSquares(n int) int {
	return <-sum(square(generate(n)))
}

func Difference(n int) int {
	return SquareOfSums(n) - SumOfSquares(n)
}

func generate(n int) <-chan int {
	out := make(chan int, n)

	go func() {
		for i := 1; i <= n; i++ {
			out <- i
		}
		close(out)
	}()

	return out
}

func sum(in <-chan int) <-chan int {
	out := make(chan int, 100)

	go func() {
		sum := 0
		for num := range in {
			sum += num
		}
		out <- sum
		close(out)
	}()

	return out
}

func square(in <-chan int) <-chan int {
	out := make(chan int, 100)

	go func() {
		for num := range in {
			out <- num * num
		}
		close(out)
	}()

	return out
}
