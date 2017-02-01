(ns beer-song
  (:require [clojure.string :as str]))

(defn bottles
  [n]
  (condp = n
    0 "no more bottles"
    1 "1 bottle"
    (str n " bottles")))

(defn pronoun
  [n]
  (if (= n 1)
    "it"
    "one"))

(defn verse1
  [n]
  (str (str/capitalize (bottles n)) " of beer on the wall, " (bottles n) " of beer.\n"))

(defn verse2
  [n]
  (if (= n 0)
    "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    (str "Take " (pronoun n) " down and pass it around, " (bottles (- n 1)) " of beer on the wall.\n")))

(defn verse
  [n]
  (str (verse1 n) (verse2 n)))

(defn sing
  ([start] (sing start 0))
  ([start end] (str/join "\n" (map verse (range start (dec end) -1)))))
