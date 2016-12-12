local Test in
   proc {Test X}
      case X
      of a|Z then {Browse 'case'(1)}
      [] f(a) then {Browse 'case'(2)}
      [] Y|Z andthen Y==Z then {Browse 'case'(3)}
      [] Y|Z then {Browse 'case'(4)}
      [] f(Y) then {Browse 'case'(5)}
      else {Browse 'case'(6)} end
end
   {Test [b c a]} %4
   {Test f(b(3))} %5
   {Test f(a)} %2
   {Test f(a(3))} %5
   {Test f(d)} %1, en realidad 5, no tuve en cuenta el pattern matching del atomo
   {Test [a b c]} %4, en realidad 1, idem
   {Test [c a b]} %4
   {Test a|a} %3, en realidad 1, idem
   {Test '|'(v b)} %4
   {Test '|'(a a)} %3, en realidad 1, idem
   {Test '|'(b b)} %3
   {Test '|'(a b c)} %4, Es una tupla, no una lista
   {Test '|'(a [b c])} %1, ok, pensé que era por otra cosa
end
