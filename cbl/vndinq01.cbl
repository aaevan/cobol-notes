       IDENTIFICATION DIVISION.
       PROGRAM-ID. VNDINQ01.
      *------------------------------------------
      * Look up records in vendor file
      *------------------------------------------
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           
           COPY "slvnd01.cbl".

       DATA DIVISION.
       FILE SECTION.

           COPY "fdvnd02.cbl".

       WORKING-STORAGE SECTION.

      *77  OK-TO-DELETE        PIC X.
      *88 IS-Y-OR-N        VALUES "Y" "N".
       77  RECORD-FOUND        PIC X.

       77  VENDOR-NUMBER-FIELD PIC Z(5).

       PROCEDURE DIVISION.
       PROGRAM-BEGIN.
           OPEN I-O VENDOR-FILE.
           PERFORM GET-VENDOR-RECORD.
           PERFORM INQUIRE-RECORDS
               UNTIL VENDOR-NUMBER = ZEROES.
           CLOSE VENDOR-FILE.

       PROGRAM-DONE.
           STOP RUN.

      *------------------------------------------
      * TO GET A VENDOR RECORD, ASK FOR
      * VENDOR NUMBER. AND THEN TRY TO
      * READ THE RECORD.
      *------------------------------------------
       GET-VENDOR-RECORD.
           PERFORM INIT-VENDOR-RECORD.
           PERFORM ENTER-VENDOR-NUMBER.
           MOVE "N" TO RECORD-FOUND.
           PERFORM FIND-VENDOR-RECORD
               UNTIL RECORD-FOUND = "Y" OR
                   VENDOR-NUMBER = ZEROES.

       INIT-VENDOR-RECORD.
           MOVE SPACE TO VENDOR-RECORD.
           MOVE ZEROES TO VENDOR-NUMBER.

       ENTER-VENDOR-NUMBER.
           DISPLAY " ".
           DISPLAY "ENTER VENDOR NUMBER OF THE VENDOR" .
           DISPLAY "TO DELETE (1-99999)".
           DISPLAY "ENTER 0 TO STOP ENTRY".
           ACCEPT VENDOR-NUMBER-FIELD.
           MOVE VENDOR-NUMBER-FIELD TO VENDOR-NUMBER.

       FIND-VENDOR-RECORD.
           PERFORM READ-VENDOR-RECORD.
           IF RECORD-FOUND = "N"
               DISPLAY "RECORD NOT FOUND"
               PERFORM ENTER-VENDOR-NUMBER.

       READ-VENDOR-RECORD.
           MOVE "Y" TO RECORD-FOUND.
           READ VENDOR-FILE RECORD
             INVALID KEY
               MOVE "N" TO RECORD-FOUND.
      
       INQUIRE-RECORDS.
           PERFORM DISPLAY-ALL-FIELDS.

           PERFORM GET-VENDOR-RECORD.

      *------------------------------------------
      * DISPLAY ALL FIELDS WITH BLANK
      * LINES ABOVE AND BELOW.
      *------------------------------------------
       DISPLAY-ALL-FIELDS.
           DISPLAY " ".
           PERFORM DISPLAY-VENDOR-CHOICES.
           DISPLAY " ".

       DISPLAY-VENDOR-CHOICES.
           DISPLAY "   VENDOR-NUMBER: " VENDOR-NUMBER.
           DISPLAY "1. VENDOR-NAME: " VENDOR-NAME.
           DISPLAY "2. VENDOR-ADDRESS-1: " VENDOR-ADDRESS-1
           DISPLAY "3. VENDOR-ADDRESS-2: " VENDOR-ADDRESS-2
           DISPLAY "4. VENDOR-CITY: " VENDOR-CITY.
           DISPLAY "5. VENDOR-STATE: " VENDOR-STATE.
           DISPLAY "6. VENDOR-ZIP: " VENDOR-ZIP.
           DISPLAY "7. VENDOR-CONTACT: " VENDOR-CONTACT.
           DISPLAY "8. VENDOR-PHONE:: " VENDOR-PHONE.
