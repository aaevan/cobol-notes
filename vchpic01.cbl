000100 IDENTIFICATION DIVISION.
000200 PROGRAM-ID. VCHPIC01.
000300*--------------------------------
000400* Change only.
000500* Allows the user to change
000600* the VOUCHER-SELECTED flag
000700* for unpaid vouchers
000800*--------------------------------
000900 ENVIRONMENT DIVISION.
001000 INPUT-OUTPUT SECTION.
001100 FILE-CONTROL.
001200
001300     COPY "slvnd02.cbl".
001400
001500     COPY "slvouch.cbl".
001600
001700     COPY "slcontrl.cbl".
001800
001900 DATA DIVISION.
002000 FILE SECTION.
002100
002200     COPY "fdvnd04.cbl".
002300
002400     COPY "fdvouch.cbl".
002500
002600     COPY "fdcontrl.cbl".
002700
002800 WORKING-STORAGE SECTION.
002900
003000 77  MENU-PICK                    PIC 9.
003100     88  MENU-PICK-IS-VALID       VALUES 0 THRU 4.
003200
003300 77  WHICH-FIELD                  PIC 9.
003400 77  VOUCHER-RECORD-FOUND         PIC X.
003500 77  VENDOR-RECORD-FOUND          PIC X.
003600
003700 77  VOUCHER-NUMBER-FIELD         PIC Z(5).
003800 77  VOUCHER-AMOUNT-FIELD         PIC ZZZ,ZZ9.99-.
003900 77  VOUCHER-PAID-AMOUNT-FIELD    PIC ZZZ,ZZ9.99-.
004000
004100 77  ERROR-MESSAGE                PIC X(79) VALUE SPACE.
004200
004300     COPY "wscase01.cbl".
004400
004500     COPY "wsdate01.cbl".
004600
004700 PROCEDURE DIVISION.
004800 PROGRAM-BEGIN.
004900     PERFORM OPENING-PROCEDURE.
005000     PERFORM MAIN-PROCESS.
005100     PERFORM CLOSING-PROCEDURE.
005200
005300 PROGRAM-EXIT.
005400     EXIT PROGRAM.
005500
005600 PROGRAM-DONE.
005700     STOP RUN.
005800
005900 OPENING-PROCEDURE.
006000     OPEN I-O VOUCHER-FILE.
006100     OPEN I-O VENDOR-FILE.
006200
006300 CLOSING-PROCEDURE.
006400     CLOSE VOUCHER-FILE.
006500     CLOSE VENDOR-FILE.
006600
006700 MAIN-PROCESS.
006800     PERFORM CHANGE-MODE.
006900
007000*--------------------------------
007100* CHANGE
007200*--------------------------------
007300 CHANGE-MODE.
007400     PERFORM GET-EXISTING-RECORD.
007500     PERFORM CHANGE-RECORDS
007600        UNTIL VOUCHER-NUMBER = ZEROES.
007700
007800 CHANGE-RECORDS.
007900     PERFORM GET-FIELD-TO-CHANGE.
008000     IF VOUCHER-PAID-DATE = ZEROES
008100         PERFORM CHANGE-ONE-FIELD.
008200     PERFORM GET-EXISTING-RECORD.
008300
008400 GET-FIELD-TO-CHANGE.
008500     PERFORM DISPLAY-ALL-FIELDS.
008600     PERFORM ASK-WHICH-FIELD.
008700
008800 ASK-WHICH-FIELD.
008900     MOVE 1 TO WHICH-FIELD.
009000
009100 CHANGE-ONE-FIELD.
009200     PERFORM CHANGE-THIS-FIELD.
009300
009400 CHANGE-THIS-FIELD.
009500     IF WHICH-FIELD = 1
009600         PERFORM ENTER-VOUCHER-SELECTED.
009700
009800     PERFORM REWRITE-VOUCHER-RECORD.
009900
010000*--------------------------------
010100* Routines shared by all modes
010200*--------------------------------
010300 INIT-VOUCHER-RECORD.
010400     MOVE SPACE TO VOUCHER-INVOICE
010500                   VOUCHER-FOR
010600                   VOUCHER-DEDUCTIBLE
010700                   VOUCHER-SELECTED.
010800     MOVE ZEROES TO VOUCHER-NUMBER
010900                    VOUCHER-VENDOR
011000                    VOUCHER-AMOUNT
011100                    VOUCHER-DATE
011200                    VOUCHER-DUE
011300                    VOUCHER-PAID-AMOUNT
011400                    VOUCHER-PAID-DATE
011500                    VOUCHER-CHECK-NO.
011600
011700*--------------------------------
011800* Routines shared Add and Change
011900*--------------------------------
012000 ENTER-VOUCHER-SELECTED.
012100     PERFORM ACCEPT-VOUCHER-SELECTED.
012200     PERFORM RE-ACCEPT-VOUCHER-SELECTED
012300         UNTIL VOUCHER-SELECTED = "Y" OR "N".
012400
012500 ACCEPT-VOUCHER-SELECTED.
012600     DISPLAY "SELECT THIS VOUCHER (Y/N)?".
012700     ACCEPT VOUCHER-SELECTED.
012800
012900     INSPECT VOUCHER-SELECTED
013000        CONVERTING LOWER-ALPHA
013100        TO UPPER-ALPHA.
013200
013300 RE-ACCEPT-VOUCHER-SELECTED.
013400     DISPLAY "YOU MUST ENTER YES OR NO".
013500     PERFORM ACCEPT-VOUCHER-SELECTED.
013600
013700*--------------------------------
013800* Routines shared by Change,
013900* Inquire and Delete
014000*--------------------------------
014100 GET-EXISTING-RECORD.
014200     PERFORM ACCEPT-EXISTING-KEY.
014300     PERFORM RE-ACCEPT-EXISTING-KEY
014400         UNTIL VOUCHER-RECORD-FOUND = "Y" OR
014500               VOUCHER-NUMBER = ZEROES.
014600
014700 ACCEPT-EXISTING-KEY.
014800     PERFORM INIT-VOUCHER-RECORD.
014900     PERFORM ENTER-VOUCHER-NUMBER.
015000     IF VOUCHER-NUMBER NOT = ZEROES
015100         PERFORM READ-VOUCHER-RECORD.
015200
015300 RE-ACCEPT-EXISTING-KEY.
015400     DISPLAY "RECORD NOT FOUND".
015500     PERFORM ACCEPT-EXISTING-KEY.
015600
015700 ENTER-VOUCHER-NUMBER.
015800     DISPLAY "ENTER VOUCHER NUMBER TO SELECT OR CLEAR ".
015900     ACCEPT VOUCHER-NUMBER.
016000
016100 DISPLAY-ALL-FIELDS.
016200     DISPLAY " ".
016300     IF VOUCHER-PAID-DATE NOT = ZEROES
016400         DISPLAY " !!! THIS VOUCHER IS ALREADY PAID !!!".
016500     PERFORM DISPLAY-VOUCHER-NUMBER.
016600     PERFORM DISPLAY-VOUCHER-VENDOR.
016700     PERFORM DISPLAY-VOUCHER-INVOICE.
016800     PERFORM DISPLAY-VOUCHER-FOR.
016900     PERFORM DISPLAY-VOUCHER-AMOUNT.
017000     PERFORM DISPLAY-VOUCHER-DATE.
017100     PERFORM DISPLAY-VOUCHER-DUE.
017200     PERFORM DISPLAY-VOUCHER-DEDUCTIBLE.
017300     IF VOUCHER-PAID-DATE = ZEROES
017400         PERFORM DISPLAY-VOUCHER-SELECTED.
017500     IF VOUCHER-PAID-DATE NOT = ZEROES
017600         PERFORM DISPLAY-VOUCHER-PAID-AMOUNT
017700         PERFORM DISPLAY-VOUCHER-PAID-DATE
017800         PERFORM DISPLAY-VOUCHER-CHECK-NO.
017900     DISPLAY " ".
018000
018100 DISPLAY-VOUCHER-NUMBER.
018200     DISPLAY "   VOUCHER NUMBER: " VOUCHER-NUMBER.
018300
018400 DISPLAY-VOUCHER-VENDOR.
018500     PERFORM VOUCHER-VENDOR-ON-FILE.
018600     IF VENDOR-RECORD-FOUND = "N"
018700         MOVE "**Not found**" TO VENDOR-NAME.
018800     DISPLAY "   VENDOR: "
018900             VOUCHER-VENDOR " "
019000             VENDOR-NAME.
019100
019200 VOUCHER-VENDOR-ON-FILE.
019300     MOVE VOUCHER-VENDOR TO VENDOR-NUMBER.
019400     PERFORM READ-VENDOR-RECORD.
019500     IF VENDOR-RECORD-FOUND = "N"
019600         MOVE "VENDOR NOT ON FILE"
019700           TO ERROR-MESSAGE.
019800
019900 DISPLAY-VOUCHER-INVOICE.
020000     DISPLAY "   INVOICE: " VOUCHER-INVOICE.
020100
020200 DISPLAY-VOUCHER-FOR.
020300     DISPLAY "   FOR: " VOUCHER-FOR.
020400
020500 DISPLAY-VOUCHER-AMOUNT.
020600     MOVE VOUCHER-AMOUNT TO VOUCHER-AMOUNT-FIELD.
020700     DISPLAY "   AMOUNT: " VOUCHER-AMOUNT-FIELD.
020800
020900 DISPLAY-VOUCHER-DATE.
021000     MOVE VOUCHER-DATE TO DATE-CCYYMMDD.
021100     PERFORM FORMAT-THE-DATE.
021200     DISPLAY "   INVOICE DATE: " FORMATTED-DATE.
021300
021400 DISPLAY-VOUCHER-DUE.
021500     MOVE VOUCHER-DUE TO DATE-CCYYMMDD.
021600     PERFORM FORMAT-THE-DATE.
021700     DISPLAY "   DUE DATE: " FORMATTED-DATE.
021800
021900 DISPLAY-VOUCHER-DEDUCTIBLE.
022000     DISPLAY "   DEDUCTIBLE: " VOUCHER-DEDUCTIBLE.
022100
022200 DISPLAY-VOUCHER-SELECTED.
022300     DISPLAY "1. SELECTED FOR PAYMENT: " VOUCHER-SELECTED.
022400
022500 DISPLAY-VOUCHER-PAID-AMOUNT.
022600     MOVE VOUCHER-PAID-AMOUNT TO VOUCHER-PAID-AMOUNT-FIELD.
022700     DISPLAY "   PAID: " VOUCHER-PAID-AMOUNT-FIELD.
022800
022900 DISPLAY-VOUCHER-PAID-DATE.
023000     MOVE VOUCHER-PAID-DATE TO DATE-CCYYMMDD.
023100     PERFORM FORMAT-THE-DATE.
023200     DISPLAY "   PAID ON: " FORMATTED-DATE.
023300
023400 DISPLAY-VOUCHER-CHECK-NO.
023500     DISPLAY "   CHECK: " VOUCHER-CHECK-NO.
023600
023700*--------------------------------
023800* File I-O Routines
023900*--------------------------------
024000 READ-VOUCHER-RECORD.
024100     MOVE "Y" TO VOUCHER-RECORD-FOUND.
024200     READ VOUCHER-FILE RECORD
024300       INVALID KEY
024400          MOVE "N" TO VOUCHER-RECORD-FOUND.
024500
024600*or  READ VOUCHER-FILE RECORD WITH LOCK
024700*      INVALID KEY
024800*         MOVE "N" TO VOUCHER-RECORD-FOUND.
024900
025000*or  READ VOUCHER-FILE RECORD WITH HOLD
025100*      INVALID KEY
025200*         MOVE "N" TO VOUCHER-RECORD-FOUND.
025300
025400 REWRITE-VOUCHER-RECORD.
025500     REWRITE VOUCHER-RECORD
025600         INVALID KEY
025700         DISPLAY "ERROR REWRITING VENDOR RECORD".
025800
025900 READ-VENDOR-RECORD.
026000     MOVE "Y" TO VENDOR-RECORD-FOUND.
026100     READ VENDOR-FILE RECORD
026200       INVALID KEY
026300          MOVE "N" TO VENDOR-RECORD-FOUND.
026400
026500     COPY "pldate01.cbl".
026600

