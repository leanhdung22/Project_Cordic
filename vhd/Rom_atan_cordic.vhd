------------------------------rom_Cordic.vhd-------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity Rom_atan_cordic is
  port(Rom_Address : in  std_logic_vector(3 downto 0);
       Rom_out     : out std_logic_vector(15 downto 0));
end Rom_atan_cordic;

architecture A of Rom_atan_cordic is
  type tab_rom is array (0 to 15) of std_logic_vector(15 downto 0);
  constant atan_rom : tab_rom :=
    (0 => "0110010010000111", 1 => "0011101101011000" , 2 => "0011111010110110",
     -- 45                                              --      28.072
    3	=> "0001111111010101" , 4 => "0000111111111010" , 5 => "0000011111111111",
     --
     6	=> "0000001111111111" , 7 => "0000000111111111" ,  8 => "0000000011111111" ,

    9	=> "0000000001111111" , 10 => "0000000000111111" , 11 => "0000000000011111",
     --
     12 => "0000000000001111", 13 =>  "0000000000000111", 14 =>  "0000000000000011",
     --
     15 => "0000000000000001");

begin

  Rom_out <= atan_rom(to_integer(unsigned(Rom_Address)));

end A;

