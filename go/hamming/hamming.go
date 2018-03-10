// Package hamming contains functions to
// calculate the hamming distance of 2 dna strands
package hamming

import "errors"

// Distance calculates the hamming distance of 2 dna strands
func Distance(a, b string) (int, error) {
  if len(a) != len(b) {
    return -1, errors.New("Strands must be of equal length")
  }

  count := 0
  for i := 0; i < len(a); i++ {
    if a[i] != b[i] {
      count++
    }
  }
  return count, nil
}
