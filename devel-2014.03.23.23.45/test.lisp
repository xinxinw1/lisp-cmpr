(def afteach (a x)
  (if (no a) nil
      (cons (car a)
            (cons x (afteach (cdr a) x)))))

(def mapapd (f a)
  (if (no a) nil
      (+ (f (car a)) (mapapd f (cdr a)))))

(do (def adds (a)
      (if (no a) 0
          (add (car a) (apply adds (cdr a)))))
    
    (defsum 'num adds))

(do (def iso-lis (a b)
      (and (iso (car a) (car b))
           (iso (cdr a) (cdr b))))
  
    (defiso 'lis iso-lis))

(def lis ()
  (var args arguments)
  (var r [])
  (loop (var i (- ($.len args) 1)) (>= i 0) (-- i)
    (if (is i 3) (ret 272))
    (= r (cons #(args (+ 3 4) (do 5 6 7)) r)))
  (if (is r 3) (ret r))
  r)

(def ncdr (n a)
  (if (<= n 0) a
      (no a) nil
      (ncdr (- n 1) (cdr a))))

(def test ()
  (if (isn (+ x 3) (do 3 4 5)) (do (= x 5) (car x))
      (is x 4) (do (= x 5) (= x (and 3 4)))
      (is x 7) (not x)
      (do (= x 9) (alert "hey"))))

(def next (a pos)
  (var o ('obj a pos))
  (if (is-space o) (next a (+ pos (len o)))
      [pos o]))

(def car (a)
  (if (isn #(a 0) udef) #(a 0) []))

(def ajax ()
  (if window.XMLHttpRequest (new XMLHttpRequest)
      (new ActiveXObject "Microsoft.XMLHTTP")))

(def test ()
  (ret "test")
  (cas "3"
    3 (brk)
    4 ()
    5 (do (= x 3) (+= x 4) (ret 5))
    6 (ret "test")
      "nope")
  (cas "3"
    (do "nope" 3 4 (+ 5 6) (thr (err hey "abd"))))
  (cas "3"
    (do "nope" 3 4 (+ 5 6)))
  (swit "3"
    (3 (brk))
    (4)
    (5 "way")
    (6 (ret "test"))
    (def "nope"))
  (cas "3")
  (ret)
  4)

(def hey ())

(foi i (+ 3 (if a b c) 4)
  (r.push (+ i ": " (disp #(a i)))))

(def rev (a)
  (if (arrp a) (.reverse (if (argp a) (copy a) a))
      (strp a)
        (do (var s "")
            (loop (var i (- (len a) 1)) (>= i 0) (-- i)
              (+= s #(a i)))
            s)
      (err rev "Cannot rev a = $1" a)))

(+ 3 (inst (+ 3 (inst (+ 3 a) b)) c) 4)

(def test ()
  (var b 3)
  (if a (var b 3)))

(del (+ x 5))

(+= (+ i 5) 5)

(def is-rgx (a)
  (has #"^\/[^\/]*\/[a-z]*" a))

(+ 29347287528174912 28357238742987598217492)

(def testfn (a)
  (if (fnp a) a #[is _ a]))

(def car (a)
  (+ (if !(udefp #(a 0)) #(a 0) []) 3))

(def evl (a)
  ((or win.execScript #[.call #(win "eval") win _]) a))

(+ 3 4 (- 3 (+ 4 5) 4) (* 3 (* 4 5) (/ 4 (* 3 4)) 10))

(def time ()
  (.get-time (new Date)))

(def del (a n)
  #((a.splice n 1) 0))

(def del (a n)
  (. a #((splice n 1) 0)))

(def head (f)
  (var name #((.exec #"function\s*([^\(]*\(([^\)]*)\))" (f.toString)) 1))
  (ret (if (is #(name 0) "(") (+ "function" name) name)))

#"abc\"cde"

"abc\"cde"

"function\n\t\f\r\"\\\""

(var x)

(= (. (document.getElementById "test") innerHTML) (func 3 4))

(= (. (.getElementById document "test") innerHTML) (func 3 4))

(= (. document (getElementById "test") innerHTML) (func 3 4))

(= (. ((. document getElementById) "test") innerHTML) (func 3 4))

(= (. x #(a 0) (b 9) c) (func 3 4))

(. a)


(whi (> x 3)
  (prn x 3)
  (prn [1 2 3 4 5])
  (prn (* 3 4 5)))

{x 1 3 (+ 3 2) + 34 - #[+ _ 3]}

#|(mac dyn (a x . rest)
  `(do (push ~x ~a)
       (var ret# (do ~@rest))
       (pop ~a)
       ret#))|#

('(fs 34) 56)

(lis 1 2 3 4 5)

(* (pow "3" 3 4) 5 6)

(= #(a 0) 3)
(= eb.test.test (rfn ebtest (a) (prn a)))

(rfn ebtest (a) (prn a))

(= a (do 1 2 3 (do 4 5)))
(= a (- 1 2 3 (- 3 4)))

(++ (+ a))
(+ (++ a))
(++ (- a))
(+ (+ (+ a)))
(- (+ (- a)))
(++ !a)
(not (++ a))
(++ (++ a))
(++ (-- a))
(- (del a))
(del (++ a))
(++ (del a))
(- (- (++ a)))

()

(when (> x 3)
  (prn x)
  (prn "hey")
  (al "testing $1" x))

(var a (f))

(def dyn (a x f)
  (stk a x (f)))

(var g 3)
(dyn g 4
  (test))

;(var a (do))
