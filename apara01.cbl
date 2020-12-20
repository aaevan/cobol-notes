       IDENTIFICATION DIVISION.
       PROGRAM-ID. APARA01.
       ENVIRONMENT DIVISION.
       DATA DIVISION.

       WORKING-STORAGE SECTION.
       01 REPEAT-COUNT            PIC 9(3).
       01 THE-COUNT               PIC 9(3).

       PROCEDURE DIVISION.
       PROGRAM-BEGIN.
           DISPLAY "ROUND ONE:"
           PERFORM PROGRAM-INIT 8 TIMES.
           MOVE 0 TO REPEAT-COUNT.
           DISPLAY "ROUND TWO:"
           PERFORM PROGRAM-INIT 
                VARYING THE-COUNT FROM 1 BY 1 
                UNTIL THE-COUNT > 8.
       
       PROGRAM-DONE.
           STOP RUN.

       PROGRAM-INIT.
           DISPLAY "INSIDE PROGRAM-INIT".
           ADD 1 TO REPEAT-COUNT.
           DISPLAY "REPEAT-COUNT: " REPEAT-COUNT.
