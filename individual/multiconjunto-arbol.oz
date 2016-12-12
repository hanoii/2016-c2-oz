local C D
   fun {ArbolIgual T1 T2}
      {Show T1}
      {Show T2}
      case T1#T2 of leaf#leaf then true 
      [] tree(K1 V1 T1L T1R)#leaf then false
      [] leaf#tree(K2 V2 T2L T2R) then false
      [] tree(K1 V1 T1L T1R)#tree(K2 V2 T2L T2R) then
	 if {And K1 == K2 V1 == V2} then
	    {And {ArbolIgual T1L T2L} {ArbolIgual T1R T2R}}
	 else
	    false
	 end
	 
      end
   end
   
   fun {Multiconjunto}
      C = {NewCell leaf}
      
      proc {Remove X}	 
	 fun {Delete X T}
	    fun {RemoveSmallest T}
	       {Browse T}
	       case T of leaf then none
	       [] tree(Y V T1 T2) then
		  case {RemoveSmallest T1}
		  of none then Y#V#T2
		  [] Yp#Vp#Tp then
		     Yp#Vp#tree(Y V Tp T2)
		  end
	       end
	    end
	 in
	    case T
	    of leaf then leaf
	    [] tree(Y W T1 T2) andthen X==Y then
	       case {RemoveSmallest T2}
	       of none then T1
	       [] Yp#Vp#Tp then tree(Yp Vp T1 Tp) end
	    [] tree(Y W T1 T2) andthen X<Y then
	       tree(Y W {Delete X T1} T2)
	    [] tree(Y W T1 T2) andthen X>Y then
	       tree(Y W T1 {Delete X T2})
	    end
	 end
      in
	 C := {Delete X @C}
      end
      
      fun {Get X}
	 fun {Lookup X T}
	    case T
	    of leaf then notfound
	    [] tree(Y V T1 T2) andthen X==Y then
	       V
	    [] tree(Y V T1 T2) andthen X<Y then
	       {Lookup X T1}
	    [] tree(Y V T1 T2) andthen X>Y then
	       {Lookup X T2}
	    end
	 end
      in
	{Lookup X @C}
      end
      
      proc {Put E}
	 V A 
	 fun {Insert X V T}
	    case T
	    of leaf then tree(X V leaf leaf)
	    [] tree(Y W T1 T2) andthen X==Y then
	       tree(X V T1 T2)
	    [] tree(Y W T1 T2) andthen X<Y then
	       tree(Y W {Insert X V T1} T2)
	    [] tree(Y W T1 T2) andthen X>Y then
	       tree(Y W T1 {Insert X V T2})
	    end      
	 end
      in
	 A = {Get E}
	 case A
	 of notfound then
	    V=1
	 else
	    V=A+1
	 end
	 C := {Insert E V @C}
      end

      proc {Domain}
	 proc {DFS T}
	    case T
	    of leaf then skip
	    [] tree(Key Val L R) then
	       {DFS L}
	       {Browse Key#Val}
	       {DFS R}
	    end
	 end
      in
	 {DFS @C}
      end
   in
      c(put:Put get:Get domain:Domain remove:Remove data:C)
   end
in
   C = {Multiconjunto}
   {C.put e}
   {C.put a}
   {C.put b}
   {C.put b}
   {C.put d}
   {C.put c}
   %{Browse @(C.data)}
   %{C.remove b}
   %{Browse @(C.data)}


   D = {Multiconjunto}
   {D.put e}
   {D.put a}
   {D.put b}
   {D.put b}
   {D.put d}
   {D.put c}
   {Browse {ArbolIgual leaf leaf}}
   {Browse 'false'}
   {Browse {ArbolIgual tree(a 1 leaf leaf) tree(b 1 leaf leaf)}}
   {Browse {ArbolIgual @(C.data) @(D.data)}}
   
end
