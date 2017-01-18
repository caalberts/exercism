(ns rna-transcription
  (:require [clojure.string :as str]))

(def nucleotid-map (hash-map \G \C
                             \C \G
                             \A \U
                             \T \A))

(defn valid? [s]
  (contains? nucleotid-map s))

(defn transcribe [s]
  (assert (valid? s))
  (nucleotid-map s))

(defn to-rna [strand]
  (str/join (map transcribe (seq strand))))
