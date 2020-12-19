       IDENTIFICATION DIVISION.
       PROGRAM-ID. ADD01.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       
       WORKING-STORAGE SECTION.
       
       01 FIRST-NUMBER       PICTURE IS 99.
       01 SECOND-NUMBER      PICTURE IS 99.
       01 THIRD-NUMBER      PICTURE IS 99.
       01 THE-RESULT         PICTURE IS 999.

       PROCEDURE DIVISION.

       PROGRAM-BEGIN.
       STEP-01.
           DISPLAY "This program will add 2 numbers.".

       STEP-02.
           DISPLAY "Enter the first number.".
           ACCEPT FIRST-NUMBER.

       STEP-03.
           DISPLAY "Enter the second number.".
           ACCEPT SECOND-NUMBER.

       STEP-04.
           DISPLAY "Enter the third number.".

           ACCEPT THIRD-NUMBER.

       STEP-05.
           COMPUTE THE-RESULT = 
               FIRST-NUMBER + 
               SECOND-NUMBER +
               THIRD-NUMBER.

           DISPLAY "The result is:".
           DISPLAY THE-RESULT.

       PROGRAM-DONE.
           STOP RUN.

