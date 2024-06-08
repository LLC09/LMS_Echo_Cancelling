----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.06.2024 15:31:45
-- Design Name: 
-- Module Name: complement_module - Behavioral
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

entity complement_module is
    Port ( input_signal : in STD_LOGIC_VECTOR (31 downto 0);
           complemented_signal : out STD_LOGIC_VECTOR (31 downto 0));
end complement_module;

architecture Behavioral of complement_module is
    signal internal_signal : STD_LOGIC_VECTOR(31 downto 0);

begin
    process(input_signal)
    begin
        internal_signal <= not input_signal;
    end process;
    complemented_signal <= internal_signal;
end Behavioral;
