       IDENTIFICATION DIVISION.
       PROGRAM-ID. ADD01RED.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       
       WORKING-STORAGE SECTION.
       
       01 FIRST-NUMBER       PICTURE IS 99.
       01 SECOND-NUMBER      PICTURE IS 99.
       01 THE-RESULT         PICTURE IS 999.

       PROCEDURE DIVISION.

       PROGRAM-BEGIN.

           PERFORM GET-INPUTS.
           PERFORM COMPUTE-RESULTS.

       PROGRAM-DONE.
           STOP RUN.

       GET-INPUTS.
           DISPLAY "ADD01.cbl: adds two user entered numbers."
           DISPLAY "Enter the first number.".
           ACCEPT FIRST-NUMBER.
           DISPLAY "Enter the second number.".
           ACCEPT SECOND-NUMBER.

       COMPUTE-RESULTS.
           COMPUTE THE-RESULT = FIRST-NUMBER + SECOND-NUMBER.
           DISPLAY "The result is: " THE-RESULT.


