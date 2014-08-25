(def cons (a b) #[a b])
(def car (a) #(a 0))
(def cdr (a) #(a 1))

(def no (a)
  (is (. a length) 0))

(def lis ()
  (var a arguments)
  (var l nil)
  (eacr x a
    (= l (cons x l)))
  l)

(def len (a) (. a length))

(def dsp (a)
  (if (no a) "[]"
      (+ "[" (car a) ", " (dsp (cdr a)) "]")))

(def al (a)
  (alert (dsp a)))

(def map (x a)
  (if (no a) nil
      (cons (x (car a)) (map x (cdr a)))))

(al (lis 1 2 3))

(al (map [+ _ 5] '(1 2 3 4 5)))

(let a #[1 2 3 4 5]
  (each x a (alert x)))

