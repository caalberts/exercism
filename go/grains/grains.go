package grains

import (
	"errors"
	"math"
)

func Square(n int) (uint64, error) {
	if n <= 0 || n > 64 {
		return 0, errors.New("n must be between 1 and 64 inclusive")
	}

	exp := float64(n - 1)
	square := uint64(math.Pow(2, exp))
	return square, nil
}

func Total() uint64 {
	var sum uint64
	for n := 1; n <= 64; n++ {
		square, _ := Square(n)
		sum += square
	}
	return sum
}
