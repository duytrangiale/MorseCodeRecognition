# MorseCodeRecognition
This project implements the Morse code recognition device using the FPGA development board.

## Overview
In this project, a digital design that turns the FPGA development board (Basys3 in this case) into a device which accepts the input signal from the user and performs translation and displays an encoded message. In particular, the system will be able to receive and process a single-bit signal with time-varying feature illustrating a Morse code message. The system also uses a range of on-board I/O options as the user interface, such as slide switches, push buttons, LEDs and 7-segment displays (7SDs). There are two levels of function have been implemented. 
#### Level 1: 
The user can generate input signal using only centre pushbutton. The signals are differentiated by the time of pressing. The slide switches allow the user to choose different view modes, the LEDs indicates different stages of input and the 7SDs display the messages.
#### Level 2:
This level allows the user to generate multiple characters continuously (at most 4 letters) to create a word. The word will be then fully displayed on the 7SDs. In addition, the slide switches allow user to change to “Letter View” mode where each letter will be displayed separately.
More details about user interface and system design is represented in the following parts.

