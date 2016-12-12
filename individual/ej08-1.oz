local Ints L A B C in
   Ints = proc {$ N L}
	     local P in
		P = proc {$ Res}
		       local A in
			  Res = N|A
			  {Ints N+1 A}
		       end
		    end
		{ByNeed P L}
	     end
	  end

   {Ints 1 L}
   {Browse L}
   A = L.2.2.1
   B = L.1
   C = A+B
   {Browse C}
end
