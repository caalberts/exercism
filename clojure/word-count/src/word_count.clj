(ns word-count
  (:require [clojure.string :as str]))

(defn filter-characters [chars]
  (apply str
         (filter #(or (Character/isSpace %)
                      (Character/isDigit %)
                      (Character/isLetter %)) chars)))

(defn prepare-string [string]
  (-> string
      filter-characters
      str/lower-case
      (str/split #" +")))

(defn count-word [counter word]
  (let [current (get counter word)]
    (if (nil? current)
      (assoc counter word 1)
      (assoc counter word (inc current)))))

(defn word-count [words]
  (reduce count-word {} (prepare-string words)))
