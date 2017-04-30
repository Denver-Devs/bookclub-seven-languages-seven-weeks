; Find:
; Examples using Clojure sequences
; https://clojuredocs.org/clojure.core/sequence
; The formal definition of a Clojure function
; http://clojure-doc.org/articles/language/functions.html (couldn't find a formal def)
; A script for quickly invoking the repl in your environment
; lein repl

(ns day1.core
  (:gen-class))

; Do:
; Implement a function called (big st n) that returns true if a string st
; is longer than n characters.
(defn big [str n] (< n (count str)))

; Write a function called (collection-type col) that returns :list, :map, or :vector based on the type of collection col.
(def typeMap
  {clojure.lang.PersistentArrayMap :map,
   clojure.lang.PersistentVector :vector,
   clojure.lang.PersistentList :list,
   clojure.lang.PersistentList$EmptyList :list})

(defn collectionType [col] (typeMap (type col)))


(defn -main
  "day 1 problems"
  [& args]

  (println "(big \"test string\" 50):")
  (println (big "test string" 50))

  (println "(big \"test string\" 5):")
  (println (big "test string" 5))


  (println)
  (println "(collectionType '(1 2 3)):")
  (println (collectionType '(1 2 3)))

  (println "(collectionType '()):")
  (println (collectionType '()))

  (println "(collectionType { :one 1, :two 2, :three 3 }):")
  (println (collectionType { :one 1, :two 2, :three 3 }))

  (println "(collectionType [1 2 3]):")
  (println (collectionType [1 2 3]))
)
