module Solver where

  import CLaSH.Prelude
  import CLaSH.Signal.Explicit (systemClock)
  
  {-# ANN topEntity
    (defTop
      { t_name     =  "compute_main"

      , t_inputs   =  [ "keys_input"
                      , "switches_input"
                      , "control_write"
                      , "control_writedata"
                      , "control_address"
                      , "control_read"
                      , "in_write"
                      , "in_writedata"
                      , "in_address"
                      , "out_address"
                      ]

      , t_outputs  =  [ "leds_status"
                      , "control_readdata"
                      , "out_readdata"
                      ]
      , t_extraIn  =  []
      , t_extraOut =  []
      , t_clocks =    []
      }
    ) 
    #-}
  
  type NumRepr = BitVector 32
  type IntNumRepr = BitVector 32
  type ValueVector = Vec 5 NumRepr

  data InputSignals = InputSignals { keys_input :: BitVector 4   -- keys_input
                      , switches_input    :: BitVector 4   -- switches_input 
                      , control_write     :: Bit           -- control_write
                      , control_writedata :: BitVector 32  -- control_writedata
                      , control_address   :: BitVector 8   -- control_address
                      , control_read      :: Bit           -- control_read
                      , in_write          :: Bit           -- in_write
                      , in_writedata      :: BitVector 32  -- in_writedata
                      , in_address        :: BitVector 8   -- in_address
                      , out_address       :: BitVector 8   -- out_address
                      } deriving(Show)

  data OutputSignals = OutputSignals  { leds_status :: BitVector 4   -- leds_status
                       , control_readdata :: BitVector 32   -- control_readdata
                       , out_readdata     :: BitVector 32   -- out_readdata
                       } deriving(Show)

  --
  --  VARIABLES
  --
  data ODEState = ODEState { xs :: ValueVector 
                            , t :: NumRepr
                            } deriving(Show)

  data SystemState = SystemState { odestate :: ODEState
                      , count :: BitVector 32
                      , substep :: BitVector 32
                      } deriving(Show)
  
  initialODEState = ODEState { xs = repeat 0 :: ValueVector, t = 0}
  initialSystemState = SystemState {odestate = initialODEState, count = 0, substep = 1000000000} --should be UINT_MAX, now 1e9

  --
  --  CONSTANTS
  --
  data SystemConstants = SystemConstants { maxtime :: NumRepr
                        , timestep :: NumRepr
                        , outputstep :: IntNumRepr
                      } deriving (Show)
  initialSystemConstants = SystemConstants { maxtime = 1000, timestep = 1, outputstep = 1} 
  
  initialState = (initialSystemState, initialSystemConstants,0)


  -- 
  --  EQUATIONS
  --
  type Equation = ODEState -> ValueVector
  type Scheme = SystemConstants -> Equation -> ODEState -> ODEState 

  decoupledDecrease :: Equation
  decoupledDecrease state = map (*0.01) (xs state)

  topEntity :: Signal InputSignals -> Signal OutputSignals
  topEntity = mealy forwardLEDS initialState

  forwardLEDS (systemState,systemConstants,oul) input = ((systemState',systemConstants',oul'),output)
    where
      --Unpack the input
      i_c = control_writedata input
      i_cs = control_write input
      i_input = in_writedata input
      i_keys = keys_input input

      --Unpack the state
      s_odestate = odestate systemState
      s_substep = substep systemState
      s_count = count systemState

      s_valueVector = xs s_odestate 
      s_timevalue = t s_odestate

      --Unpack the constants
      c_maxtime = maxtime systemConstants
      c_timestep = timestep systemConstants
      c_substep = outputstep systemConstants

      -- Control signal
      -- 0  : default value, do nothing
      -- 1  : push element into value vector
      -- 2  : set max time
      -- 3  : set timestep
      -- 4  : set output time step
      -- 5  :
      -- 64 : start block computation
      
      (systemState',oul')   | i_cs == 1 && i_c == 1   = ( systemState{ odestate = s_odestate {xs = (i_c :> Nil) ++ init s_valueVector}, count = s_count' }, s_count' ) -- insert an element
                            | i_cs == 1 && i_c == 64  = ( systemState{ substep = 0} , 0) -- trigger the computation
                            | s_substep < c_substep   = ( systemState{ })
                            | otherwise               = (systemState, oul)
                            where
                              s_count' = s_count + 1



      systemConstants'  | i_cs == 1 && i_c == 2   = systemConstants{ maxtime = i_input }
                        | i_cs == 1 && i_c == 3   = systemConstants{ timestep = i_input }
                        | i_cs == 1 && i_c == 4   = systemConstants{ outputstep = i_input }
                        | otherwise               = systemConstants

      --Set the output
      output = OutputSignals {leds_status = complement i_keys, control_readdata = 0, out_readdata = oul'}



