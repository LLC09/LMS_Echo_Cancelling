----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.05.2024 17:30:00
-- Design Name: 
-- Module Name: Array_multiplier - Behavioral
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

entity Array_multiplier is
generic(n: integer := 4);
port(
    A: std_logic_vector(n-1 downto 0);
    B: std_logic_vector(n-1 downto 0);
    Y: std_logic_vector(2*n-1 downto 0)
);
end Array_multiplier;

architecture Behavioral of Array_multiplier is

signal aux_cin,aux_A,aux_B,carry_out_b0, carry_out_b1, carry_out_b2, carry_out_b3, sum_b0,sum_b1,sum_b2,sum_b3: std_logic_vector(n-1 downto 0);
signal i : integer := 0;

component Array_multiplier_cell is
    Port ( a_1 : in STD_LOGIC;
           b_1 : in STD_LOGIC;
           cin : in STD_LOGIC;
           cout : out STD_LOGIC;
           sum : out STD_LOGIC);
end component;

begin
aux_A <= A;
aux_B <= B;
aux_cin <= (others => '0');

-- Istanzio la riga b0
cell_instance_b0a0: Array_multiplier_cell port map ( a_1 => aux_A(0),
                b_1 => aux_B(0),
                cin => aux_cin(0),
                cout => carry_out_b0(0),
                sum => sum_b0(0)
            );

cell_instance_b0a1: Array_multiplier_cell port map ( a_1 => aux_A(1),
                b_1 => aux_B(1),
                cin => aux_cin(1),
                cout => carry_out_b0(1),
                sum => sum_b0(1)
            );     

cell_instance_b0a2: Array_multiplier_cell port map ( a_1 => aux_A(2),
                b_1 => aux_B(2),
                cin => aux_cin(2),
                cout => carry_out_b0(2),
                sum => sum_b0(2)
            );
cell_instance_b0a3: Array_multiplier_cell port map (
    a_1 => aux_A(3),
    b_1 => aux_B(3),
    cin => aux_cin(3),
    cout => carry_out_b0(3),
    sum => sum_b0(3)
);

cell_instance_b0a4: Array_multiplier_cell port map (
    a_1 => aux_A(4),
    b_1 => aux_B(4),
    cin => aux_cin(4),
    cout => carry_out_b0(4),
    sum => sum_b0(4)
);

cell_instance_b0a5: Array_multiplier_cell port map (
    a_1 => aux_A(5),
    b_1 => aux_B(5),
    cin => aux_cin(5),
    cout => carry_out_b0(5),
    sum => sum_b0(5)
);

cell_instance_b0a6: Array_multiplier_cell port map (
    a_1 => aux_A(6),
    b_1 => aux_B(6),
    cin => aux_cin(6),
    cout => carry_out_b0(6),
    sum => sum_b0(6)
);

cell_instance_b0a7: Array_multiplier_cell port map (
    a_1=> aux_A(7),
    b_1 => aux_B(7),
    cin => aux_cin(7),
    cout => carry_out_b0(7),
    sum => sum_b0(7)
);

cell_instance_b0a8: Array_multiplier_cell port map (
    a_1 => aux_A(8),
    b_1 => aux_B(8),
    cin => aux_cin(8),
    cout => carry_out_b0(8),
    sum => sum_b0(8)
);

cell_instance_b0a9: Array_multiplier_cell port map (
    a_1 => aux_A(9),
    b_1 => aux_B(9),
    cin => aux_cin(9),
    cout => carry_out_b0(9),
    sum => sum_b0(9)
);

cell_instance_b0a10: Array_multiplier_cell port map (
    a_1 => aux_A(10),
    b_1 => aux_B(10),
    cin => aux_cin(10),
    cout => carry_out_b0(10),
    sum => sum_b0(10)
);

cell_instance_b0a11: Array_multiplier_cell port map (
    a_1 => aux_A(11),
    b_1 => aux_B(11),
    cin => aux_cin(11),
    cout => carry_out_b0(11),
    sum => sum_b0(11)
);

cell_instance_b0a12: Array_multiplier_cell port map (
    a_1 => aux_A(12),
    b_1 => aux_B(12),
    cin => aux_cin(12),
    cout => carry_out_b0(12),
    sum => sum_b0(12)
);

cell_instance_b0a13: Array_multiplier_cell port map (
    a_1 => aux_A(13),
    b_1 => aux_B(13),
    cin => aux_cin(13),
    cout => carry_out_b0(13),
    sum => sum_b0(13)
);

cell_instance_b0a14: Array_multiplier_cell port map (
    a_1 => aux_A(14),
    b_1 => aux_B(14),
    cin => aux_cin(14),
    cout => carry_out_b0(14),
    sum => sum_b0(14)
);

cell_instance_b0a15: Array_multiplier_cell port map (
    a_1 => aux_A(15),
    b_1 => aux_B(15),
    cin => aux_cin(15),
    cout => carry_out_b0(15),
    sum => sum_b0(15)
);

cell_instance_b0a16: Array_multiplier_cell port map (
    a_1 => aux_A(16),
    b_1 => aux_B(16),
    cin => aux_cin(16),
    cout => carry_out_b0(16),
    sum => sum_b0(16)
);

cell_instance_b0a17: Array_multiplier_cell port map (
    a_1 => aux_A(17),
    b_1 => aux_B(17),
    cin => aux_cin(17),
    cout => carry_out_b0(17),
    sum => sum_b0(17)
);

cell_instance_b0a18: Array_multiplier_cell port map (
    a_1 => aux_A(18),
    b_1 => aux_B(18),
    cin => aux_cin(18),
    cout => carry_out_b0(18),
    sum => sum_b0(18)
);

cell_instance_b0a19: Array_multiplier_cell port map (
    a_1 => aux_A(19),
    b_1 => aux_B(19),
    cin => aux_cin(19),
    cout => carry_out_b0(19),
    sum => sum_b0(19)
);

cell_instance_b0a20: Array_multiplier_cell port map (
    a_1 => aux_A(20),
    b_1 => aux_B(20),
    cin => aux_cin(20),
    cout => carry_out_b0(20),
    sum => sum_b0(20)
);

cell_instance_b0a21: Array_multiplier_cell port map (
    a_1 => aux_A(21),
    b_1 => aux_B(21),
    cin => aux_cin(21),
    cout => carry_out_b0(21),
    sum => sum_b0(21)
);

cell_instance_b0a22: Array_multiplier_cell port map (
    a_1 => aux_A(22),
    b_1 => aux_B(22),
    cin => aux_cin(22),
    cout => carry_out_b0(22),
    sum => sum_b0(22)
);

cell_instance_b0a23: Array_multiplier_cell port map (
    a_1 => aux_A(23),
    b_1 => aux_B(23),
    cin => aux_cin(23),
    cout => carry_out_b0(23),
    sum => sum_b0(23)
);

cell_instance_b0a24: Array_multiplier_cell port map (
    a_1 => aux_A(24),
    b_1 => aux_B(24),
    cin => aux_cin(24),
    cout => carry_out_b0(24),
    sum => sum_b0(24)
);

cell_instance_b0a25: Array_multiplier_cell port map (
    a_1 => aux_A(25),
    b_1 => aux_B(25),
    cin => aux_cin(25),
    cout => carry_out_b0(25),
    sum => sum_b0(25)
);

cell_instance_b0a26: Array_multiplier_cell port map (
    a_1 => aux_A(26),
    b_1 => aux_B(26),
    cin => aux_cin(26),
    cout => carry_out_b0(26),
    sum => sum_b0(26)
);

cell_instance_b0a27: Array_multiplier_cell port map (
    a_1 => aux_A(27),
    b_1 => aux_B(27),
    cin => aux_cin(27),
    cout => carry_out_b0(27),
    sum => sum_b0(27)
);

cell_instance_b0a28: Array_multiplier_cell port map (
    a_1 => aux_A(28),
    b_1 => aux_B(28),
    cin => aux_cin(28),
    cout => carry_out_b0(28),
    sum => sum_b0(28)
);

cell_instance_b0a29: Array_multiplier_cell port map (
    a_1 => aux_A(29),
    b_1 => aux_B(29),
    cin => aux_cin(29),
    cout => carry_out_b0(29),
    sum => sum_b0(29)
);

cell_instance_b0a30: Array_multiplier_cell port map (
    a_1 => aux_A(30),
    b_1 => aux_B(30),
    cin => aux_cin(30),
    cout => carry_out_b0(30),
    sum => sum_b0(30)
);

cell_instance_b0a31: Array_multiplier_cell port map (
    a_1 => aux_A(31),
    b_1 => aux_B(31),
    cin => aux_cin(31),
    cout => carry_out_b0(31),
    sum => sum_b0(31)
);

--- Istanzio la riga b1

cell_instance_b1a0: Array_multiplier_cell port map (
    a_1 => aux_A(0),
    b_1 => aux_B(0),
    cin => aux_cin(0),
    cout => carry_out_b1(0),
    sum => sum_b1(0)
);

cell_instance_b1a1: Array_multiplier_cell port map (
    a_1 => aux_A(1),
    b_1 => aux_B(1),
    cin => aux_cin(1),
    cout => carry_out_b1(1),
    sum => sum_b1(1)
);

cell_instance_b1a2: Array_multiplier_cell port map (
    a_1 => aux_A(2),
    b_1 => aux_B(2),
    cin => aux_cin(2),
    cout => carry_out_b1(2),
    sum => sum_b1(2)
);

cell_instance_b1a3: Array_multiplier_cell port map (
    a_1 => aux_A(3),
    b_1 => aux_B(3),
    cin => aux_cin(3),
    cout => carry_out_b1(3),
    sum => sum_b1(3)
);

cell_instance_b1a4: Array_multiplier_cell port map (
    a_1 => aux_A(4),
    b_1 => aux_B(4),
    cin => aux_cin(4),
    cout => carry_out_b1(4),
    sum => sum_b1(4)
);

cell_instance_b1a5: Array_multiplier_cell port map (
    a_1 => aux_A(5),
    b_1 => aux_B(5),
    cin => aux_cin(5),
    cout => carry_out_b1(5),
    sum => sum_b1(5)
);

cell_instance_b1a6: Array_multiplier_cell port map (
    a_1 => aux_A(6),
    b_1 => aux_B(6),
    cin => aux_cin(6),
    cout => carry_out_b1(6),
    sum => sum_b1(6)
);

cell_instance_b1a7: Array_multiplier_cell port map (
    a_1 => aux_A(7),
    b_1 => aux_B(7),
    cin => aux_cin(7),
    cout => carry_out_b1(7),
    sum => sum_b1(7)
);

cell_instance_b1a8: Array_multiplier_cell port map (
    a_1 => aux_A(8),
    b_1 => aux_B(8),
    cin => aux_cin(8),
    cout => carry_out_b1(8),
    sum => sum_b1(8)
);

cell_instance_b1a9: Array_multiplier_cell port map (
    a_1 => aux_A(9),
    b_1 => aux_B(9),
    cin => aux_cin(9),
    cout => carry_out_b1(9),
    sum => sum_b1(9)
);

cell_instance_b1a10: Array_multiplier_cell port map (
    a_1 => aux_A(10),
    b_1 => aux_B(10),
    cin => aux_cin(10),
    cout => carry_out_b1(10),
    sum => sum_b1(10)
);

cell_instance_b1a11: Array_multiplier_cell port map (
    a_1 => aux_A(11),
    b_1 => aux_B(11),
    cin => aux_cin(11),
    cout => carry_out_b1(11),
    sum => sum_b1(11)
);

cell_instance_b1a12: Array_multiplier_cell port map (
    a_1 => aux_A(12),
    b_1 => aux_B(12),
    cin => aux_cin(12),
    cout => carry_out_b1(12),
    sum => sum_b1(12)
);

cell_instance_b1a13: Array_multiplier_cell port map (
    a_1 => aux_A(13),
    b_1 => aux_B(13),
    cin => aux_cin(13),
    cout => carry_out_b1(13),
    sum => sum_b1(13)
);

cell_instance_b1a14: Array_multiplier_cell port map (
    a_1 => aux_A(14),
    b_1 => aux_B(14),
    cin => aux_cin(14),
    cout => carry_out_b1(14),
    sum => sum_b1(14)
);

cell_instance_b1a15: Array_multiplier_cell port map (
    a_1 => aux_A(15),
    b_1 => aux_B(15),
    cin => aux_cin(15),
    cout => carry_out_b1(15),
    sum => sum_b1(15)
);

cell_instance_b1a16: Array_multiplier_cell port map (
    a_1 => aux_A(16),
    b_1 => aux_B(16),
    cin => aux_cin(16),
    cout => carry_out_b1(16),
    sum => sum_b1(16)
);

cell_instance_b1a17: Array_multiplier_cell port map (
    a_1 => aux_A(17),
    b_1 => aux_B(17),
    cin => aux_cin(17),
    cout => carry_out_b1(17),
    sum => sum_b1(17)
);

cell_instance_b1a18: Array_multiplier_cell port map (
    a_1 => aux_A(18),
    b_1 => aux_B(18),
    cin => aux_cin(18),
    cout => carry_out_b1(18),
    sum => sum_b1(18)
);

cell_instance_b1a19: Array_multiplier_cell port map (
    a_1 => aux_A(19),
    b_1 => aux_B(19),
    cin => aux_cin(19),
    cout => carry_out_b1(19),
    sum => sum_b1(19)
);

cell_instance_b1a20: Array_multiplier_cell port map (
    a_1 => aux_A(20),
    b_1 => aux_B(20),
    cin => aux_cin(20),
    cout => carry_out_b1(20),
    sum => sum_b1(20)
);

cell_instance_b1a21: Array_multiplier_cell port map (
    a_1 => aux_A(21),
    b_1 => aux_B(21),
    cin => aux_cin(21),
    cout => carry_out_b1(21),
    sum => sum_b1(21)
);

cell_instance_b1a22: Array_multiplier_cell port map (
    a_1 => aux_A(22),
    b_1 => aux_B(22),
    cin => aux_cin(22),
    cout => carry_out_b1(22),
    sum => sum_b1(22)
);

cell_instance_b1a23: Array_multiplier_cell port map (
    a_1 => aux_A(23),
    b_1 => aux_B(23),
    cin => aux_cin(23),
    cout => carry_out_b1(23),
    sum => sum_b1(23)
);

cell_instance_b1a24: Array_multiplier_cell port map (
    a_1 => aux_A(24),
    b_1 => aux_B(24),
    cin => aux_cin(24),
    cout => carry_out_b1(24),
    sum => sum_b1(24)
);

cell_instance_b1a25: Array_multiplier_cell port map (
    a_1 => aux_A(25),
    b_1 => aux_B(25),
    cin => aux_cin(25),
    cout => carry_out_b1(25),
    sum => sum_b1(25)
);

cell_instance_b1a26: Array_multiplier_cell port map (
    a_1 => aux_A(26),
    b_1 => aux_B(26),
    cin => aux_cin(26),
    cout => carry_out_b1(26),
    sum => sum_b1(26)
);

cell_instance_b1a27: Array_multiplier_cell port map (
    a_1 => aux_A(27),
    b_1 => aux_B(27),
    cin => aux_cin(27),
    cout => carry_out_b1(27),
    sum => sum_b1(27)
);

cell_instance_b1a28: Array_multiplier_cell port map (
    a_1 => aux_A(28),
    b_1 => aux_B(28),
    cin => aux_cin(28),
    cout => carry_out_b1(28),
    sum => sum_b1(28)
);

cell_instance_b1a29: Array_multiplier_cell port map (
    a_1 => aux_A(29),
    b_1 => aux_B(29),
    cin => aux_cin(29),
    cout => carry_out_b1(29),
    sum => sum_b1(29)
);

cell_instance_b1a30: Array_multiplier_cell port map (
    a_1 => aux_A(30),
    b_1 => aux_B(30),
    cin => aux_cin(30),
    cout => carry_out_b1(30),
    sum => sum_b1(30)
);

cell_instance_b1a31: Array_multiplier_cell port map (
    a_1 => aux_A(31),
    b_1 => aux_B(31),
    cin => aux_cin(31),
    cout => carry_out_b1(31),
    sum => sum_b1(31)
);

--Istanzio la riga b2

cell_instance_b2a0: Array_multiplier_cell port map (
    a_1 => aux_A(0),
    b_1 => aux_B(0),
    cin => aux_cin(0),
    cout => carry_out_b2(0),
    sum => sum_b2(0)
);

cell_instance_b2a1: Array_multiplier_cell port map (
    a_1 => aux_A(1),
    b_1 => aux_B(1),
    cin => aux_cin(1),
    cout => carry_out_b2(1),
    sum => sum_b2(1)
);

cell_instance_b2a2: Array_multiplier_cell port map (
    a_1 => aux_A(2),
    b_1 => aux_B(2),
    cin => aux_cin(2),
    cout => carry_out_b2(2),
    sum => sum_b2(2)
);

cell_instance_b2a3: Array_multiplier_cell port map (
    a_1 => aux_A(3),
    b_1 => aux_B(3),
    cin => aux_cin(3),
    cout => carry_out_b2(3),
    sum => sum_b2(3)
);

cell_instance_b2a4: Array_multiplier_cell port map (
    a_1 => aux_A(4),
    b_1 => aux_B(4),
    cin => aux_cin(4),
    cout => carry_out_b2(4),
    sum => sum_b2(4)
);

cell_instance_b2a5: Array_multiplier_cell port map (
    a_1 => aux_A(5),
    b_1 => aux_B(5),
    cin => aux_cin(5),
    cout => carry_out_b2(5),
    sum => sum_b2(5)
);

cell_instance_b2a6: Array_multiplier_cell port map (
    a_1 => aux_A(6),
    b_1 => aux_B(6),
    cin => aux_cin(6),
    cout => carry_out_b2(6),
    sum => sum_b2(6)
);

cell_instance_b2a7: Array_multiplier_cell port map (
    a_1 => aux_A(7),
    b_1 => aux_B(7),
    cin => aux_cin(7),
    cout => carry_out_b2(7),
    sum => sum_b2(7)
);

cell_instance_b2a8: Array_multiplier_cell port map (
    a_1 => aux_A(8),
    b_1 => aux_B(8),
    cin => aux_cin(8),
    cout => carry_out_b2(8),
    sum => sum_b2(8)
);

cell_instance_b2a9: Array_multiplier_cell port map (
    a_1 => aux_A(9),
    b_1 => aux_B(9),
    cin => aux_cin(9),
    cout => carry_out_b2(9),
    sum => sum_b2(9)
);

cell_instance_b2a10: Array_multiplier_cell port map (
    a_1 => aux_A(10),
    b_1 => aux_B(10),
    cin => aux_cin(10),
    cout => carry_out_b2(10),
    sum => sum_b2(10)
);

cell_instance_b2a11: Array_multiplier_cell port map (
    a_1 => aux_A(11),
    b_1 => aux_B(11),
    cin => aux_cin(11),
    cout => carry_out_b2(11),
    sum => sum_b2(11)
);

cell_instance_b2a12: Array_multiplier_cell port map (
    a_1 => aux_A(12),
    b_1 => aux_B(12),
    cin => aux_cin(12),
    cout => carry_out_b2(12),
    sum => sum_b2(12)
);

cell_instance_b2a13: Array_multiplier_cell port map (
    a_1 => aux_A(13),
    b_1 => aux_B(13),
    cin => aux_cin(13),
    cout => carry_out_b2(13),
    sum => sum_b2(13)
);

cell_instance_b2a14: Array_multiplier_cell port map (
    a_1 => aux_A(14),
    b_1 => aux_B(14),
    cin => aux_cin(14),
    cout => carry_out_b2(14),
    sum => sum_b2(14)
);

cell_instance_b2a15: Array_multiplier_cell port map (
    a_1 => aux_A(15),
    b_1 => aux_B(15),
    cin => aux_cin(15),
    cout => carry_out_b2(15),
    sum => sum_b2(15)
);

cell_instance_b2a16: Array_multiplier_cell port map (
    a_1 => aux_A(16),
    b_1 => aux_B(16),
    cin => aux_cin(16),
    cout => carry_out_b2(16),
    sum => sum_b2(16)
);

cell_instance_b2a17: Array_multiplier_cell port map (
    a_1 => aux_A(17),
    b_1 => aux_B(17),
    cin => aux_cin(17),
    cout => carry_out_b2(17),
    sum => sum_b2(17)
);

cell_instance_b2a18: Array_multiplier_cell port map (
    a_1 => aux_A(18),
    b_1 => aux_B(18),
    cin => aux_cin(18),
    cout => carry_out_b2(18),
    sum => sum_b2(18)
);

cell_instance_b2a19: Array_multiplier_cell port map (
    a_1 => aux_A(19),
    b_1 => aux_B(19),
    cin => aux_cin(19),
    cout => carry_out_b2(19),
    sum => sum_b2(19)
);

cell_instance_b2a20: Array_multiplier_cell port map (
    a_1 => aux_A(20),
    b_1 => aux_B(20),
    cin => aux_cin(20),
    cout => carry_out_b2(20),
    sum => sum_b2(20)
);

cell_instance_b2a21: Array_multiplier_cell port map (
    a_1 => aux_A(21),
    b_1 => aux_B(21),
    cin => aux_cin(21),
    cout => carry_out_b2(21),
    sum => sum_b2(21)
);

cell_instance_b2a22: Array_multiplier_cell port map (
    a_1 => aux_A(22),
    b_1 => aux_B(22),
    cin => aux_cin(22),
    cout => carry_out_b2(22),
    sum => sum_b2(22)
);

cell_instance_b2a23: Array_multiplier_cell port map (
    a_1 => aux_A(23),
    b_1 => aux_B(23),
    cin => aux_cin(23),
    cout => carry_out_b2(23),
    sum => sum_b2(23)
);

cell_instance_b2a24: Array_multiplier_cell port map (
    a_1 => aux_A(24),
    b_1 => aux_B(24),
    cin => aux_cin(24),
    cout => carry_out_b2(24),
    sum => sum_b2(24)
);

cell_instance_b2a25: Array_multiplier_cell port map (
    a_1 => aux_A(25),
    b_1 => aux_B(25),
    cin => aux_cin(25),
    cout => carry_out_b2(25),
    sum => sum_b2(25)
);

cell_instance_b2a26: Array_multiplier_cell port map (
    a_1 => aux_A(26),
    b_1 => aux_B(26),
    cin => aux_cin(26),
    cout => carry_out_b2(26),
    sum => sum_b2(26)
);

cell_instance_b2a27: Array_multiplier_cell port map (
    a_1 => aux_A(27),
    b_1 => aux_B(27),
    cin => aux_cin(27),
    cout => carry_out_b2(27),
    sum => sum_b2(27)
);

cell_instance_b2a28: Array_multiplier_cell port map (
    a_1 => aux_A(28),
    b_1 => aux_B(28),
    cin => aux_cin(28),
    cout => carry_out_b2(28),
    sum => sum_b2(28)
);

cell_instance_b2a29: Array_multiplier_cell port map (
    a_1 => aux_A(29),
    b_1 => aux_B(29),
    cin => aux_cin(29),
    cout => carry_out_b2(29),
    sum => sum_b2(29)
);

cell_instance_b2a30: Array_multiplier_cell port map (
    a_1 => aux_A(30),
    b_1 => aux_B(30),
    cin => aux_cin(30),
    cout => carry_out_b2(30),
    sum => sum_b2(30)
);

cell_instance_b2a31: Array_multiplier_cell port map (
    a_1 => aux_A(31),
    b_1 => aux_B(31),
    cin => aux_cin(31),
    cout => carry_out_b2(31),
    sum => sum_b2(31)
);

-- istazio la riga b3
cell_instance_b3a0: Array_multiplier_cell port map (
    a_1 => aux_A(0),
    b_1 => aux_B(0),
    cin => aux_cin(0),
    cout => carry_out_b3(0),
    sum => sum_b3(0)
);

cell_instance_b3a1: Array_multiplier_cell port map (
    a_1 => aux_A(1),
    b_1 => aux_B(1),
    cin => aux_cin(1),
    cout => carry_out_b3(1),
    sum => sum_b3(1)
);

cell_instance_b3a2: Array_multiplier_cell port map (
    a_1 => aux_A(2),
    b_1 => aux_B(2),
    cin => aux_cin(2),
    cout => carry_out_b3(2),
    sum => sum_b3(2)
);

cell_instance_b3a3: Array_multiplier_cell port map (
    a_1 => aux_A(3),
    b_1 => aux_B(3),
    cin => aux_cin(3),
    cout => carry_out_b3(3),
    sum => sum_b3(3)
);

cell_instance_b3a4: Array_multiplier_cell port map (
    a_1 => aux_A(4),
    b_1 => aux_B(4),
    cin => aux_cin(4),
    cout => carry_out_b3(4),
    sum => sum_b3(4)
);

cell_instance_b3a5: Array_multiplier_cell port map (
    a_1 => aux_A(5),
    b_1 => aux_B(5),
    cin => aux_cin(5),
    cout => carry_out_b3(5),
    sum => sum_b3(5)
);

cell_instance_b3a6: Array_multiplier_cell port map (
    a_1 => aux_A(6),
    b_1 => aux_B(6),
    cin => aux_cin(6),
    cout => carry_out_b3(6),
    sum => sum_b3(6)
);

cell_instance_b3a7: Array_multiplier_cell port map (
    a_1 => aux_A(7),
    b_1 => aux_B(7),
    cin => aux_cin(7),
    cout => carry_out_b3(7),
    sum => sum_b3(7)
);

cell_instance_b3a8: Array_multiplier_cell port map (
    a_1 => aux_A(8),
    b_1 => aux_B(8),
    cin => aux_cin(8),
    cout => carry_out_b3(8),
    sum => sum_b3(8)
);

cell_instance_b3a9: Array_multiplier_cell port map (
    a_1 => aux_A(9),
    b_1 => aux_B(9),
    cin => aux_cin(9),
    cout => carry_out_b3(9),
    sum => sum_b3(9)
);

cell_instance_b3a10: Array_multiplier_cell port map (
    a_1 => aux_A(10),
    b_1 => aux_B(10),
    cin => aux_cin(10),
    cout => carry_out_b3(10),
    sum => sum_b3(10)
);

cell_instance_b3a11: Array_multiplier_cell port map (
    a_1 => aux_A(11),
    b_1 => aux_B(11),
    cin => aux_cin(11),
    cout => carry_out_b3(11),
    sum => sum_b3(11)
);

cell_instance_b3a12: Array_multiplier_cell port map (
    a_1 => aux_A(12),
    b_1 => aux_B(12),
    cin => aux_cin(12),
    cout => carry_out_b3(12),
    sum => sum_b3(12)
);

cell_instance_b3a13: Array_multiplier_cell port map (
    a_1 => aux_A(13),
    b_1 => aux_B(13),
    cin => aux_cin(13),
    cout => carry_out_b3(13),
    sum => sum_b3(13)
);

cell_instance_b3a14: Array_multiplier_cell port map (
    a_1 => aux_A(14),
    b_1 => aux_B(14),
    cin => aux_cin(14),
    cout => carry_out_b3(14),
    sum => sum_b3(14)
);

cell_instance_b3a15: Array_multiplier_cell port map (
    a_1 => aux_A(15),
    b_1 => aux_B(15),
    cin => aux_cin(15),
    cout => carry_out_b3(15),
    sum => sum_b3(15)
);

cell_instance_b3a16: Array_multiplier_cell port map (
    a_1 => aux_A(16),
    b_1 => aux_B(16),
    cin => aux_cin(16),
    cout => carry_out_b3(16),
    sum => sum_b3(16)
);

cell_instance_b3a17: Array_multiplier_cell port map (
    a_1 => aux_A(17),
    b_1 => aux_B(17),
    cin => aux_cin(17),
    cout => carry_out_b3(17),
    sum => sum_b3(17)
);

cell_instance_b3a18: Array_multiplier_cell port map (
    a_1 => aux_A(18),
    b_1 => aux_B(18),
    cin => aux_cin(18),
    cout => carry_out_b3(18),
    sum => sum_b3(18)
);

cell_instance_b3a19: Array_multiplier_cell port map (
    a_1 => aux_A(19),
    b_1 => aux_B(19),
    cin => aux_cin(19),
    cout => carry_out_b3(19),
    sum => sum_b3(19)
);

cell_instance_b3a20: Array_multiplier_cell port map (
    a_1 => aux_A(20),
    b_1 => aux_B(20),
    cin => aux_cin(20),
    cout => carry_out_b3(20),
    sum => sum_b3(20)
);

cell_instance_b3a21: Array_multiplier_cell port map (
    a_1 => aux_A(21),
    b_1 => aux_B(21),
    cin => aux_cin(21),
    cout => carry_out_b3(21),
    sum => sum_b3(21)
);

cell_instance_b3a22: Array_multiplier_cell port map (
    a_1 => aux_A(22),
    b_1 => aux_B(22),
    cin => aux_cin(22),
    cout => carry_out_b3(22),
    sum => sum_b3(22)
);

cell_instance_b3a23: Array_multiplier_cell port map (
    a_1 => aux_A(23),
    b_1 => aux_B(23),
    cin => aux_cin(23),
    cout => carry_out_b3(23),
    sum => sum_b3(23)
);

cell_instance_b3a24: Array_multiplier_cell port map (
    a_1 => aux_A(24),
    b_1 => aux_B(24),
    cin => aux_cin(24),
    cout => carry_out_b3(24),
    sum => sum_b3(24)
);

cell_instance_b3a25: Array_multiplier_cell port map (
    a_1 => aux_A(25),
    b_1 => aux_B(25),
    cin => aux_cin(25),
    cout => carry_out_b3(25),
    sum => sum_b3(25)
);

cell_instance_b3a26: Array_multiplier_cell port map (
    a_1 => aux_A(26),
    b_1 => aux_B(26),
    cin => aux_cin(26),
    cout => carry_out_b3(26),
    sum => sum_b3(26)
);

cell_instance_b3a27: Array_multiplier_cell port map (
    a_1 => aux_A(27),
    b_1 => aux_B(27),
    cin => aux_cin(27),
    cout => carry_out_b3(27),
    sum => sum_b3(27)
);

cell_instance_b3a28: Array_multiplier_cell port map (
    a_1 => aux_A(28),
    b_1 => aux_B(28),
    cin => aux_cin(28),
    cout => carry_out_b3(28),
    sum => sum_b3(28)
);

cell_instance_b3a29: Array_multiplier_cell port map (
    a_1 => aux_A(29),
    b_1 => aux_B(29),
    cin => aux_cin(29),
    cout => carry_out_b3(29),
    sum => sum_b3(29)
);

cell_instance_b3a30: Array_multiplier_cell port map (
    a_1 => aux_A(30),
    b_1 => aux_B(30),
    cin => aux_cin(30),
    cout => carry_out_b3(30),
    sum => sum_b3(30)
);

cell_instance_b3a31: Array_multiplier_cell port map (
    a_1 => aux_A(31),
    b_1 => aux_B(31),
    cin => aux_cin(31),
    cout => carry_out_b3(31),
    sum => sum_b3(31)
);
end Behavioral;
