       IDENTIFICATION DIVISION.
       PROGRAM-ID. MULT08.
      *--------------------------
      * This program asks the user for a number for a
      * multiplication vable, and a table size
      * and then displays a table for that number
      * times the value 1 through HOW-MANY.
      *
      * The display is paused after each 15 lines.
      *--------------------------
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       
       01  THE-TABLE           PIC 99.
       01  THE-ENTRY           PIC 999.
       01  THE-PRODUCT         PIC 9999.
       01  HOW-MANY-ENTRIES    PIC 99.
       01  SCREEN-LINES        PIC 99.

       01  A-DUMMY             PIC X.

       01  YES-NO              PIC X VALUE "Y".

       PROCEDURE DIVISION.

       PROGRAM-BEGIN.
      *    MOVE "Y" to YES-NO.
           PERFORM DISPLAY-ONE-TABLE
      *        UNTIL YES-NO = "N".

       PROGRAM-DONE.
           STOP RUN.

       DISPLAY-ONE-TABLE.
           PERFORM GET-WHICH-TABLE.
           PERFORM DISPLAY-THE-TABLE.
           PERFORM GO-AGAIN.

       GET-WHICH-TABLE.
           DISPLAY
            "Which multiplication table (01-99)?".
           ACCEPT THE-TABLE.

       DISPLAY-THE-TABLE.
           PERFORM GET-HOW-MANY-ENTRIES.

           MOVE 0 TO SCREEN-LINES.

           PERFORM DISPLAY-ONE-ENTRY
               VARYING THE-ENTRY
                 FROM 1 BY 1
                 UNTIL THE-ENTRY > HOW-MANY-ENTRIES.

      *GO-AGAIN.
      *    DISPLAY "Go Again (Y/N)?".
      *    ACCEPT YES-NO.
      *    IF YES-NO = "y"
      *        MOVE "Y" to YES-NO.
      *    IF YES-NO NOT = "Y"
      *        MOVE "N" to YES-NO.

       GET-HOW-MANY-ENTRIES.
           DISPLAY
            "How many entries would you like (01-99)?".
           ACCEPT HOW-MANY-ENTRIES.

       DISPLAY-ONE-ENTRY.

           IF SCREEN-LINES = 15
               PERFORM PRESS-ENTER
           COMPUTE THE-PRODUCT = THE-TABLE * THE-ENTRY.
           DISPLAY
               THE-TABLE " * " THE-ENTRY " = " THE-PRODUCT.

           ADD 1 TO SCREEN-LINES.

       PRESS-ENTER.
           DISPLAY "Press ENTER to continue . . .".
           ACCEPT A-DUMMY.
           MOVE 0 to SCREEN-LINES.
