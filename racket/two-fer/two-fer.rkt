#lang racket

(provide two-fer)

(define two-fer
  (lambda name
    (if (empty? name)
      "One for you, one for me."
      (format "One for ~a, one for me." (first name)))))
