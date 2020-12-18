       IDENTIFICATION DIVISION.
       PROGRAM-ID. ADD01.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       
       WORKING-STORAGE SECTION.
       
       01 FIRST-NUMBER       PICTURE IS 99.
       01 SECOND-NUMBER      PICTURE IS 99.
       01 THE-RESULT         PICTURE IS 999.

       PROCEDURE DIVISION.

       PROGRAM-BEGIN.
           DISPLAY "ADD01.cbl: adds two user entered numbers."
           DISPLAY "Enter the first number.".

           ACCEPT FIRST-NUMBER.

           DISPLAY "Enter the second number.".

           ACCEPT SECOND-NUMBER.

           COMPUTE THE-RESULT = FIRST-NUMBER + SECOND-NUMBER.

           DISPLAY "The result is: " THE-RESULT.

       PROGRAM-DONE.
           STOP RUN.

