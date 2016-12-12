local Agente
   fun {NewPortObject Proc}
      local S in
	 thread
	    for Msg in S do
	       {Proc Msg}
	    end
	 end
	 {NewPort S}
      end
   end
in


   Agente={NewPortObject proc{$ Msg} {Browse Msg} end}

   {Send Agente 'Hola'}
   {Send Agente 'Mundo!'}
end
