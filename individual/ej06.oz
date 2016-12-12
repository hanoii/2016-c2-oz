local FoldR FoldL Map Filter Sum Prod in
   fun {FoldR L F U}
      case L of nil then U
      [] H|T then {F H {FoldR T F U}}
      end
   end

   fun {FoldL L F U}
      case L of nil then U
      [] H|T then {FoldL T F {F U H}}
      end
   end

   fun {Map L F}
      case L of nil then nil
      [] H|T then {F H}|{Map T F}
      end
   end

   fun {Filter L F}
      case L of nil then nil
      [] H|T then if {F H} then H|{Filter T F} else {Filter T F} end
      end
   end

   fun {Sum X Y}
      X+Y
   end

   fun {Prod X Y}
      X*Y
   end

   {Browse {FoldR [1 2 3 4 5] Sum 0}} % 15
   {Browse {FoldL [1 2 3 4 5] Prod 1}} % 120
   {Browse {Map [1 2 3] fun {$ I} I*I end}} % [1 4 9]
   {Browse {Filter [1 2 3 4] fun {$ A} A<3 end}} % [1 2]
end
