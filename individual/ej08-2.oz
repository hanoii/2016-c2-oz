local A B
   fun lazy {Reverse1 S}
      fun {Rev S R}
	 case S of nil then R
	 [] X|S2 then {Rev S2 X|R} end
      end
   in
      {Rev S nil}
   end
   fun lazy {Reverse2 S}
      fun lazy {Rev S R}
	 case S of nil then R
	 [] X|S2 then {Rev S2 X|R} end
      end
   in {Rev S nil} end
in
   A = {Reverse1 [a b c]}
   B = {Reverse2 [a b c]}
   {Browse 'init'}
   {Browse A}
   {Browse B}
   {Browse B.1}
   % A priori, pensaría que la segunda obtiene los valores de la
   % lista revertida cuando se necesitan, no obstante, a menos que Browse
   % los esté interpretando mal, parecen ser lo mismo, porque para llegar
   % a cualquier elemento de la lista, es necesario revertirla entera

   % Dan el mismo resultado
end
