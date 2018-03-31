package grains

import (
	"errors"
)

func Square(n int) (uint64, error) {
	if n <= 0 || n > 64 {
		return 0, errors.New("n must be between 1 and 64 inclusive")
	}

	return powerOfTwo(n - 1), nil
}

func powerOfTwo(n int) uint64 {
	return 1 << uint(n)
}

func Total() uint64 {
	// Sum of geometric progression
	// 2^0 + 2^1 + 2^2 + ... + 2^63
	// 1 + 2x (1 - 2^63) / (1 - 2)
	// 1 - 2 + 2^64
	return powerOfTwo(64) - 1
}
