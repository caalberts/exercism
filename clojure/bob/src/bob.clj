(ns bob
  (:require [clojure.string :as str]))

(defn is-silence? [statement]
  (str/blank? statement))

(defn is-shout? [statement]
  (and (= (str/upper-case statement) statement)
       (some #(Character/isLetter %) (seq statement))))

(defn is-question? [statement]
  (str/ends-with? statement "?"))

(defn response-for [statement]
  (cond
    (is-shout? statement) "Whoa, chill out!"
    (is-question? statement) "Sure."
    (is-silence? statement) "Fine. Be that way!"
    :else "Whatever."
    ))
