local W X Y Z L WaitSome in
   L = [W X Y Z]
   {Browse L}

   proc {WaitSome L}
      local WaitList C in
	 proc {WaitList L}
	    case L of nil then skip
	    [] H|T then
	       thread
		  {Wait H}
		  C=true
	       end
	       {WaitList T}
	    end
	 end
	 {WaitList L}
	 {Wait C}
	 {Browse 'C'#C}
      end
   end

   thread
      {WaitSome L}
      {Browse 'After WaitSome'}
   end
   thread
      {Delay 1000}
      X=1
   end
end
