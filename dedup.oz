declare
fun {DeDup L}
   fun {DeDupPrevious L P}
      case L of nil then nil
      [] H|T then
	 if H==P then
	    {DeDupPrevious T H}
	 else
	    H|{DeDupPrevious T H}
	 end
      end
   end
in
   {DeDupPrevious L nil}
end	 

L = [1 1 2 2 3 3 1 1 6 6 6 6 6]
{Browse L}
L2 = {DeDup L}
{Browse L2}