       IDENTIFICATION DIVISION.
       PROGRAM-ID. VNDREC01.
      *------------------------------------------------------------
      * Display vendor number and
      * name in order.
      *------------------------------------------------------------
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROl.

           SELECT VENDOR-FILE
               ASSIGN TO "vendor"
               ORGANIZATION IS INDEXED
               RECORD KEY IS VENDOR-NUMBER
               ACCESS MODE IS DYNAMIC.
           
       DATA DIVISION.
       FILE SECTION.

       FD  VENDOR-FILE
           LABEL RECORDS ARE STANDARD.
       01  VENDOR-RECORD.
           05 VENDOR-NUMBER                           PIC 9(5).
           05 VENDOR-NAME                             PIC 9(30).
           05 VENDOR-ADDRESS-1                        PIC 9(30).
           05 VENDOR-ADDRESS-2                        PIC 9(30).
           05 VENDOR-CITY                             PIC 9(20).
           05 VENDOR-STATE                            PIC 9(2).
           05 VENDOR-ZIP                              PIC 9(10).
           05 VENDOR-CONTACT                          PIC 9(30).
           05 VENDOR-PHONE                            PIC 9(15).

       WORKING-STORAGE SECTION.

       77  FILE-AT-END                 PIC X.
      
       PROCEDURE DIVISION.
       PROGRAM-BEGIN.

           PERFORM OPENING-PROCEDURE.
       
           MOVE "N" TO FILE-AT-END.
           PERFORM READ-NEXT-RECORD.
           IF FILE-AT-END = "Y"
               DISPLAY "NO RECORDS FOUND"
           ELSE
               PERFORM DISPLAY-VENDOR-FIELDS
                   UNTIL FILE-AT-END = "Y".

           PERFORM CLOSING-PROCEDURE.


       PROGRAM-DONE.
           STOP RUN.

       OPENING-PROCEDURE.
           OPEN I-O VENDOR-FILE.
      
       CLOSING-PROCEDURE.
           CLOSE VENDOR-FILE.

       DISPLAY-VENDOR-FIELDS.
           DISPLAY "NO: " VENDOR-NUMBER
                   " NAME: " VENDOR-NAME.

           PERFORM READ-NEXT-RECORD.

       READ-NEXT-RECORD.
           READ VENDOR-FILE NEXT RECORD
               AT END MOVE "Y" TO FILE-AT-END.

