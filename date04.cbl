       IDENTIFICATION DIVISION.
       PROGRAM-ID. DATE04.
      *--------------------------------
      * Demo of Date Entry and validation
      *--------------------------------
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
      
       DATA DIVISION.
       FILE SECTION.
      
       WORKING-STORAGE SECTION.
      
           COPY "wsdate.cbl".
      
       PROCEDURE DIVISION.
       PROGRAM-BEGIN.
           PERFORM OPENING-PROCEDURE.
           PERFORM MAIN-PROCESS.
           PERFORM CLOSING-PROCEDURE.
      
       PROGRAM-EXIT.
           EXIT PROGRAM.
      
       PROGRAM-DONE.
           STOP RUN.
      
       OPENING-PROCEDURE.
      
       CLOSING-PROCEDURE.
      
       MAIN-PROCESS.
           PERFORM GET-A-DATE.
           PERFORM DISPLAY-AND-GET-DATE
               UNTIL DATE-MMDDCCYY = ZEROES.
      
           COPY "pldate.cbl".
      
       DISPLAY-AND-GET-DATE.
           PERFORM DISPLAY-A-DATE.
           PERFORM GET-A-DATE.
      
       DISPLAY-A-DATE.
           MOVE DATE-MMDDCCYY TO DATE-ENTRY-FIELD.
           DISPLAY "FORMATTED DATE IS " DATE-ENTRY-FIELD.
           DISPLAY "DATE-MMDDCCYY IS " DATE-MMDDCCYY.
           DISPLAY "DATE-CCYYMMDD IS " DATE-CCYYMMDD.
      
