! scheme = euler
! equation = matrix4d

(systemState',oul',block')  
  --Handle the setup (reset the state, insert input values, start the computation)
  | i_c == 2 && i_cs == 1 && i_ca == 0  = ( initialSystemState, 0, 0)
  | i_is == 1                             = ( systemState{ odestate = s_odestate_in' }, 0, 1)
  | i_c == 1 && i_cs == 1 && i_ca == 0  = ( systemState{ step = 0 } , 0, 0)

  --Handle the computation and output: 
! | block == 1 && i_os == 1              = ( systemState, pack (xs !! i_oa), block)
! | block == 0 && s_step < c_maxstep     = ( systemState_up' , 0, block)
! | block == 0 && s_step >= c_maxstep   = ( systemState{ step = uIntMax}, pack uIntMax, 1)

  --Default, do nothing
  | otherwise                           = ( systemState, oul, block)
  where
    s_odestate_in'  = s_odestate {valueVector = replace i_ia (unpack i_i :: Data) xs}
    
!   s_odestate_up   = scheme systemConstants equation s_odestate
    valueVector_wt  = replace 4 (time s_odestate_up) (valueVector s_odestate_up)
    s_odestate_up'  = s_odestate_up {valueVector = valueVector_wt }
    s_step'         = s_step + 1

    systemState_up' = systemState{ odestate = s_odestate_up', step = s_step'}