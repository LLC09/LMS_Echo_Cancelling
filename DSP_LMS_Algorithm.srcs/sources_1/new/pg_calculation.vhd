----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.05.2024 11:53:18
-- Design Name: 
-- Module Name: pg_calculation - Behavioral
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

entity pg_calculation is
  port (
    g_in, p_in, g_in_1, p_in_1 : in std_logic;
    g_out, p_out : out std_logic
    );
end entity pg_calculation;

architecture behavioral of pg_calculation is
    begin
        g_out <= g_in or (g_in_1 and p_in) ;
        p_out <= p_in and p_in_1 ;
end architecture behavioral;
