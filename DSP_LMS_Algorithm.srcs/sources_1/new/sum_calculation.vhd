----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.05.2024 11:50:22
-- Design Name: 
-- Module Name: sum_calculation - Behavioral
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

  entity sum_calculation is
      port (
        a_in, b_in, c_in : in STD_LOGIC_VECTOR(31 downto 0);
        s_out : out STD_LOGIC_VECTOR(31 downto 0)
        );
    end entity sum_calculation;
    
    architecture behavioral of sum_calculation is
        begin
            s_out <= a_in xor b_in xor c_in;          
    end architecture behavioral;
