module Solver where

  import CLaSH.Prelude

  --  ENTITY compute_main IS
  --  PORT(
  --    clock           : in std_logic;
  --    reset           : in std_logic;

  --  control_writedata   : in    std_logic_vector(31 downto 0);                    -- writedata
  --  control_readdata    : out   std_logic_vector(31 downto 0);
  --  control_address     : in    std_logic_vector(7 downto 0);                     -- address
  --  control_read        : in    std_logic;                                        -- read
  --  control_write       : in    std_logic;                                        -- write

  --  in_write            : in    std_logic;                                        -- write
  --  in_writedata        : in    std_logic_vector(31 downto 0);                    -- writedata
  --  in_address          : in    std_logic_vector(7 downto 0);                     -- address

  --  out_readdata        : out    std_logic_vector(31 downto 0);
  --  out_address         : in    std_logic_vector(7 downto 0);                     -- address

  --  keys_input        : in  std_logic_vector(3 downto 0);
  --  switches_input    : in  std_logic_vector(3 downto 0);
  --  leds_status       : out std_logic_vector(3 downto 0);

  --  gp_input          : out std_logic_vector(31 downto 0);              -- gp_in (as seen from the HPS)
  --  gp_output         : in  std_logic_vector(31 downto 0)                      -- gp_out (as seen from the HPS)
  --  );
  --END compute_main;

  {-# ANN topEntity
    (defTop
      { t_name     = "compute_main"
      , t_inputs   = ["keys_input","switches_input"]
      , t_outputs  = ["leds_status"]
      , t_extraIn  = []
      , t_extraOut = []
      , t_clocks   = [     (defClkAltera "altpll50"
                                   "CLOCK_50(0)"
                                   "not KEY0(0)")
                      ]
      }) #-}




  --topEntity :: Signal (Signed 9, Signed 9) -> Signal (Signed 9)
  --topEntity = mealy macT 0

  --macT acc (x,y) = (acc',o)
  --  where
  --    acc' = ma acc (x,y)
  --    o    = acc

  --ma acc (x,y) = acc + x * y
  type InputSignals = (   BitVector 4 --keys_input
                        , BitVector 4 --switches_input
                        )

  type OutputSignals = (  BitVector 4 --leds_status
                          )

  topEntity :: Signal InputSignals -> Signal OutputSignals
  topEntity = mealy forward 0

  forward state (keys,switches) = (state',o)
    where
      state' = keys
      o = state
