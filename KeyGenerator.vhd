library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity KeyGenerator is
    port (
        clk: in std_logic;
        en: in std_logic;
        prime1_key, prime2_key: buffer integer;
        encryption_key, decryption_key, n_key: out integer
    );
end entity KeyGenerator;

architecture rtl of KeyGenerator is

    component RandomPrimeGenerator is
        port (
            clk: in std_logic;
            en: in std_logic;
            prime1, prime2: out integer
        );
    end component RandomPrimeGenerator;

    --Coprime Testing Function
    function IsCoprime(A, B: INTEGER) return BOOLEAN is
        variable Remainder: INTEGER;
        variable TempA, TempB: INTEGER;
    begin
        TempA := A;
        TempB := B;
        if TempA > TempB then
            TempA := B;
            TempB := A;
        end if;

        loop
            Remainder := TempB mod TempA;
            exit when Remainder = 0;
            TempB := TempA;
            TempA := Remainder;
        end loop;

        return TempA = 1;
    end IsCoprime;

begin
    RandomPrimeGenerator1: RandomPrimeGenerator port map (
        clk => clk, 
        en => en, 
        prime1 => prime1_key, 
        prime2 => prime2_key
    );

    process(clk)
        variable N, T, e, d: integer := 0;
    begin
        if rising_edge(clk) AND en = '1' then   
            N := prime1_key * prime2_key;
            T := (prime1_key - 1) * (prime2_key - 1);         

            --Algorithm to find e (encryption key)
            for i in 2 to T - 1 loop
                if T mod i /= 0 and N mod i /= 0 and IsCoprime(i, T) and IsCoprime(i, N) then
                    e := i;
                    exit;
                end if;
            end loop;
            
            --Algorithm to find d (decryption key)
            for i in 1 to T loop
                if (e * i) mod T = 1 then
                    d := i;
                    exit;
                end if;
            end loop;
        end if;

        encryption_key <= e;
        decryption_key <= d;
        n_key <= N;
    end process;

    -- Additional logic for key generation (e.g., calculation of private key 'd')
    -- e * d mod T = 1
    -- e must be < T and coprime with N and T
    -- Add your key generation logic here

end architecture rtl;
