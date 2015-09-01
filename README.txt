/***************************************************/
Project: System On Multi-cycle CPU

That project aims to create a simple computer system
based on MIPS multi-cycle CPU with FPGA board Nexys3.

Attention: the bit file generated can only operate on
Nexys3. If you want to run on other board, you have to
change the parameters of the project.

/***************************************************/

Folder:
1. ISEproject: the ISE project.

1. asm&coe: there are two files, RAM.asm and RAM.coe,
RAM.coe which derives from RAM.asm is the file that 
loaded in the IP core RAM_B.

2. images: contains the images and their corresponding 
coe files.

/***************************************************/
Operating Instruction:

1. There are two modes, text mode and graph mode.

2. First, you enter to the command line mode. ESC is the
key changing the mode. F4 is the key to fresh the text
mode. 

3. When you enter 'h'+'enter', the system will call an
application and prints "HelloWorld!". 

4. When you enter 'g'+'enter', the system will call an
application and changes to graph mdoe, starting a 
Dinasour game.

5. The game is t exactly the game in the chrome browser. 