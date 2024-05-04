----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.03.2024 11:26:51
-- Design Name: 
-- Module Name: XADCInterface - Behavioral
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
use IEEE.std_logic_unsigned.all;
-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity XADCInterface is
  Port (
  signal clk: in std_logic;
  signal reset: in std_logic;
  signal led_rgb: out std_logic_vector(2 downto 0);
  signal led: out std_logic_vector(1 downto 0);
  signal turn_on: in std_logic;
  signal xa_p: in std_logic;
  signal xa_n: in std_logic
  
   );
end XADCInterface;

architecture Behavioral of XADCInterface is

--COMPONENT ila_adc

--PORT (
--	clk : IN STD_LOGIC;
--	probe0 : IN STD_LOGIC_VECTOR(15 DOWNTO 0); 
--	probe1 : IN STD_LOGIC;
--	probe2 : IN STD_LOGIC
--	);
--END COMPONENT  ;

COMPONENT xadc_wiz_0
  PORT (
    di_in : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    daddr_in : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    den_in : IN STD_LOGIC;
    dwe_in : IN STD_LOGIC;
    drdy_out : OUT STD_LOGIC;
    do_out : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    dclk_in : IN STD_LOGIC;
    reset_in : IN STD_LOGIC;
    vp_in : IN STD_LOGIC;
    vn_in : IN STD_LOGIC;
    vauxp4 : IN STD_LOGIC;
    vauxn4 : IN STD_LOGIC;
    channel_out : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
    eoc_out : OUT STD_LOGIC;
    alarm_out : OUT STD_LOGIC;
    eos_out : OUT STD_LOGIC;
    busy_out : OUT STD_LOGIC
  );
END COMPONENT;


component clk_wiz_0
port
 (-- Clock in ports
  -- Clock out ports
  clk_ila          : out    std_logic;
  clk_adc          : out    std_logic;
  -- Status and control signals
  reset             : in     std_logic;
  locked            : out    std_logic;
  clk_in           : in     std_logic
 );
end component;


constant pwmMax:        std_logic_vector(11 downto 0) := x"FE6";
constant chan0_addr:    std_logic_vector(4 downto 0) := "10000";  -- x10
constant chan1_addr:    std_logic_vector(4 downto 0) := "11100";  -- x14

signal di_in:           std_logic_vector(15 downto 0);
signal data:            std_logic_vector(15 downto 0);
signal data0_reg:       std_logic_vector(11 downto 0);
signal data1_reg:       std_logic_vector(11 downto 0);
signal daddr_in:        std_logic_vector(6 downto 0);
signal channel_out:     std_logic_vector(4 downto 0);
signal den_in:          std_logic;
signal dataReady:       std_logic;
signal convDone:        std_logic;
signal pwmCnt:          std_logic_vector(11 downto 0) := x"000";
signal clk_adc:        std_logic;
signal clk_ila:         std_logic;
signal locked_pll:       std_logic;
begin
--ILA_ADC_Monitor : ila_adc
--PORT MAP (
--	clk => clk_adc,
--	probe0 => data,
--	probe1 => dataReady,
--	probe2 => convDone
--);
clock_pll : clk_wiz_0
  port map ( 
  -- Clock out ports  
   clk_ila => clk_ila,
   clk_adc => clk_adc,
  -- Status and control signals                
   reset => reset,
   locked => locked_pll,
   -- Clock in ports
   clk_in => clk
 );
 
XADC_channel4 : xadc_wiz_0
  PORT MAP (
    di_in => di_in,
    daddr_in => daddr_in,
    den_in => '1',
    dwe_in => '0',
    drdy_out => dataReady,
    do_out => data,
    dclk_in => clk_adc,
    reset_in => reset,
    vp_in => '0',
    vn_in => '0',
    vauxp4 => xa_p,
    vauxn4 => xa_n,
    channel_out => channel_out,
    eoc_out => convDone,
    alarm_out => open,
    eos_out => open,
    busy_out => open
  );

den_proc: process(clk)
begin
    if clk'event and clk = '1' then
        den_in <= convDone;
    end if;
end process;

data0_reg <= data(15 downto 4);

di_in <= x"0000";
--led <= data0_reg(0) xor data0_reg(3) xor data0_reg(5) xor data0_reg(7) xor data0_reg(9) xor data0_reg(11);
daddr_in <= "00" & channel_out;

pwm_proc: process(clk_adc)
begin
    if clk_adc'event and clk_adc = '1' then
        if pwmCnt < pwmMax then
            pwmCnt <= pwmCnt + 1;
        else
            pwmCnt <= x"000";
        end if;
    end if;
end process pwm_proc;


led_RGB(0) <= '0' when (pwmCnt < data0_reg) else '1';
led_RGB(1) <= '0' when (pwmCnt < data0_reg) else '1';
led_RGB(2) <= '0' when (pwmCnt < data0_reg) else '1';
led(0) <= '1' when (pwmCnt < data0_reg) else '0';
led(1) <= '1' when (pwmCnt < data0_reg) else '0';

end Behavioral;
