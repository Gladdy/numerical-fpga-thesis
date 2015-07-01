LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY andgate IS
PORT ( 
  input_0   : in std_logic;
  input_1   : in std_logic;
  output_0  : out std_logic
  );
END ENTITY andgate;

ARCHITECTURE a OF andgate IS
BEGIN
  output_0 <= input_0 and input_1;
END ARCHITECTURE a;