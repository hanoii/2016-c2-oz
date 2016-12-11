declare
fun {Correct S}
   case S
   of nil then nil
   [] & |& |S1 then {Correct S1}
   [] C|S1 then C|{Correct S1}
   end
end

S = {Correct "This   is     a test"}
{Browse S}