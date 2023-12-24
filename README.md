# Final Project PSD - RSA-Encryptor on VHDL

## Background
In today's digital era, information security is very important. A lot of sensitive and personal data is transmitted over communications networks, such as text messages, emails, and various types of files. Therefore, protecting this data is an urgent need.

However, the main problem faced is the potential for attacks by unauthorized parties who attempt to steal or damage data. The most common technique used by hackers is to try to decrypt transmitted or stored information. To overcome this problem, a strong and efficient encryption system is needed.

## How it works
This program can create random numbers using the impure function, which is found in RandomPrimeGenerator.vhd. In this program, two 12 bit random numbers (4096 in decimal) will be generated and it will be checked whether the numbers are prime or not. If the two numbers are random, then the two numbers will be entered into p and q.

### Control Unit 
These VHDL programs are implementations for the entities and architecture that form a simple control unit. The "ControlUnit" entity has two ports, namely "text_input" as string input with length 1 to 4, and "decimal_output" as integer output. The "rtl" (register-transfer level) architecture of the entity defines a process that is executed continuously. This process has a delay of 10 ns, perhaps added to overcome potential simulation problems or for specific purposes.

### Key Generator 
This VHDL program implements a "KeyGenerator" entity which is responsible for generating public keys and private keys based on the prime numbers p_key and q_key. The main components in this program are processes that are activated at each rising edge of the clock signal (clk). In this process, there is another component called RandomPrimeGenerator. This component is responsible for generating two prime numbers which will be p_key and q_key.

Next, in the main process, calculations are carried out to determine the encryption key (e) and decryption key (d) based on the algorithm listed. The results of this calculation are then stored in public_key and private_key signals. The program also provides comments indicating where to add additional logic, such as private key calculation (d), that may be necessary in more complex cryptographic implementations. In short, the goal of this program is to generate public and private keys used in cryptographic algorithms, where the public key is used for encryption and the private key for decryption.

### Random Prime Generator 
In the "RandomPrimeGenerator" program, it is designed to generate two prime numbers (p and q) based on a clock signal (clk). This program uses a trial division method to ensure that the resulting number is prime. In its implementation, the program uses processes that are activated at each rising edge of the clock signal. In this process, the variables are initialized, such as seed1, seed2, rand_int1, and rand_int2, which are needed to generate random numbers.

This program has a rand_int_gen function that generates random integers in a specified range. This function uses the seed values and the uniform function from the IEEE.math_real package to generate a random value between 0 and 1, then converts it to an integer within the specified range.

In each processing cycle, the program generates two random numbers (rand_int1 and rand_int2). Next, the program uses a trial division method to check whether both are prime numbers. This process is done by dividing each number by the numbers from 2 to the square root of that number. If a divisor is found that divides evenly, then the number is not prime.

This process is repeated until the two resulting numbers are truly prime numbers. After that, the prime numbers are copied into the output p and q. In summary, the goal of this program is to provide two prime numbers (p and q) as output based on a clock signal, by ensuring that these numbers are truly prime numbers through the trial and error method.

## How to Use
Our program works is encryption and decryption a message. In Sender.vhd, you will be given a message in the form of a string of 10 capital letters, each letter separated by whitespace. The message will be processed by the main program Receiver.vhd.

## Finite State Machine
![image](https://github.com/verszz/ProyekAkhir_BP10/assets/128483728/9b83b8a7-0daf-4411-92a0-f7e8fe627b17)
 
## Testing
To test the encryption and decryption of this message, use the Sender.vhd file which acts as a testbench. In the Sender file, you will be given a message in the form of a string of 10 capital letters, each letter separated by whitespace. The message will be processed by the main program Receiver.vhd.

## Result and Wave
### Sender.vhd
![image](https://github.com/verszz/ProyekAkhir_BP10/assets/128483728/460fd52c-df73-42fa-9bc4-7bf6907518c9)

### Receiver.vhd
![image](https://github.com/verszz/ProyekAkhir_BP10/assets/128483728/d9ea7088-1a4d-4822-a033-ac904d080a24)

### RandomPrimeGenerator.vhd
![image](https://github.com/verszz/ProyekAkhir_BP10/assets/128483728/337aa0e9-9ce5-4336-abf6-703e1942339f)

### KeyGenerator.vhd
![image](https://github.com/verszz/ProyekAkhir_BP10/assets/128483728/d2722e25-30b8-4594-9753-f412eeec4836)
-
