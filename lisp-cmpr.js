/***** Lisp to JS Compiler Devel *****/

/* require tools >= 3.0 */
/* require prec-math */
/* require ajax */
/* require lisp-tools */
/* require lisp-parse */
/* require lisp-exec */
/* require lisp-core */
/* require lisp-compile-basic */

L.evlf("lib/lisp-compile-basic.lisp");

var but = $("cmp");
var src = $("src");
var res = $("res");

but.onclick = function (){
  res.value = "";
  try {
    L.jcal("cmpp", L.st(src.value));
  } catch (e){
    res.value += e;
  }
};

L.djn("*out*", function (a){
  res.value += L.dat(L.str(a));
  return L.nil();
});

src.value = $.get("test.lisp");

//L.jcal("cmps", L.st($.get("lisp-cmp-core.lisp")));
