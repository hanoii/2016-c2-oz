local Length X in
   Length=proc {$ Xs Res}
		case Xs of X|Xr then
		   local L in
		      {Length Xr L}
		      Res = 1+L
		   end
		else
		   Res = 0
		end
	     end

   {Length [1 2 3 4] X}
   {Browse X}
end


