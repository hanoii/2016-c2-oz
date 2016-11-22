local P Dict D D2 D3 Dout in
   local
      fun {NewDicc} {NewCell nil} end
      proc {Put Ds Key Value}
	 fun {PutList Ds Key Value}
	    case Ds
	    of nil then [Key#Value]
	    [] (K#V)|Dr andthen Key==K then
	       (Key#Value) | Dr
	    [] (K#V)|Dr andthen K>Key then
	       (Key#Value)|(K#V)|Dr
	    [] (K#V)|Dr andthen K<Key then
	       (K#V)|{PutList Dr Key Value}
	    end
	 end
      in
	 Ds:={PutList @Ds Key Value}
      end

      fun {Get Ds Key Default}
	 fun {GetList Ds Key Default}
	    case Ds
	    of nil then Default
	    [] (K#V)|Dr andthen Key==K then
	       V
	    [] (K#V)|Dr andthen K>Key then
	       Default
	    [] (K#V)|Dr andthen K<Key then
	       {GetList Dr Key Default}
	    end
	 end
      in
	 {GetList @Ds Key Default}
      end

      fun {Domain Ds}
	 local L FreqSort in
	    fun {FreqSort X Y}
	       if X.2 == Y.2 then
		  X.1 < Y.1
	       else
		  X.2 > Y.2
	       end
	    end
	    L = {Map @Ds fun {$ K#V} K#V end}
	    {Sort L FreqSort}
	 end
      end
   in
      Dict=dict(new:NewDicc put:Put get:Get domain:Domain)
   end

   P = proc{$ L Din}
	  case L of H|T then
	     {Dict.put Din H {Dict.get Din H 0}+1}
	     {P T Din}
	  else
	      skip
	  end
       end


   D = {Dict.new}
   {P [g g a b b a d e d a d f a a a] D}
   {Browse {Dict.domain D}} % [a#6 d#3 b#2 g#2 e#1 f#1]
end
