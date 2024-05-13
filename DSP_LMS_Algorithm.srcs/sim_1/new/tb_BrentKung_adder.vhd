----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.05.2024 11:56:14
-- Design Name: 
-- Module Name: tb_BrentKung_adder - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

library work;
use work.all;

-- Test Bench Entity
entity adder_32b_tb is
end entity adder_32b_tb;

architecture test of adder_32b_tb is

    -- Component under test
    component BrentKung_adder is
        port (
            a, b : in STD_LOGIC_VECTOR(31 downto 0);
            c_in : in std_logic;
            s : out STD_LOGIC_VECTOR(31 downto 0);
            c_out : out std_logic);
      end component BrentKung_adder;
    
      --  Specifies which entity is bound with the component.
      for adder_32b_0: BrentKung_adder use entity work.BrentKung_adder(Behavioral);
      signal a, b, s : std_logic_vector(31 downto 0);
      signal c_in, c_out : std_logic;
    begin
      --  Component instantiation.
      adder_32b_0: BrentKung_adder
      port map (a => a, b => b, c_in => c_in, s => s, c_out => c_out);
    
      --  This process does the real job.
      process
        type pattern_type is record
          --  The inputs of the adder.
          a, b : std_logic_vector(31 downto 0);
          c_in : std_logic;
        end record;
        --  The patterns to apply.
        type pattern_array is array (natural range <>) of pattern_type;
        constant patterns : pattern_array :=
          (("01010101010101010101010101010101", "00011010101010101010101010101010", '1'),
           ("00000000000000000000000000000000", "00000000000000000000000000001001", '1'),
           ("00000000000000000000000000000001", "00000000000000000000000000001111", '0'),
           ("00110000111100001111000011110000", "00111100001111000011110000111100", '0'),
           ("00000000000000000000000000000111", "11111111111111111111111111111001", '0'));
      begin
        --  Check each pattern.
        for i in patterns'range loop
          --  Set the inputs.
          a <= patterns(i).a;
          b <= patterns(i).b;
          c_in <= patterns(i).c_in;
          --  Wait for the results.
          wait for 4 ns;
        end loop;
        wait;
      end process;
end architecture test;
