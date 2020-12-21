       IDENTIFICATION DIVISION.
       PROGRAM-ID. TRUNC01.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 6-BYTES       PIC X(6) VALUE "Hello".
       01 5-BYTES       PIC X(5) VALUE "Hello".
       01 4-BYTES       PIC X(4) VALUE "Hello".
       01 3-BYTES       PIC X(3) VALUE "Hello".
       01 2-BYTES       PIC X(2) VALUE "Hello".
       01 1-BYTES       PIC X(1) VALUE "Hello".

       01 5-DIGITS      PIC 9(5) VALUE 2397.
       01 4-DIGITS      PIC 9(4) VALUE 2397.
       01 3-DIGITS      PIC 9(3) VALUE 2397.
       01 2-DIGITS      PIC 9(2) VALUE 2397.
       01 1-DIGITS      PIC 9(1) VALUE 2397.

       PROCEDURE DIVISION.
       PROGRAM-BEGIN.


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

