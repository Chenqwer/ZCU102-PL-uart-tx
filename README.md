# ZCU102-PL-uart-tx
The use of the UART TX on the PL side of the ZCU102


This project demonstrates using the PL side of the ZCU102 to communicate with a PC via UART.
The code is modified from the source available at https://space.bilibili.com/476579378 



Simulation result
![image](https://github.com/Chenqwer/ZCU102-PL-uart-tx/assets/32257273/46ed2d98-441f-435d-8d35-b49a8bb625bb)

Test
This project uses J55 PMOD GPIO as UART port.

![image](https://github.com/Chenqwer/ZCU102-PL-uart-tx/assets/32257273/5fdb5a12-14af-4059-bfe6-90752c2b40dd)

The red line is VCC, the green line is ground, the orange line is the tx signal.

Then use a TTL-to-USB adapter to connect to the PC's COM port.

![image](https://github.com/Chenqwer/ZCU102-PL-uart-tx/assets/32257273/2ca86bfd-635e-47d9-9507-116fd8bc6379)

The SW13 on the ZCU102 has 8 DIP switches. The first switch is 128, the second is 64, and so on, with the eighth switch being 1.
Move SW13 to 65

![擷取](https://github.com/Chenqwer/ZCU102-PL-uart-tx/assets/32257273/abdbbcb4-0ea0-4d0c-b98b-87f0bba26424)

We can see the result is A (65 in ASCII code)

![image](https://github.com/Chenqwer/ZCU102-PL-uart-tx/assets/32257273/2da84a31-fc46-40bf-9600-c4b53144ebc0)

Then, B

![擷取](https://github.com/Chenqwer/ZCU102-PL-uart-tx/assets/32257273/e15127b0-6576-4a0c-8cb8-f7532a772c26)

![image](https://github.com/Chenqwer/ZCU102-PL-uart-tx/assets/32257273/426d3d91-755a-493d-b47f-be4a745c30f0)


