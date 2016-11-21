local P Dict D D2 D3 Dout in
   local
      fun {NewDicc} nil end
      fun {Put Ds Key Value}
	 case Ds
	 of nil then [Key#Value]
	 [] (K#V)|Dr andthen Key==K then
	    (Key#Value) | Dr
	 [] (K#V)|Dr andthen K>Key then
	    (Key#Value)|(K#V)|Dr
	 [] (K#V)|Dr andthen K<Key then
	    (K#V)|{Put Dr Key Value}
	 end
      end
      fun {Get Ds Key Default}
	 case Ds
	 of nil then Default
	 [] (K#V)|Dr andthen Key==K then
	    V
	 [] (K#V)|Dr andthen K>Key then
	    Default
	 [] (K#V)|Dr andthen K<Key then	  
	    {Get Dr Key Default}
	 end
      end
      fun {Domain Ds}
	 {Map Ds fun {$ K#_} K end}
      end
   in
      Dict=dict(new:NewDicc put:Put get:Get domain:Domain)
   end

   P = proc{$ L Din Dout}
	  {Browse L}
	  case L of H|T then
	     local A in
		A = {Dict.put Din H {Dict.get Din H 0}+1}
		{Browse A}
		{P T A Dout} 
	     end
	  else
	     {Browse 'else'}
	     Dout = Din
	  end
       end
  

   D = {Dict.new}
   {P [a b b a d e d a d f a] D Dout}
   {Browse {Dict.get Dout a 0}}
   
   
   %D2 = {Dict.put D 'Hola' 'Mundo'}
   %D3 = {Dict.put D2 'AA' 'BB'}
   %{Browse {Dict.domain D3}}
end
