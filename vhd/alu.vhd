-------------------------------alu.vhd--------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Alu is

  generic (
    N : positive
    );

  port (
    A, B : in  std_logic_vector(N-1 downto 0);
    S    : out std_logic_vector(N-1 downto 0);
    CMD  : in  std_logic_vector(1 downto 0));

end entity Alu;

architecture A of Alu is
  signal result   : unsigned(N downto 0);
  signal a_u, b_u : unsigned(N-1 downto 0);
begin  -- architecture A
  a_u <= unsigned(A);
  b_u <= unsigned(B);
  S   <= std_logic_vector(result(N-1 downto 0));

  with CMD select result <=
    ('0' & a_u) + ('0' & b_u) when "00",
    ('0' & a_u) - ('0' & b_u) when "01",
    (others => '0')           when others;

end architecture A;