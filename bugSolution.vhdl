```vhdl
entity counter is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           count : out  STD_LOGIC_VECTOR (3 downto 0);
           overflow : out STD_LOGIC); -- Added overflow signal
end entity;

architecture behavioral of counter is
    signal internal_count : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    signal overflow_signal : STD_LOGIC := '0';
begin
    process (clk, rst)
    begin
        if rst = '1' then
            internal_count <= "0000";
            overflow_signal <= '0';
        elsif rising_edge(clk) then
            if internal_count = "1111" then
                internal_count <= "0000";
                overflow_signal <= '1';
            else
                internal_count <= internal_count + 1;
                overflow_signal <= '0';
            end if;
        end if;
    end process;
    count <= internal_count;
    overflow <= overflow_signal; -- Assign overflow signal to output
end architecture;
```