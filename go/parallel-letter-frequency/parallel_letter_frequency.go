package letter

import "sync"

type FreqMap map[rune]int

func Frequency(s string) FreqMap {
	m := FreqMap{}
	for _, r := range s {
		m[r]++
	}
	return m
}

func ConcurrentFrequency(s []string) FreqMap {
	var wg sync.WaitGroup
	counters := make([]FreqMap, len(s))

	for i, sentence := range s {
		wg.Add(1)
		go func(counters []FreqMap, i int, sentence string) {
			counters[i] = Frequency(sentence)
			wg.Done()
		}(counters, i, sentence)
	}

	wg.Wait()

	result := FreqMap{}
	for _, counter := range counters {
		for key, value := range counter {
			result[key] += value
		}
	}

	return result
}
