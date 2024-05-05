----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.05.2024 14:56:00
-- Design Name: 
-- Module Name: Brent_Kung_adder - Behavioral
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

entity Brent_Kung_adder is
    generic(n: integer := 24);
    Port ( A : in STD_LOGIC_VECTOR (n-1 downto 0);
           B : in STD_LOGIC_VECTOR (n-1 downto 0);
           overflow : in STD_LOGIC;
           sum : out STD_LOGIC_VECTOR (n-1 downto 0));
end Brent_Kung_adder;

architecture Behavioral of Brent_Kung_adder is
component Brent_Kung_cell is
    Port ( g_i : in STD_LOGIC;
           p_i : in STD_LOGIC;
           g_i_1 : in STD_LOGIC;
           p_i_1 : in STD_LOGIC;
           bg : out STD_LOGIC;
           bp : out STD_LOGIC);
end component ;
component Block_pgs_g is
	 generic( n : integer := 24);
    Port ( A : in  STD_LOGIC_VECTOR (n-1 downto 0);
           B : in  STD_LOGIC_VECTOR (n-1 downto 0);
           C : in  STD_LOGIC_VECTOR (n-1 downto 0);
           P : out  STD_LOGIC_VECTOR (n-1 downto 0);
           G : out  STD_LOGIC_VECTOR (n-1 downto 0);
           S : out  STD_LOGIC_VECTOR (n-1 downto 0));
end component;

signal G_aux, P_aux, C_aux, S_aux : std_logic_vector(n-1 downto 0);

begin
C_aux<=(others =>'0');
    -- Istanzio il blocco per la creazione dei segnali generate e propagate
    Block_pgs_g_inst: Block_pgs_g
        generic map (n => n)
        port map (
            A => A,
            B => B,
            C => C_aux,
            P => P_aux,
            G => G_aux,
            S => S_aux
        );
        
        
        
end Behavioral;
