package reverse

import "unicode/utf8"

// String reverse a given string
func String(s string) string {
	length := utf8.RuneCountInString(s)
	reversed := make([]rune, length)
	l := len(reversed)

	for _, r := range s {
		l--
		reversed[l] = r
	}

	return string(reversed)
}
