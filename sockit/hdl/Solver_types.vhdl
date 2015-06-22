library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

package Solver_types is
  type array_of_signed_32 is array (integer range <>) of signed(31 downto 0);
  type product10 is record
    product10_sel0 : array_of_signed_32(0 to 8);
    product10_sel1 : signed(31 downto 0);
  end record;
  type product7 is record
    product7_sel0 : array_of_signed_32(0 to 8);
    product7_sel1 : signed(31 downto 0);
  end record;
  type product8 is record
    product8_sel0 : product7;
    product8_sel1 : array_of_signed_32(0 to 8);
  end record;
  type product4 is record
    product4_sel0 : product7;
    product4_sel1 : unsigned(31 downto 0);
  end record;
  type product11 is record
    product11_sel0 : std_logic_vector(0 downto 0);
    product11_sel1 : std_logic_vector(31 downto 0);
  end record;
  type product5 is record
    product5_sel0 : signed(31 downto 0);
    product5_sel1 : signed(31 downto 0);
    product5_sel2 : unsigned(31 downto 0);
    product5_sel3 : array_of_signed_32(0 to 8);
  end record;
  type product2 is record
    product2_sel0 : product4;
    product2_sel1 : product5;
    product2_sel2 : std_logic_vector(31 downto 0);
    product2_sel3 : std_logic_vector(0 downto 0);
  end record;
  type product6 is record
    product6_sel0 : product4;
    product6_sel1 : std_logic_vector(31 downto 0);
    product6_sel2 : std_logic_vector(0 downto 0);
  end record;
  type product9 is record
    product9_sel0 : array_of_signed_32(0 to 8);
    product9_sel1 : array_of_signed_32(0 to 1);
  end record;
  type product0 is record
    product0_sel0 : std_logic_vector(3 downto 0);
    product0_sel1 : std_logic_vector(3 downto 0);
    product0_sel2 : std_logic_vector(0 downto 0);
    product0_sel3 : std_logic_vector(31 downto 0);
    product0_sel4 : std_logic_vector(7 downto 0);
    product0_sel5 : std_logic_vector(0 downto 0);
    product0_sel6 : std_logic_vector(0 downto 0);
    product0_sel7 : std_logic_vector(31 downto 0);
    product0_sel8 : std_logic_vector(7 downto 0);
    product0_sel9 : std_logic_vector(7 downto 0);
    product0_sel10 : std_logic_vector(0 downto 0);
  end record;
  type product1 is record
    product1_sel0 : std_logic_vector(3 downto 0);
    product1_sel1 : std_logic_vector(31 downto 0);
    product1_sel2 : std_logic_vector(31 downto 0);
  end record;
  type product3 is record
    product3_sel0 : product2;
    product3_sel1 : product1;
  end record;
  function max (left, right: in integer) return integer;
  function toSLV (s : in signed) return std_logic_vector;
  function toSLV (value :  array_of_signed_32) return std_logic_vector;
  function toSLV (p : product10) return std_logic_vector;
  function toSLV (p : product7) return std_logic_vector;
  function toSLV (p : product8) return std_logic_vector;
  function toSLV (slv : in std_logic_vector) return std_logic_vector;
  function toSLV (u : in unsigned) return std_logic_vector;
  function toSLV (p : product4) return std_logic_vector;
  function toSLV (p : product11) return std_logic_vector;
  function toSLV (p : product5) return std_logic_vector;
  function toSLV (p : product2) return std_logic_vector;
  function toSLV (p : product6) return std_logic_vector;
  function toSLV (p : product9) return std_logic_vector;
  function toSLV (p : product0) return std_logic_vector;
  function toSLV (p : product1) return std_logic_vector;
  function toSLV (p : product3) return std_logic_vector;
  function to_integer (i : in integer) return integer;
  function toSLV (i : in integer) return std_logic_vector;
  function toSLV (b : in boolean) return std_logic_vector;
  function fromSLV (sl : in std_logic_vector) return boolean;
end;

package body Solver_types is
  function max (left, right: in integer) return integer is
  begin
    if left > right then return left;
    else return right;
    end if;
  end;
  function toSLV (s : in signed) return std_logic_vector is
  begin
    return std_logic_vector(s);
  end;
  function toSLV (value :  array_of_signed_32) return std_logic_vector is
    alias ivalue    : array_of_signed_32(1 to value'length) is value;
    variable result : std_logic_vector(1 to value'length * 32);
  begin
    for i in ivalue'range loop
      result(((i - 1) * 32) + 1 to i*32) := toSLV(ivalue(i));
    end loop;
    return result;
  end;
  function toSLV (p : product10) return std_logic_vector is
  begin
    return (toSLV(p.product10_sel0) & toSLV(p.product10_sel1));
  end;
  function toSLV (p : product7) return std_logic_vector is
  begin
    return (toSLV(p.product7_sel0) & toSLV(p.product7_sel1));
  end;
  function toSLV (p : product8) return std_logic_vector is
  begin
    return (toSLV(p.product8_sel0) & toSLV(p.product8_sel1));
  end;
  function toSLV (slv : in std_logic_vector) return std_logic_vector is
  begin
    return slv;
  end;
  function toSLV (u : in unsigned) return std_logic_vector is
  begin
    return std_logic_vector(u);
  end;
  function toSLV (p : product4) return std_logic_vector is
  begin
    return (toSLV(p.product4_sel0) & toSLV(p.product4_sel1));
  end;
  function toSLV (p : product11) return std_logic_vector is
  begin
    return (toSLV(p.product11_sel0) & toSLV(p.product11_sel1));
  end;
  function toSLV (p : product5) return std_logic_vector is
  begin
    return (toSLV(p.product5_sel0) & toSLV(p.product5_sel1) & toSLV(p.product5_sel2) & toSLV(p.product5_sel3));
  end;
  function toSLV (p : product2) return std_logic_vector is
  begin
    return (toSLV(p.product2_sel0) & toSLV(p.product2_sel1) & toSLV(p.product2_sel2) & toSLV(p.product2_sel3));
  end;
  function toSLV (p : product6) return std_logic_vector is
  begin
    return (toSLV(p.product6_sel0) & toSLV(p.product6_sel1) & toSLV(p.product6_sel2));
  end;
  function toSLV (p : product9) return std_logic_vector is
  begin
    return (toSLV(p.product9_sel0) & toSLV(p.product9_sel1));
  end;
  function toSLV (p : product0) return std_logic_vector is
  begin
    return (toSLV(p.product0_sel0) & toSLV(p.product0_sel1) & toSLV(p.product0_sel2) & toSLV(p.product0_sel3) & toSLV(p.product0_sel4) & toSLV(p.product0_sel5) & toSLV(p.product0_sel6) & toSLV(p.product0_sel7) & toSLV(p.product0_sel8) & toSLV(p.product0_sel9) & toSLV(p.product0_sel10));
  end;
  function toSLV (p : product1) return std_logic_vector is
  begin
    return (toSLV(p.product1_sel0) & toSLV(p.product1_sel1) & toSLV(p.product1_sel2));
  end;
  function toSLV (p : product3) return std_logic_vector is
  begin
    return (toSLV(p.product3_sel0) & toSLV(p.product3_sel1));
  end;
  function to_integer (i : in integer) return integer is
  begin
    return i;
  end;
  function toSLV (i : in integer) return std_logic_vector is
  begin
    return std_logic_vector(to_signed(i,32));
  end;
  function toSLV (b : in boolean) return std_logic_vector is
  begin
    if b then
      return "1";
    else
      return "0";
    end if;
  end;
  function fromSLV (sl : in std_logic_vector) return boolean is
  begin
    if sl = "1" then
      return true;
    else
      return false;
    end if;
  end;
end;
