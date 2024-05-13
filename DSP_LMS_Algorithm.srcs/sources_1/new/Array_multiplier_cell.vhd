----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.05.2024 17:51:00
-- Design Name: 
-- Module Name: Array_multiplier_cell - Behavioral
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

entity Array_multiplier_cell is
    Port ( a_1 : in STD_LOGIC;
           b_1 : in STD_LOGIC;
           cin : in STD_LOGIC;
           cout : out STD_LOGIC;
           sum : out STD_LOGIC);
end Array_multiplier_cell;

architecture Behavioral of Array_multiplier_cell is
component Full_adder is
	port (i2, i1, i0 : in std_logic;
	s,c : out std_logic);
end component;

signal aux_a,aux_b,aux_cin,aux_and_logic,aux_sum,aux_cout: std_logic;

begin
aux_a<= a_1;
aux_b<= b_1;
aux_cin <= cin;
aux_and_logic<= a_1 and b_1;
Adder: Full_adder port map(i2=>aux_and_logic,i1=>aux_b,i0=>aux_cin, c=>aux_cout, s=>aux_sum);

cout<=aux_cout;
sum <= aux_sum;
end Behavioral;
