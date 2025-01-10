```vhdl
entity counter is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           count : out  STD_LOGIC_VECTOR (3 downto 0));
end entity;

architecture behavioral of counter is
    signal internal_count : STD_LOGIC_VECTOR (3 downto 0) := "0000";
begin
    process (clk, rst)
    begin
        if rst = '1' then
            internal_count <= "0000";
        elsif rising_edge(clk) then
            internal_count <= internal_count + 1;
        end if;
    end process;
    count <= internal_count;
end architecture;
```