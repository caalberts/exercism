package raindrops

import (
  "fmt"
  "math"
  "bytes"
)

type Matcher func(int, *bytes.Buffer) *bytes.Buffer

var matchers = []Matcher{
  matcherFactory(3, "Pling"),
  matcherFactory(5, "Plang"),
  matcherFactory(7, "Plong"),
}

func Convert(n int) string {
  var buffer bytes.Buffer

  for _, matcher := range matchers {
    matcher(n, &buffer)
  }

  if buffer.Len() > 0 {
    return buffer.String()
  }

  return fmt.Sprintf("%d", n)
}

func matcherFactory(divisor int, addition string) Matcher {
  return func(n int, buffer *bytes.Buffer) *bytes.Buffer {
    if math.Remainder(float64(n), float64(divisor)) == 0 {
      buffer.WriteString(addition)
    }
    
    return buffer
  }
}
