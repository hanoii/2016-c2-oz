local A K P Q U in
   % Q, U es externa
   proc {Q L M}
      M = 11
   end

   proc {P X Y}
      local Z in
	 {Q Z U}
      end
   end

   {P 1 K}
   {Browse U}
end

local K P Q Z in
   % Q es externa
   Z = 55
   proc {Q L M}
      M = L
   end

   proc {P X Y}
      local Z in
	 Z = 5
	 {Q Z Y}
      end
   end

   {P 1 K}
   {Browse K}


end

local P Q U in
   % ninguna es externa
   proc {P X Y}
      local Z in
	 {P Z Y}
      end
   end
end
