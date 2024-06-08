----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.05.2024 14:43:03
-- Design Name: 
-- Module Name: Array_multiplier_tb - Behavioral
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

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_Array_multiplier is
end tb_Array_multiplier;

architecture behavior of tb_Array_multiplier is

    -- Component Declaration for the Unit Under Test (UUT)
    component Array_multiplier
        Generic (n : integer := 32);
        Port ( a : in STD_LOGIC_VECTOR (n-1 downto 0);
               b : in STD_LOGIC_VECTOR (n-1 downto 0);
               result : out STD_LOGIC_VECTOR ((2*n)-1 downto 0));
    end component;

    -- Testbench signals
    signal a : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
    signal b : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
    signal result : STD_LOGIC_VECTOR(63 downto 0);

    -- Clock period definition
    constant clk_period : time := 10 ns;

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: Array_multiplier
        Generic map ( n => 32 )
        Port map (
            a => a,
            b => b,
            result => result
        );

    -- Stimulus process
    stim_proc: process
    begin	
        -- Test Case 1
        a <= std_logic_vector(to_unsigned(3, 32));
        b <= std_logic_vector(to_unsigned(2, 32));
        wait for clk_period;
     --   assert result = std_logic_vector(to_unsigned(3 * 2, 64))
     --       report "Test Case 1 Failed" severity error;

        -- Test Case 2
        a <= std_logic_vector(to_unsigned(15, 32));
        b <= std_logic_vector(to_unsigned(15, 32));
        wait for clk_period;
     --   assert result = std_logic_vector(to_unsigned(15 * 15, 64))
      --      report "Test Case 2 Failed" severity error;

        -- Test Case 3
        a <= std_logic_vector(to_unsigned(0, 32));
        b <= std_logic_vector(to_unsigned(12345, 32));
        wait for clk_period;
     --   assert result = std_logic_vector(to_unsigned(0 * 12345, 64))
     --       report "Test Case 3 Failed" severity error;

        -- Test Case 4
        a <= std_logic_vector(to_unsigned(12345, 32));
        b <= std_logic_vector(to_unsigned(6789, 32));
        wait for clk_period;
        
        -- Test Case 5
        a <= std_logic_vector(to_unsigned(3, 32));
        b <= std_logic_vector(to_signed(-10, 32));
        wait for clk_period;
        
        -- Test Case 6
        a <= std_logic_vector(to_unsigned(12345, 32));
        b <= std_logic_vector(to_signed(-6789, 32));
        wait for clk_period;
    --    assert result = std_logic_vector(to_unsigned(12345 * 6789, 64))
     --       report "Test Case 4 Failed" severity error;

        -- Test Case 5: Edge case with maximum values
        a <= (others => '0');  -- maximum value for 32-bit vector
        b <= (others => '0');  -- maximum value for 32-bit vector
        wait for clk_period;
      --  assert result = std_logic_vector(to_unsigned(to_integer(unsigned((others => '1'))) * to_integer(unsigned((others => '1'))), 64))
       --     report "Test Case 5 Failed" severity error;

        wait;
    end process;

end behavior;

