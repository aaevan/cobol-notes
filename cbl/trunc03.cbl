       IDENTIFICATION DIVISION.
       PROGRAM-ID. TRUNC03.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 6-BYTES       PIC X(6).
       01 5-BYTES       PIC X(5).
       01 4-BYTES       PIC X(4).
       01 3-BYTES       PIC X(3).
       01 2-BYTES       PIC X(2).
       01 1-BYTES       PIC X(1).

       01 5-DIGITS      PIC 9(5).
       01 4-DIGITS      PIC 9(4).
       01 3-DIGITS      PIC 9(3).
       01 2-DIGITS      PIC 9(2).
       01 1-DIGITS      PIC 9(1).

       PROCEDURE DIVISION.
       PROGRAM-BEGIN.

           MOVE "HELLO" TO 6-BYTES 5-BYTES 4-BYTES
                           3-BYTES 2-BYTES 1-BYTES.

           MOVE 2397 to 5-DIGITS
                        4-DIGITS 
                        3-DIGITS 
                        2-DIGITS 
                        1-DIGITS.

           DISPLAY 6-BYTES.
           DISPLAY 5-BYTES.
           DISPLAY 4-BYTES.
           DISPLAY 3-BYTES.
           DISPLAY 2-BYTES.
           DISPLAY 1-BYTES.

           DISPLAY 5-DIGITS.
           DISPLAY 4-DIGITS.
           DISPLAY 3-DIGITS.
           DISPLAY 2-DIGITS.
           DISPLAY 1-DIGITS.

       PROGRAM-DONE.
           STOP RUN.

