local
   fun {Length L}
     case L of nil then 0
       [] H|T then 1+{Length T}
     end
   end

   fun {Take Xs N}
      if N>0 then
         case Xs of nil then nil
         [] H|T then H|{Take T N-1} end
      else N=0 nil end
   end

   fun {Drop Xs N}
      if N>0 then
         case Xs of nil then nil
         [] H|T then {Drop T N-1} end
      else N=0 Xs end
   end

   fun {Append Xs Ys}
      case Xs of nil then Ys
      [] H|T then H|{Append T Ys} end
   end


   fun {Member X Ys}
      case Ys of nil then false
      [] Y|Yr then X==Y orelse {Member X Yr}
      end
   end

   local
      fun {IterPosition I Xs Y}
         case Xs of nil then nil
	 [] X|Xr then
	    if X==Y then I+1 else {IterPosition I+1 Xr Y} end
         end
      end
   in
      fun {Position Xs Y}
	 {IterPosition 0 Xs Y}
      end
   end

in
      {Browse {Length [1 2 3 4 1 1]}}
      {Browse {Take [1 2 3 4 1 1] 4}}
      {Browse {Drop [1 2 3 4 1 1] 4}}
      {Browse {Drop [1 2 3 4 1 1] 5}}
      {Browse {Append [1 2 3] [4 5 6]}}
      {Browse {Member 2 [1 2 3]}}
      {Browse {Position [1 2 3] 2}}
end
