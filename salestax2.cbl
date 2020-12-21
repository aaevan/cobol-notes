      *-------------------------------
      * Asks the user for sales amounts and sales tax rates and
      * uses these values to calculate the sales tax on the amount.
      *-------------------------------
       
       IDENTIFICATION DIVISION.
       PROGRAM-ID. SALESTAX.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  YES-NO                  PIC X VALUE "Y".
       01  SALES-TAX               PIC 999V999.
       01  VALUE-INPUT             PIC Z(9).ZZ.
       01  SALE-AMOUNT             PIC 999999V99.
       01  TOTAL-COST              PIC 9999999V99 VALUE 1.00.
       01  DISPLAY-VALUE           PIC ZZZ,ZZ9.99.

       01  IS-VALID                PIC X.

       PROCEDURE DIVISION.
       PROGRAM-BEGIN.
           PERFORM GET-SALES-TAX.
           PERFORM CALC-ITEM-VALUE UNTIL YES-NO = "N".
       PROGRAM-DONE.
           STOP RUN.

       CALC-ITEM-VALUE.
           PERFORM GET-SALE-AMOUNT.
           PERFORM CALCULATE-TOTAL-COST.
           DISPLAY "YES-NO is ... " YES-NO.
           PERFORM GO-AGAIN.

       GET-SALES-TAX.
           MOVE "N" TO IS-VALID.
           PERFORM SALES-TAX-INPUT 
               UNTIL IS-VALID = "Y".

       SALES-TAX-INPUT.
           DISPLAY "What's the sales tax? (.01% to 99.99%)".
           ACCEPT VALUE-INPUT.
           MOVE VALUE-INPUT TO SALES-TAX.
           IF SALES-TAX < 0.01 OR SALES-TAX > 99.99
               DISPLAY "INVALID INPUT: " SALES-TAX
           ELSE
               MOVE "Y" TO IS-VALID.

       GET-SALE-AMOUNT.
           MOVE "N" TO IS-VALID.
           PERFORM SALE-AMOUNT-INPUT
               UNTIL IS-VALID = "Y".

       SALE-AMOUNT-INPUT.
           DISPLAY "What's the sale price? (.01 to 999999.99)".
           ACCEPT VALUE-INPUT.
           MOVE VALUE-INPUT TO SALE-AMOUNT.
           IF SALE-AMOUNT < 0.01 OR SALE-AMOUNT > 999999.99
               DISPLAY "INVALID INPUT: " VALUE-INPUT
           ELSE
               MOVE "Y" TO IS-VALID.

       CALCULATE-TOTAL-COST.
           DISPLAY "Given an item price of " SALE-AMOUNT 
                   " and a sales tax of " SALES-TAX.
           COMPUTE TOTAL-COST = SALE-AMOUNT * (1 + SALES-TAX).
           MOVE TOTAL-COST TO DISPLAY-VALUE.
           DISPLAY "... our total price is: " DISPLAY-VALUE.
       
       GO-AGAIN.
           DISPLAY "GO AGAIN?".
           ACCEPT YES-NO.
           IF YES-NO = "y"
               MOVE "Y" TO YES-NO.
           IF YES-NO NOT = "Y"
               MOVE "N" TO YES-NO.
