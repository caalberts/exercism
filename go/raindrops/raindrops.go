package raindrops

import "strconv"

func Convert(n int) string {
  var buffer string

  if n%3 == 0 {
    buffer += "Pling"
  }
  if n%5 == 0 {
    buffer += "Plang"
  }
  if n%7 == 0 {
    buffer += "Plong"
  }

  if len(buffer) == 0 {
    return strconv.Itoa(n)
  }

  return buffer
}
