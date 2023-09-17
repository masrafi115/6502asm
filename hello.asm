; 6502 Assembly "Hello, World!" program for Commodore 64
    ; Address $1000 is used as the starting point

    *=$1000   ; Start address

    ; Initialize screen and set text color
    LDA #$32   ; Load the color code (white)
    STA $D020  ; Store it in the VIC-II register for background color

    ; Print "Hello, World!" to the screen
    LDX #0     ; Initialize X register for indexing the message
printLoop:
    LDA helloWorldText,X  ; Load the next character from the message
    BEQ programEnd        ; If it's a null terminator, end the program
    JSR $FFD2            ; Call KERNAL routine to print the character on the screen
    INX                  ; Increment X to point to the next character
    JMP printLoop         ; Repeat for the next character

programEnd:
    BRK                  ; Break and halt the program

    ; Null-terminated string "Hello, World!" followed by a zero byte
helloWorldText:
    .text "Hello, World!", 0

    ; Padding to reach the desired load address ($1000)
    .org $1FFC
    .word $1000