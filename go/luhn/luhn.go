package luhn

import (
	"errors"
	"strconv"
	"strings"
)

func Valid(s string) bool {
	digits, err := parseDigits(s)
	if err != nil {
		return false
	}

	sum := 0

	for i := 0; i < len(digits); i++ {
		index := len(digits) - 1 - i
		digit := digits[index]

		if i%2 != 0 {
			digit = transformSecondDigit(digit)
		}

		sum += digit
	}

	return sum%10 == 0
}

func parseDigits(s string) ([]int, error) {
	stripped := strings.Replace(s, " ", "", -1)
	if len(stripped) == 1 {
		return nil, errors.New("string must be longer than 1 character")
	}

	var digits []int
	for _, r := range stripped {

		digit, err := strconv.Atoi(string(r))
		if err != nil {
			return nil, errors.New("string can only contain digits or spaces")
		}

		digits = append(digits, digit)
	}

	return digits, nil
}

func transformSecondDigit(digit int) int {
	digit *= 2
	if digit > 9 {
		digit -= 9
	}
	return digit
}
