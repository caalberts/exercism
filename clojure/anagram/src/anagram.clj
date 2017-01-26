(ns anagram
  (:require [clojure.string :as str]))

(defn count-letter
  [counter letter]
  (let [current (get counter letter)]
    (if current
      (assoc counter letter (inc current))
      (assoc counter letter 1))))

(defn letter-count
  [word]
  (reduce count-letter {} (str/split word #"")))

(defn is-anagram?
 [word candidate]
 (and
   (not= word (str/lower-case candidate))
   (= (letter-count word) (letter-count (str/lower-case candidate)))))

(defn anagrams-for
  [word candidates]
  (filter (partial is-anagram? (str/lower-case word)) candidates))
