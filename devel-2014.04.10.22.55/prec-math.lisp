;;;; Precise Math Library Devel ;;;;

(with (win window udf)
  ;;; Import ;;;
  
  (imp $ nump strp inp al err)
  
  (var inf Infinity)
  
  ;;; Macros ;;;
  
  (mac num (a) `(Number ,a))
  (mac str (a) `(String ,a))
  
  (mac len (a) `(. ,a length))
  (mac pos (x a (o n nil)) `(.indexOf ,a ,x ,n))
  
  (mac has (x a) `(isn (pos ,x ,a) -1))
  (mac hsn (x a) `(is (pos ,x ,a) -1))
  (mac har (x a) `(.test ,x ,a))
  (mac sli (a n (o m nil)) `(.substring ,a ,n ,m))
  
  (mac fst (a) `#(,a 0))
  (mac las (a) `#(,a (- (len ,a) 1)))
  
  (mac udfp (a) `(is a udf))
  (mac nulp (a) `(is a null))
  
  #|(las a)
  (sli a 1)
  (pos "test" a)|#
  
  ;;; Default precision ;;;
  
  (var pc 16)
  
  (def prec (p)
    (if (udfp p) pc
        (= pc p)))
  
  ;;; Js number constants ;;;
  
  ; Javascript largest integer: 2^53 = 9007199254740992
  ; Javascript largest float ≈ 1.79769313486231580793728e+308
  ; shortened to 1.7976931348623157e+308
  
  ;;; Real number functions ;;;
  
  ;; Validators ;;
  
  (dfm vldp (a)
    (and (strp a) (har #"^(\+|-)?[0-9]+(\.[0-9]+)?$" a)))
  
  ;; Predicates ;;
  
  (dfm posp (a)
    (isn (fst a) "-"))
  
  (dfm negp (a)
    (is (fst a) "-"))
  
  (dfm intp (a)
    (hsn "." a))
  
  (dfm decp (a)
    (has "." a))
        
  (dfm evnp (a)
    (if (decp a) false
        (in (las a) "0" "2" "4" "6" "8")))
  
  (dfm oddp (a)
    (if (decp a) false
        (in (las a) "1" "3" "5" "7" "9")))
  
  (dfm d5p (a)
    (if (decp a) false
        (in (las a) "0" "5")))
  
  (var x (oddp "5"))
  
  ;; Converters ;;
  
  (def real (a)
    (if (vldp a) a
        (nump a) (str a)
        false))
  
  (def rint (a)
    (if (vldp a)
          (if (intp a) a false)
        (and (nump a) (intp (str a)))
          (str a)
        false))
  
  ;; Processing functions ;;
  
  (mac pd (a) `(pos "." ,a))
  
  (def pdot (a)
    (var dot (pd a))
    (if (is dot -1) (len a) dot))
  
  (def rdot (a)
    (var dot (pd a))
    (if (is dot -1) a
        (+ (sli a 0 dot) (sli a (+ dot 1)))))
  
  (dfm lint (a)
    (if (negp a) (- (pdot a) 1) (pdot a)))
  
  (def ldec (a)
    (var dot (pd a))
    (if (is dot -1) 0 (- (len a) 1 dot)))
  
  (def lbth (a)
    (var dot (pd a))
    (if (is dot -1) [0 a]
        [dot (- (len a) 1 dot)]))
  
  #|function decrem(a){
    var dot = pos(".", a);
    if (dot == -1)return [0, a];
    return [len(a)-1-dot, triml(sli(a, 0, dot) + sli(a, dot+1))];
  }|#
  
  (def sint (a)
    (var dot (pd a))
    (if (is dot -1) a
        (sli a 0 dot)))
  
  (def sdec (a)
    (var dot (pd a))
    (if (is dot -1) ""
        (sli a (+ dot 1))))
  
  (dfm sign (a)
    (if (negp a) "-" ""))
  
  (dfm abs (a)
    (if (negp a) (sli a 1) a))
  
  (dfm abn (a) (sli a 1))
  
  ; remove redundant if when ifln of multiple is avail
  (dfm xsgn (a b)
    (if (negp a)
          (if (posp b) ["-" (abn a) b]
              ["" (abn a) (abn b)])
        (if (negp b) ["-" a (abn b)]
            ["" a b])))
  
  ;(var x (xsgn a))
  
  ; redundant if
  (dfm neg (a)
    (if (is a "0") a
        (if (negp a) (abn a)
            (+ "-" a))))
  
  (dfm nneg (a)
    (if (is a "0") a
        (+ "-" a)))
  
  (def trim (a)
    (var s (negp a))
    (do (if s (= a (abn a)))
        (= a (triml (if (intp a) a (trimr a))))
        (if s (nneg a) a)))
  
  (def triml (a)
    (to i (len a)
      (if (isn #(a i) "0")
        (if (is #(a i) ".") (ret (sli a (- i 1)))
            (isn i 0) (ret (sli a i))
            (ret a))))
    "0")
  
  (def trimr (a)
    (fr i (- (len a) 1)
      (if (isn #(a i) "0")
        (if (is #(a i) ".") (ret (sli a 0 i))
            (isn i (- (len a) 1)) (ret (sli a 0 (+ i 1)))
            (ret a))))
    "0")
  
  (def pad (a b)
    (var alen (len a))
    (var blen (len b))
    (var adot (pd a))
    (var bdot (pd b))
    
    (if (is adot -1)
      (if (is bdot -1)
        (do (rep (- alen blen) (= b (+ "0" b)))
            (rep (- blen alen) (= a (+ "0" a)))
            (ret [a b]))
        (do (+= a ".0")
            (= adot alen)
            (+= alen 2)))
      (if (is bdot -1)
        (do (+= b ".0")
            (= bdot blen)
            (+= blen 2))))
    
    (rep (- (- alen adot) (- blen bdot)) (+= b "0"))
    (rep (- (- blen bdot) (- alen adot)) (+= a "0"))
    
    (rep (- adot bdot) (= b (+ "0" b)))
    (rep (- bdot adot) (= a (+ "0" a)))
    
    [a b])
  
  (def pad (a b)
    [(+ (nof (- (lint b) (lint a)) "0")
        a
        (if (and (intp a) (decp b)) "." "")
        (nof (- (ldec b) (ldec a)) "0"))
     (+ (nof (- (lint a) (lint b)) "0")
        b
        (if (and (intp b) (decp a)) "." "")
        (nof (- (ldec a) (ldec b)) "0"))])
  
)
