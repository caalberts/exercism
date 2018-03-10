// Package twofer prints a share statement
package twofer

import "fmt"

// ShareWith returns a sharing statement
func ShareWith(name string) string {
	if len(name) == 0 {
		name = "you"
	}
	return fmt.Sprintf("One for %s, one for me.", name)
}
