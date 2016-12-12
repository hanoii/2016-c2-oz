local Agente Agente2
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

   fun {MsgValid Msg}
      Msg == 'OK'
   end
in

   Agente={NewPortObject proc{$ Msg}
			    if {MsgValid Msg} then
			       {Send Agente2 'Todo bien con lo que viene...'}
			       {Send Agente2 Msg}
			    end
			 end}
   Agente2={NewPortObject proc{$ Msg} {Browse Msg} end}

   {Send Agente 'Hola'}
   {Send Agente 'Mundo!'}
   {Send Agente 'OK'}
end
