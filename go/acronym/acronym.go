// Package acronym contains utilities relating to acronyms
package acronym

import "unicode"

// Abbreviate creates an acronym from given phrase.
func Abbreviate(s string) string {
	var acronym []rune

	for i, r := range s {
		if (i == 0) || (s[i-1] == ' ') || (s[i-1] == '-') {
			acronym = append(acronym, unicode.ToUpper(r))
		}
	}
	return string(acronym)
}
