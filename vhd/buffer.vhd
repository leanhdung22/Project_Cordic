-------------------------------buffer.vhd-----------------------------------------

library ieee;
use ieee.std_logic_1164.all;


entity buff is
  generic (
    N : positive);
  port (
    Buff_in  : in  std_logic_vector(N-1 downto 0);
    Buff_OE  : in  std_logic;
    Clk      : in  std_logic;
    Reset    : in  std_logic;
    Buff_out : out std_logic_vector(N-1 downto 0));

end entity buff;

architecture A of buff is

begin  -- architecture A

  P_buff : process (Clk)
  begin  -- process P_buff
    if(Clk = '1' and Clk'event) then
      if Reset = '1' then
        Buff_out <= (others => '0');
      elsif Buff_OE = '1' then
        Buff_out <= Buff_in;
      end if;
    end if;
  end process P_buff;
end architecture A;
