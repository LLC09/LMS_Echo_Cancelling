----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.10.2024 07:32:09
-- Design Name: 
-- Module Name: Full_adder - Behavioral
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

entity Full_adder is
	port (i2, i1, i0 : in std_logic;
	s,c : out std_logic);
end entity;

architecture Behavioral of Full_adder is

component half_adder is
    port (a,b: in std_logic;
    s,c: out std_logic);
end component;

signal hadder1_s, hadder1_c: std_logic;
signal hadder2_c, aux_s:std_logic;

begin
h1: half_adder port map (a=>i2,b=>i1,s=>hadder1_s,c=>hadder1_c);
h2: half_adder port map (a=>i0,b=>hadder1_s, s=> aux_s,c=>hadder2_c);

s <= aux_s;
c <= hadder2_c or hadder1_c;
end Behavioral;
