       IDENTIFICATION DIVISION.
       PROGRAM-ID. YNM02.
      *------------------------------------------------------------
      * This program ask for a Y or N answer, and then
      * displays whther the user chose yes or no.
      * The edit logic allows for entry of Y, y, N or n.
      *------------------------------------------------------------
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 ANSWER    PIC X.

       PROCEDURE DIVISION.
       PROGRAM-BEGIN.

           PERFORM GET-THE-ANSWER.

           PERFORM EDIT-THE-ANSWER

           PERFORM DISPLAY-THE-ANSWER.
       
       PROGRAM-DONE.
           STOP RUN.

       GET-THE-ANSWER.

           DISPLAY "Is the answer Yes, No or Maybe? (Y/N/M)".
           ACCEPT ANSWER.

       EDIT-THE-ANSWER.

           IF ANSWER = "y"
               MOVE "Y" TO ANSWER.
           IF ANSWER = "n"
               MOVE "N" TO ANSWER.
           IF ANSWER = "m"
               MOVE "M" TO ANSWER.

       DISPLAY-THE-ANSWER.
           IF ANSWER = "Y"
               PERFORM IT-IS-VALID
               DISPLAY "You answered Yes.".

           IF ANSWER = "N"
               PERFORM IT-IS-VALID
               DISPLAY "You answered No.".

           IF ANSWER = "M"
               PERFORM IT-IS-VALID
               DISPLAY "You answered Maybe.".

       IT-IS-VALID.
           DISPLAY "Your answer is valid and".

