package grains

import (
	"errors"
)

var cache = make(map[int]uint64)

func Square(n int) (uint64, error) {
	if n <= 0 || n > 64 {
		return 0, errors.New("n must be between 1 and 64 inclusive")
	}

	return square(n), nil
}

func square(n int) uint64 {
	if n == 1 {
		return 1
	}

	if square, exists := cache[n]; exists {
		return square
	}

	cache[n] = square(n-1) * 2
	return cache[n]
}

func Total() uint64 {
	var sum uint64
	for n := 1; n <= 64; n++ {
		square, _ := Square(n)
		sum += square
	}
	return sum
}
