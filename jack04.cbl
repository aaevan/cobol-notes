       IDENTIFICATION DIVISION.
       PROGRAM-ID. JACK04.
       ENVIRONMENT DIVISION.
       DATA DIVISION.

       WORKING-STORAGE SECTION.

       01  THE-MESSAGE      PIC X(50).
       01  THE-NUMBER       PIC 9(2) VALUE 1.
       01  A-SPACE          PIC X    VALUE " ".

       PROCEDURE DIVISION.
       PROGRAM-BEGIN.

      * Set up and display line 1
           MOVE "Jack be nimble," TO THE-MESSAGE.
           DISPLAY 
               THE-NUMBER 
               A-SPACE 
               THE-MESSAGE.

      * Set up and Display line 2
           ADD 1 TO THE-NUMBER.
           MOVE "Jack be quick," TO THE-MESSAGE.
           DISPLAY 
               THE-NUMBER 
               A-SPACE 
               THE-MESSAGE.

      * Set up and display line 3
           ADD 1 TO THE-NUMBER.
           MOVE "Jack jump over the candlestick." TO THE-MESSAGE.
           DISPLAY 
               THE-NUMBER 
               A-SPACE 
               THE-MESSAGE.

       PROGRAM-DONE.
           STOP RUN.
