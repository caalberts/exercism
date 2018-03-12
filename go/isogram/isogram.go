package isogram

import "unicode"

func IsIsogram(word string) bool {
  record := map[rune]bool{}
  for _, r := range word {
    r = unicode.ToUpper(r)
    if _, present := record[r]; present && unicode.IsLetter(r) {
      return false
    }
    record[r] = true
  }
  return true
}
