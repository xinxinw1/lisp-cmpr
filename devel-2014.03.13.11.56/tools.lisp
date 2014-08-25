;;; Tools Devel ;;;

((fn (win udef)
   (var doc win.document)
   (var inf Infinity)
   
   ;; Type ;;
   
   (def gcls (a)
     (Object.prototype.toString.call a))
   
   (def type (a)
     (var tp (gcls a))
     (case tp
       "[object Object]"    "obj"
       "[object String]"    "str"
       "[object Number]"    "num"
       "[object Array]"     "arr"
       "[object Arguments]" "args"
       "[object Function]"  "fn"
       "[object Undefined]" "udef"
       "[object Boolean]"   "bool"
       "[object RegExp]"    "rgx"
       "[object Null]"      "null"
                            tp))
   
   ;; Predicates ;;
   
   (def objp (a)
     (is (gcls a) "[object Object]"))
   
   (def strp (a)
     (is (gcls a) "[object String]"))
   
   (def strp (a)
     (is (gcls a) "[object Number]"))
   
   (def arrp (a)
     (or (is (gcls a) "[object Array]") (argp a)))
   
   (def fnp (a)
     (is (gcls a) "[object Function]"))
   
   (def rgxp (a)
     (is (gcls a) "[object RegExp]"))
   
   (def udefp (a) (is a udef))
   (def nullp (a) (is a null))
   
   ;; Comparison ;;
   
   (def is (a b) (is a b))
   
   (def iso (a b)
     (if (is a b) true
         (and !(arrp a) !(arrp b)) false
         (isnt (len a) (len b)) false
         (do
           (loop (var i 0) (< i (len a)) (++ i)
             (if (isnt (# a i) (# b i)) (return false)))
           true)))
) window)
