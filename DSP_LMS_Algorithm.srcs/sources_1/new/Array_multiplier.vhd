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

entity Array_multiplier is
    Generic (n : integer := 32); -- Dimensione dei moltiplicandi (4 bit di default)
    Port ( a : in STD_LOGIC_VECTOR (n-1 downto 0);
           b : in STD_LOGIC_VECTOR (n-1 downto 0);
           result : out STD_LOGIC_VECTOR ((2*n)-1 downto 0));
end Array_multiplier;

architecture Structural of Array_multiplier is

    -- Segnali interni
    signal aux_cin :                std_logic_vector(n downto 0) := (others => '0');
    signal aux_A, aux_B :           std_logic_vector(n-1 downto 0);
    signal aux_result_diagonale :   std_logic_vector(n-1 downto 0);
    signal aux_sum_bits_last_row:   std_logic_vector(n-1 downto 0);
    signal aux_carry_bits_last_row: std_logic_vector(n-1 downto 0);
    signal aux_carry_out_vma:       std_logic;
    signal aux_partialsum_carry_bits_vma:        std_logic_vector(n-1 downto 0);
    signal aux_partialsum_carry_bits_complemented : std_logic_vector(n-1 downto 0);
    signal aux_sum_bits_vma:        std_logic_vector(n-1 downto 0);

    signal aux_two_complement_normalization: std_logic_vector(31 downto 0):= (others => '0');
    -- define the carry array each elementary cell will output a carry each row of
    --the carry matrix  cointains the carry output from each row
    type carry_matrix_out is array(0 to n-1, 0 to n-1) of std_logic;
    signal carry_out_element: carry_matrix_out;
    
--    signal carry_out_b : array of std_logic_vector(n-1 downto 0);
--    signal carry_out_b : std_logic_vector(n-1 downto 0);
    type sum_matrix is array(0 to n-1, 0 to n-1) of std_logic;
    signal sum_out_element: carry_matrix_out;

    -- Componente della cella elementare
    component Array_multiplier_cell is
        Port ( a_1 : in STD_LOGIC;
               b_1 : in STD_LOGIC;
               partial_sum : in std_logic;
               cin : in STD_LOGIC;
               cout : out STD_LOGIC;
               sum : out STD_LOGIC);
    end component;

component Array_multiplier_nand_cell is
    Port ( a_1 : in STD_LOGIC;
           b_1 : in STD_LOGIC;
           partial_sum : in STD_LOGIC;
           cin : in STD_LOGIC;
           cout : out STD_LOGIC;
           sum : out STD_LOGIC);
end component;
    
    component BrentKung_adder is
    port(
        a, b : in STD_LOGIC_VECTOR(31 downto 0);
        c_in : in std_logic;
        s : out STD_LOGIC_VECTOR(31 downto 0);
        c_out : out std_logic
    );
    end component;
begin
    aux_A <= a;
    aux_B <= b;
    aux_two_complement_normalization(0)<='1';
    aux_two_complement_normalization(31)<='1';
--    -- Generazione delle celle del moltiplicatore
--    gen_cells: for i in 0 to n-1 generate
--        cell_row: for j in 0 to n-1 generate
--            cell: Array_multiplier_cell port map (
--                a_1 => aux_A(i),  
--                b_1 => aux_B(j),  
--                b_2 => aux_B(j+1), 
--                cin => aux_cin(i),    
--                cout => aux_cin(i+1),   
--                sum => sum_b(i)      
--            );
--        end generate;
--    end generate;
-- Dichiarazione degli array per riporti e somme parziali


-- Generazione delle celle del moltiplicatore
    cell_row: for j in 0 to n-1 generate
    check_row_cells_0_n_2: if j<=n-2 generate
        row_cells_0_n_2: Array_multiplier_cell port map (
            a_1 => aux_A(j),  
            b_1 => aux_B(0),  
            partial_sum => '0', 
            cin => '0', 
            cout => carry_out_element(0,j),   
            sum => sum_out_element(0,j)      
        );
        end generate;
        cell_row_0_n_1: if j=n-1 generate
            row_cells_n_1: Array_multiplier_nand_cell port map (
            a_1 => aux_A(j),  
            b_1 => aux_B(0),  
            partial_sum => '0', 
            cin => '0', 
            cout => carry_out_element(0,j),   
            sum => sum_out_element(0,j)      
        );
        end generate;
    end generate;

-- Instanziation of  n-1 row of elementary cell
gen_cells: for i in 1 to n-1 generate
    cell_row: for j in 0 to n-1 generate
        generation_row_cells: if j <= n-2 and i <= n-2 generate
            row_cells_from_row_1_to_row_n_2: Array_multiplier_cell port map (
                a_1 => aux_A(j),  
                b_1 => aux_B(i),  
                partial_sum => sum_out_element(i-1,j+1), 
                cin => carry_out_element(i-1,j), -- Carry previous cell
                cout => carry_out_element(i,j),   
                sum => sum_out_element(i,j)      
            );

            
            end generate;
            
         generation_row_from_1_to_n_2_cells_n_1: if j = n-1 and i <=n-2 generate
                --Instanziation of nand element cell
               last_generate_cell: Array_multiplier_nand_cell port map (
                a_1 => aux_A(j),  
                b_1 => aux_B(i),  
                partial_sum => '0', 
                cin => carry_out_element(i-1,j), -- Carry previous cell
                cout => carry_out_element(i,j),   
                sum => sum_out_element(i,j)      
            );
          end generate;  
          generation_row_n_1_cells_from_0_to_n_2: if j <=n-2 and i = n-1 generate
            
                nand_row_cells: Array_multiplier_nand_cell port map (
                a_1 => aux_A(j),  
                b_1 => aux_B(i),  
                partial_sum => sum_out_element(i-1,j+1), 
                cin => carry_out_element(i-1,j), -- Carry previous cell
                cout => carry_out_element(i,j),   
                sum => sum_out_element(i,j)      
            );
          
          end generate;

          generation_row_n_1_cells_n_1: if j = n-1 and i = n-1 generate
                and_last_row_last_cell: Array_multiplier_cell port map (
                a_1 => aux_A(j),  
                b_1 => aux_B(i),  
                partial_sum => '0', 
                cin => carry_out_element(i-1,j), -- Carry previous cell
                cout => carry_out_element(i,j),   
                sum => sum_out_element(i,j)      
            );
          end generate;

    end generate;
end generate;

--Instanziation of n-1 row

   -- Collect diagonal sum bits
      -- Collect last row sum and carry bits
    diagonal_collector:  for y in 0 to n-1 generate
            
           aux_result_diagonale(y) <= sum_out_element(y, 0);
           aux_carry_bits_last_row(y) <= carry_out_element(n-1,y);

        end generate;
        
        last_row_carry_summ_loop:for j in 1 to n-1 generate
        
            aux_sum_bits_last_row(j-1) <= sum_out_element(n-1,j);

        end generate;
        
            aux_sum_bits_last_row(n-1) <='0';

   --  Sum of partial product with the 2-complement normalization quantity
    fast_adder_partialsum_carry_bits: BrentKung_adder port map(
        a => aux_sum_bits_last_row,
        b => aux_carry_bits_last_row,
        c_in=>'0',
        c_out =>aux_carry_out_vma,
        s => aux_partialsum_carry_bits_vma
    );

    fast_adder_sum_bits: BrentKung_adder port map(
        a => aux_partialsum_carry_bits_vma,
        b => aux_two_complement_normalization,
        c_in=>'0',
        c_out =>aux_carry_out_vma,
        s => aux_sum_bits_vma
    );
    
   result <= aux_sum_bits_vma &  aux_result_diagonale;
end Structural;



