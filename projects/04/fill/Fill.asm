// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

  @i
  M=0
(LOOP)
  @KBD
  D=M;
  @FILL
  D;JGT
  @i
  D=M
  @LOOP
  D;JLT
  @i
  D=M
  @SCREEN
  A=A+D
  M=0
  @i
  M=M-1
  @LOOP
  0;JMP
(FILL)
  @i
  M=0
  (FILL_LOOP)
    @i
    D=M
    @8192
    D=D-A
    @LOOP
    D;JGE
    @i
    D=M
    @SCREEN
    A=A+D
    M=!M
    @i
    M=M+1
    @KBD
    D=M
    @FILL_LOOP
    D;JGT
  @LOOP
  0;JMP
