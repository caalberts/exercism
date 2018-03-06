// This is a "stub" file.  It's a little start on your solution.
// It's not a complete solution though; you have to write some code.

// Package bob should have a package comment that summarizes what it's about.
// https://golang.org/doc/effective_go.html#commentary
package bob

import (
	"strings"
	"unicode"
)

// Hey should have a comment documenting it.
func Hey(remark string) string {
	return respond(strings.TrimSpace(remark))
}

func respond(s string) string {
	switch {
	case empty(s):
		return "Fine. Be that way!"
	case forcefulQuestion(s):
		return "Calm down, I know what I'm doing!"
	case shout(s):
		return "Whoa, chill out!"
	case question(s):
		return "Sure."
	default:
		return "Whatever."
	}
}

func empty(s string) bool {
	return len(s) == 0
}

func forcefulQuestion(s string) bool {
	return question(s) && shout(s)
}

func question(s string) bool {
	return strings.HasSuffix(s, "?")
}

func shout(s string) bool {
	return any(s, unicode.IsUpper) && !any(s, unicode.IsLower)
}

func any(s string, test func(rune) bool) bool {
	for _, r := range s {
		if test(r) {
			return true
		}
	}
	return false
}
