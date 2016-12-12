local Length X in
   Length=proc {$ Xs Res I}
		case Xs of X|Xr then
		   local L in
		      L = 1+I
		      {Length Xr Res L}
		   end
		else
		   Res = I
		end
	     end

   {Length [1 2 3 4] X 0}
   {Browse X}
end


