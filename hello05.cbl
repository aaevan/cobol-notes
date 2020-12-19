       IDENTIFICATION DIVISION.
       PROGRAM-ID. HELLO04.

      * This program illustrates the use of a Perform

       ENVIRONMENT DIVISION.
       DATA DIVISION.
       PROCEDURE DIVISION.

       PROGRAM-BEGIN.
           DISPLAY "Today's message is:".
           PERFORM SAY-HELLO.

       SAY-HELLO.
           DISPLAY "Hello world".

       PROGRAM-DONE.
           STOP RUN.


