----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.05.2024 11:20:53
-- Design Name: 
-- Module Name: Brent_Kung_cell - Behavioral
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

entity Brent_Kung_cell is
    Port ( g_i : in STD_LOGIC;
           p_i : in STD_LOGIC;
           g_i_1 : in STD_LOGIC;
           p_i_1 : in STD_LOGIC;
           bg : out STD_LOGIC;
           bp : out STD_LOGIC);
end Brent_Kung_cell;

architecture Behavioral of Brent_Kung_cell is
signal aux_p1_g0 : std_logic;
signal aux_p1_p0 : std_logic;
signal aux_g1_p1_g0 : std_logic;
begin
aux_p1_g0 <= p_i_1 and g_i; -- P1 and G0
aux_p1_p0 <= p_i_1 and p_i; -- P1 and P0
aux_g1_p1_g0 <= aux_p1_g0 or g_i_1; -- (P1 and G0) or G1

bg <= aux_g1_p1_g0; -- Presento in uscita il block generate
bp <= aux_p1_p0;    -- Presento in uscita il block propagate

end Behavioral;
