000100 IDENTIFICATION DIVISION.
000200 PROGRAM-ID. VCHMNT01.
000300*--------------------------------
000400* Add, Change, Inquire and Delete
000500* for the Voucher File.
000600* All fields are displayed, but
000700* SELECTED, PAID-AMOUNT, PAID-DATE and
000800* CHECK-NO are not modifiable
000900*--------------------------------
001000 ENVIRONMENT DIVISION.
001100 INPUT-OUTPUT SECTION.
001200 FILE-CONTROL.
001300
001400     COPY "slvnd02.cbl".
001500
001600     COPY "slvouch.cbl".
001700
001800     COPY "slcontrl.cbl".
001900
002000 DATA DIVISION.
002100 FILE SECTION.
002200
002300     COPY "fdvnd04.cbl".
002400
002500     COPY "fdvouch.cbl".
002600
002700     COPY "fdcontrl.cbl".
002800
002900 WORKING-STORAGE SECTION.
003000
003100 77  MENU-PICK                    PIC 9.
003200     88  MENU-PICK-IS-VALID       VALUES 0 THRU 4.
003300
003400 77  THE-MODE                     PIC X(7).
003500 77  WHICH-FIELD                  PIC 9.
003600 77  OK-TO-DELETE                 PIC X.
003700 77  VOUCHER-RECORD-FOUND         PIC X.
003800 77  CONTROL-RECORD-FOUND         PIC X.
003900 77  VENDOR-RECORD-FOUND          PIC X.
004000 77  A-DUMMY                      PIC X.
004100 77  ADD-ANOTHER                  PIC X.
004200
004300 77  VOUCHER-NUMBER-FIELD         PIC Z(5).
004400 77  VOUCHER-AMOUNT-FIELD         PIC ZZZ,ZZ9.99-.
004500 77  VOUCHER-PAID-AMOUNT-FIELD    PIC ZZZ,ZZ9.99-.
004600
004700 77  ERROR-MESSAGE                PIC X(79) VALUE SPACE.
004800
004900     COPY "wscase01.cbl".
005000
005100     COPY "wsdate01.cbl".

       77  MMDD                         PIC 9(4).
       77  CCYY                         PIC 9(4).
005200
005300 PROCEDURE DIVISION.
005400 PROGRAM-BEGIN.
005500     PERFORM OPENING-PROCEDURE.
005600     PERFORM MAIN-PROCESS.
005700     PERFORM CLOSING-PROCEDURE.
005800
005900 PROGRAM-EXIT.
006000     EXIT PROGRAM.
006100
006200 PROGRAM-DONE.
006300     STOP RUN.
006400
006500 OPENING-PROCEDURE.
006600     OPEN I-O VOUCHER-FILE.
006700     OPEN I-O VENDOR-FILE.
006800     OPEN I-O CONTROL-FILE.
006900
007000 CLOSING-PROCEDURE.
007100     CLOSE VOUCHER-FILE.
007200     CLOSE VENDOR-FILE.
007300     CLOSE CONTROL-FILE.
007400
007500 MAIN-PROCESS.
007600     PERFORM GET-MENU-PICK.
007700     PERFORM MAINTAIN-THE-FILE
007800         UNTIL MENU-PICK = 0.
007900
008000*--------------------------------
008100* MENU
008200*--------------------------------
008300 GET-MENU-PICK.
008400     PERFORM DISPLAY-THE-MENU.
008500     PERFORM ACCEPT-MENU-PICK.
008600     PERFORM RE-ACCEPT-MENU-PICK
008700         UNTIL MENU-PICK-IS-VALID.
008800
008900 DISPLAY-THE-MENU.
009000     PERFORM CLEAR-SCREEN.
009100     DISPLAY "    PLEASE SELECT:".
009200     DISPLAY " ".
009300     DISPLAY "          1.  ADD RECORDS".
009400     DISPLAY "          2.  CHANGE A RECORD".
009500     DISPLAY "          3.  LOOK UP A RECORD".
009600     DISPLAY "          4.  DELETE A RECORD".
009700     DISPLAY " ".
009800     DISPLAY "          0.  EXIT".
009900     PERFORM SCROLL-LINE 8 TIMES.
010000
010100 ACCEPT-MENU-PICK.
010200     DISPLAY "YOUR CHOICE (0-4)?".
010300     ACCEPT MENU-PICK.
010400
010500 RE-ACCEPT-MENU-PICK.
010600     DISPLAY "INVALID SELECTION - PLEASE RE-TRY.".
010700     PERFORM ACCEPT-MENU-PICK.
010800
010900 CLEAR-SCREEN.
011000     PERFORM SCROLL-LINE 25 TIMES.
011100
011200 SCROLL-LINE.
011300     DISPLAY " ".
011400
011500 MAINTAIN-THE-FILE.
011600     PERFORM DO-THE-PICK.
011700     PERFORM GET-MENU-PICK.
011800
011900 DO-THE-PICK.
012000     IF MENU-PICK = 1
012100         PERFORM ADD-MODE
012200     ELSE
012300     IF MENU-PICK = 2
012400         PERFORM CHANGE-MODE
012500     ELSE
012600     IF MENU-PICK = 3
012700         PERFORM INQUIRE-MODE
012800     ELSE
012900     IF MENU-PICK = 4
013000         PERFORM DELETE-MODE.
013100
013200*--------------------------------
013300* ADD
013400*--------------------------------
013500 ADD-MODE.
013600     MOVE "ADD" TO THE-MODE.
013700     MOVE "Y" TO ADD-ANOTHER.
013800     PERFORM GET-NEW-RECORD-KEY.
013900     PERFORM ADD-RECORDS
014000        UNTIL ADD-ANOTHER = "N".
014100
014200 GET-NEW-RECORD-KEY.
014300     PERFORM ACCEPT-NEW-RECORD-KEY.
014400     PERFORM RE-ACCEPT-NEW-RECORD-KEY
014500         UNTIL VOUCHER-RECORD-FOUND = "N".
014600
014700     PERFORM DISPLAY-VOUCHER-NUMBER.
014800
014900 ACCEPT-NEW-RECORD-KEY.
015000     PERFORM INIT-VOUCHER-RECORD.
015100     PERFORM RETRIEVE-NEXT-VOUCHER-NUMBER.
015200
015300     PERFORM READ-VOUCHER-RECORD.
015400
015500 RE-ACCEPT-NEW-RECORD-KEY.
015600     PERFORM ACCEPT-NEW-RECORD-KEY.
015700
015800 RETRIEVE-NEXT-VOUCHER-NUMBER.
015900     PERFORM READ-CONTROL-RECORD.
016000     ADD 1 TO CONTROL-LAST-VOUCHER.
016100     MOVE CONTROL-LAST-VOUCHER TO VOUCHER-NUMBER.
016200     PERFORM REWRITE-CONTROL-RECORD.
016300
016400 ADD-RECORDS.
016500     PERFORM ENTER-REMAINING-FIELDS.
016600     PERFORM WRITE-VOUCHER-RECORD.
016700     PERFORM GET-ADD-ANOTHER.
016800
016900 GET-ADD-ANOTHER.
017000     PERFORM ACCEPT-ADD-ANOTHER.
017100     PERFORM RE-ACCEPT-ADD-ANOTHER
017200        UNTIL ADD-ANOTHER = "Y" OR "N".
017300
017400 ACCEPT-ADD-ANOTHER.
017500     DISPLAY "ADD ANOTHER VOUCHER(Y/N)?".
017600     ACCEPT ADD-ANOTHER.
017700
017800     INSPECT ADD-ANOTHER
017900         CONVERTING LOWER-ALPHA
018000         TO         UPPER-ALPHA.
018100
018200     IF ADD-ANOTHER = "Y"
018300         PERFORM GET-NEW-RECORD-KEY.
018400
018500 RE-ACCEPT-ADD-ANOTHER.
018600     DISPLAY "YOU MUST ENTER YES OR NO".
018700     PERFORM ACCEPT-ADD-ANOTHER.
018800
018900 ENTER-REMAINING-FIELDS.
019000     PERFORM ENTER-VOUCHER-VENDOR.
019100     PERFORM ENTER-VOUCHER-INVOICE.
019200     PERFORM ENTER-VOUCHER-FOR.
019300     PERFORM ENTER-VOUCHER-AMOUNT.
019400     PERFORM ENTER-VOUCHER-DATE.
019500     PERFORM ENTER-VOUCHER-DUE.
019600     PERFORM ENTER-VOUCHER-DEDUCTIBLE.
019700     PERFORM ENTER-VOUCHER-SELECTED.
019800
019900*--------------------------------
020000* CHANGE
020100*--------------------------------
020200 CHANGE-MODE.
020300     MOVE "CHANGE" TO THE-MODE.
020400     PERFORM GET-EXISTING-RECORD.
020500     PERFORM CHANGE-RECORDS
020600        UNTIL VOUCHER-NUMBER = ZEROES.
020700
020800 CHANGE-RECORDS.
020900     PERFORM GET-FIELD-TO-CHANGE.
021000     PERFORM CHANGE-ONE-FIELD
021100         UNTIL WHICH-FIELD = ZERO.
021200     PERFORM GET-EXISTING-RECORD.
021300
021400 GET-FIELD-TO-CHANGE.
021500     PERFORM DISPLAY-ALL-FIELDS.
021600     PERFORM ASK-WHICH-FIELD.
021700
021800 ASK-WHICH-FIELD.
021900     PERFORM ACCEPT-WHICH-FIELD.
022000     PERFORM RE-ACCEPT-WHICH-FIELD
022100         UNTIL WHICH-FIELD < 8.
022200
022300 ACCEPT-WHICH-FIELD.
022400     DISPLAY "ENTER THE NUMBER OF THE FIELD".
022500     DISPLAY "TO CHANGE (1-7) OR 0 TO EXIT".
022600     ACCEPT WHICH-FIELD.
022700
022800 RE-ACCEPT-WHICH-FIELD.
022900     DISPLAY "INVALID ENTRY".
023000     PERFORM ACCEPT-WHICH-FIELD.
023100
023200 CHANGE-ONE-FIELD.
023300     PERFORM CHANGE-THIS-FIELD.
023400     PERFORM GET-FIELD-TO-CHANGE.
023500
023600 CHANGE-THIS-FIELD.
023700     IF WHICH-FIELD = 1
023800         PERFORM ENTER-VOUCHER-VENDOR.
023900     IF WHICH-FIELD = 2
024000         PERFORM ENTER-VOUCHER-INVOICE.
024100     IF WHICH-FIELD = 3
024200         PERFORM ENTER-VOUCHER-FOR.
024300     IF WHICH-FIELD = 4
024400         PERFORM ENTER-VOUCHER-AMOUNT.
024500     IF WHICH-FIELD = 5
024600         PERFORM ENTER-VOUCHER-DATE.
024700     IF WHICH-FIELD = 6
024800         PERFORM ENTER-VOUCHER-DUE.
024900     IF WHICH-FIELD = 7
025000         PERFORM ENTER-VOUCHER-DEDUCTIBLE.
025100
025200     PERFORM REWRITE-VOUCHER-RECORD.
025300
025400*--------------------------------
025500* INQUIRE
025600*--------------------------------
025700 INQUIRE-MODE.
025800     MOVE "DISPLAY" TO THE-MODE.
025900     PERFORM GET-EXISTING-RECORD.
026000     PERFORM INQUIRE-RECORDS
026100        UNTIL VOUCHER-NUMBER = ZEROES.
026200
026300 INQUIRE-RECORDS.
026400     PERFORM DISPLAY-ALL-FIELDS.
026500     PERFORM GET-EXISTING-RECORD.
026600
026700*--------------------------------
026800* DELETE
026900*--------------------------------
027000 DELETE-MODE.
027100     MOVE "DELETE" TO THE-MODE.
027200     PERFORM GET-EXISTING-RECORD.
027300     PERFORM DELETE-RECORDS
027400        UNTIL VOUCHER-NUMBER = ZEROES.
027500
027600 DELETE-RECORDS.
027700     PERFORM DISPLAY-ALL-FIELDS.
027800
027900     PERFORM ASK-OK-TO-DELETE.
028000
028100     IF OK-TO-DELETE = "Y"
028200         PERFORM DELETE-VOUCHER-RECORD.
028300
028400     PERFORM GET-EXISTING-RECORD.
028500
028600 ASK-OK-TO-DELETE.
028700     PERFORM ACCEPT-OK-TO-DELETE.
028800
028900     PERFORM RE-ACCEPT-OK-TO-DELETE
029000        UNTIL OK-TO-DELETE = "Y" OR "N".
029100
029200 ACCEPT-OK-TO-DELETE.
029300     DISPLAY "DELETE THIS RECORD (Y/N)?".
029400     ACCEPT OK-TO-DELETE.
029500     INSPECT OK-TO-DELETE
029600      CONVERTING LOWER-ALPHA TO UPPER-ALPHA.
029700
029800 RE-ACCEPT-OK-TO-DELETE.
029900     DISPLAY "YOU MUST ENTER YES OR NO".
030000     PERFORM ACCEPT-OK-TO-DELETE.
030100
030200*--------------------------------
030300* Routines shared by all modes
030400*--------------------------------
030500 INIT-VOUCHER-RECORD.
030600     MOVE SPACE TO VOUCHER-INVOICE
030700                   VOUCHER-FOR
030800                   VOUCHER-DEDUCTIBLE
030900                   VOUCHER-SELECTED.
031000     MOVE ZEROES TO VOUCHER-NUMBER
031100                    VOUCHER-VENDOR
031200                    VOUCHER-AMOUNT
031300                    VOUCHER-DATE
031400                    VOUCHER-DUE
031500                    VOUCHER-PAID-AMOUNT
031600                    VOUCHER-PAID-DATE
031700                    VOUCHER-CHECK-NO.
031800
031900*--------------------------------
032000* Routines shared Add and Change
032100*--------------------------------
032200 ENTER-VOUCHER-VENDOR.
032300     PERFORM ACCEPT-VOUCHER-VENDOR.
032400     PERFORM RE-ACCEPT-VOUCHER-VENDOR
032500         UNTIL VOUCHER-VENDOR NOT = ZEROES AND
032600               VENDOR-RECORD-FOUND = "Y".
032700
032800 ACCEPT-VOUCHER-VENDOR.
032900     DISPLAY "ENTER VENDOR".
033000     ACCEPT VOUCHER-VENDOR.
033100     PERFORM EDIT-CHECK-VOUCHER-VENDOR.
033200     PERFORM DISPLAY-VOUCHER-VENDOR.
033300
033400 RE-ACCEPT-VOUCHER-VENDOR.
033500     DISPLAY ERROR-MESSAGE.
033600     PERFORM ACCEPT-VOUCHER-VENDOR.
033700
033800 EDIT-CHECK-VOUCHER-VENDOR.
033900     PERFORM EDIT-VOUCHER-VENDOR.
034000     PERFORM CHECK-VOUCHER-VENDOR.
034100
034200 EDIT-VOUCHER-VENDOR.
034300
034400 CHECK-VOUCHER-VENDOR.
034500     PERFORM VOUCHER-VENDOR-REQUIRED.
034600     IF VOUCHER-VENDOR NOT = ZEROES
034700         PERFORM VOUCHER-VENDOR-ON-FILE.
034800
034900 VOUCHER-VENDOR-REQUIRED.
035000     IF VOUCHER-VENDOR = ZEROES
035100         MOVE "VENDOR MUST BE ENTERED"
035200           TO ERROR-MESSAGE.
035300
035400 VOUCHER-VENDOR-ON-FILE.
035500     MOVE VOUCHER-VENDOR TO VENDOR-NUMBER.
035600     PERFORM READ-VENDOR-RECORD.
035700     IF VENDOR-RECORD-FOUND = "N"
035800         MOVE "VENDOR NOT ON FILE"
035900           TO ERROR-MESSAGE.
036000
036100 ENTER-VOUCHER-INVOICE.
036200     PERFORM ACCEPT-VOUCHER-INVOICE.
036300     PERFORM RE-ACCEPT-VOUCHER-INVOICE
036400         UNTIL VOUCHER-INVOICE NOT = SPACE.
036500
036600 ACCEPT-VOUCHER-INVOICE.
036700     DISPLAY "ENTER INVOICE NUMBER".
036800     ACCEPT VOUCHER-INVOICE.
036900     INSPECT VOUCHER-INVOICE
037000         CONVERTING LOWER-ALPHA
037100         TO         UPPER-ALPHA.
037200
037300 RE-ACCEPT-VOUCHER-INVOICE.
037400     DISPLAY "INVOICE MUST BE ENTERED".
037500     PERFORM ACCEPT-VOUCHER-INVOICE.
037600
037700 ENTER-VOUCHER-FOR.
037800     PERFORM ACCEPT-VOUCHER-FOR.
037900     PERFORM RE-ACCEPT-VOUCHER-FOR
038000         UNTIL VOUCHER-FOR NOT = SPACE.
038100
038200 ACCEPT-VOUCHER-FOR.
038300     DISPLAY "WHAT FOR?".
038400     ACCEPT VOUCHER-FOR.
038500     INSPECT VOUCHER-FOR
038600         CONVERTING LOWER-ALPHA
038700         TO         UPPER-ALPHA.
038800
038900 RE-ACCEPT-VOUCHER-FOR.
039000     DISPLAY "A DESCRIPTION MUST BE ENTERED".
039100     PERFORM ACCEPT-VOUCHER-FOR.
039200
039300 ENTER-VOUCHER-AMOUNT.
039400     PERFORM ACCEPT-VOUCHER-AMOUNT.
039500     PERFORM RE-ACCEPT-VOUCHER-AMOUNT
039600         UNTIL VOUCHER-AMOUNT NOT = ZEROES.
039700
039800 ACCEPT-VOUCHER-AMOUNT.
039900     DISPLAY "ENTER INVOICE AMOUNT".
040000     ACCEPT VOUCHER-AMOUNT-FIELD.
040100     MOVE VOUCHER-AMOUNT-FIELD TO VOUCHER-AMOUNT.
040200
040300 RE-ACCEPT-VOUCHER-AMOUNT.
040400     DISPLAY "AMOUNT MUST NOT BE ZERO".
040500     PERFORM ACCEPT-VOUCHER-AMOUNT.
040600
040700 ENTER-VOUCHER-DATE.
040800     MOVE "N" TO ZERO-DATE-IS-OK.
040900     MOVE "ENTER INVOICE DATE(MM/DD/CCYY)?"
041000            TO DATE-PROMPT.
041100     MOVE "AN INVOICE DATE IS REQUIRED"
041200            TO DATE-ERROR-MESSAGE.
           DISPLAY "416".
041300     PERFORM GET-A-DATE.
           DISPLAY "DATE-CCYYMMDD:" DATE-CCYYMMDD.
041400     MOVE DATE-CCYYMMDD TO VOUCHER-DATE.
041500
041600 ENTER-VOUCHER-DUE.
041700     MOVE "N" TO ZERO-DATE-IS-OK.
041800     MOVE "ENTER DUE DATE(MM/DD/CCYY)?"
041900            TO DATE-PROMPT.
042000     MOVE "A DUE DATE IS REQUIRED"
042100            TO DATE-ERROR-MESSAGE.
042200     PERFORM GET-A-DATE.
042300     MOVE DATE-CCYYMMDD TO VOUCHER-DUE.
042400
042500
042600 ENTER-VOUCHER-DEDUCTIBLE.
042700     PERFORM ACCEPT-VOUCHER-DEDUCTIBLE.
042800     PERFORM RE-ACCEPT-VOUCHER-DEDUCTIBLE
042900         UNTIL VOUCHER-DEDUCTIBLE = "Y" OR "N".
043000
043100 ACCEPT-VOUCHER-DEDUCTIBLE.
043200     DISPLAY "IS THIS TAX DEDUCTIBLE?".
043300     ACCEPT VOUCHER-DEDUCTIBLE.
043400     INSPECT VOUCHER-DEDUCTIBLE
043500         CONVERTING LOWER-ALPHA
043600         TO         UPPER-ALPHA.
043700
043800 RE-ACCEPT-VOUCHER-DEDUCTIBLE.
043900     DISPLAY "MUST BE YES OR NO".
044000     PERFORM ACCEPT-VOUCHER-DEDUCTIBLE.
044100
044200 ENTER-VOUCHER-SELECTED.
044300     MOVE "N" TO VOUCHER-SELECTED.
044400
044500*--------------------------------
044600* Routines shared by Change,
044700* Inquire and Delete
044800*--------------------------------
044900 GET-EXISTING-RECORD.
045000     PERFORM ACCEPT-EXISTING-KEY.
045100     PERFORM RE-ACCEPT-EXISTING-KEY
045200         UNTIL VOUCHER-RECORD-FOUND = "Y" OR
045300               VOUCHER-NUMBER = ZEROES.
045400
045500 ACCEPT-EXISTING-KEY.
045600     PERFORM INIT-VOUCHER-RECORD.
045700     PERFORM ENTER-VOUCHER-NUMBER.
045800     IF VOUCHER-NUMBER NOT = ZEROES
045900         PERFORM READ-VOUCHER-RECORD.
046000
046100 RE-ACCEPT-EXISTING-KEY.
046200     DISPLAY "RECORD NOT FOUND"
046300     PERFORM ACCEPT-EXISTING-KEY.
046400
046500 ENTER-VOUCHER-NUMBER.
046600     DISPLAY "ENTER VOUCHER NUMBER TO "
046700             THE-MODE.
046800     ACCEPT VOUCHER-NUMBER.
046900
047000 DISPLAY-ALL-FIELDS.
047100     DISPLAY " ".
047200     PERFORM DISPLAY-VOUCHER-NUMBER.
047300     PERFORM DISPLAY-VOUCHER-VENDOR.
047400     PERFORM DISPLAY-VOUCHER-INVOICE.
047500     PERFORM DISPLAY-VOUCHER-FOR.
047600     PERFORM DISPLAY-VOUCHER-AMOUNT.
047700     PERFORM DISPLAY-VOUCHER-DATE.
047800     PERFORM DISPLAY-VOUCHER-DUE.
047900     PERFORM DISPLAY-VOUCHER-DEDUCTIBLE.
048000     IF VOUCHER-PAID-DATE = ZEROES
048100         PERFORM DISPLAY-VOUCHER-SELECTED.
048200     IF VOUCHER-PAID-DATE NOT = ZEROES
048300         PERFORM DISPLAY-VOUCHER-PAID-AMOUNT
048400         PERFORM DISPLAY-VOUCHER-PAID-DATE
048500         PERFORM DISPLAY-VOUCHER-CHECK-NO.
048600     DISPLAY " ".
048700
048800 DISPLAY-VOUCHER-NUMBER.
048900     DISPLAY "   VOUCHER NUMBER: " VOUCHER-NUMBER.
049000
049100 DISPLAY-VOUCHER-VENDOR.
049200     PERFORM VOUCHER-VENDOR-ON-FILE.
049300     IF VENDOR-RECORD-FOUND = "N"
049400         MOVE "**Not found**" TO VENDOR-NAME.
049500     DISPLAY "1. VENDOR: "
049600             VOUCHER-VENDOR " "
049700             VENDOR-NAME.
049800
049900 DISPLAY-VOUCHER-INVOICE.
050000     DISPLAY "2. INVOICE: " VOUCHER-INVOICE.
050100
050200 DISPLAY-VOUCHER-FOR.
050300     DISPLAY "3. FOR: " VOUCHER-FOR.
050400
050500 DISPLAY-VOUCHER-AMOUNT.
050600     MOVE VOUCHER-AMOUNT TO VOUCHER-AMOUNT-FIELD.
050700     DISPLAY "4. AMOUNT: " VOUCHER-AMOUNT-FIELD.
050800
050900 DISPLAY-VOUCHER-DATE.
051000     MOVE VOUCHER-DATE TO DATE-CCYYMMDD.
051100     PERFORM FORMAT-THE-DATE.
051200     DISPLAY "5. INVOICE DATE: " FORMATTED-DATE.
051300
051400 DISPLAY-VOUCHER-DUE.
051500     MOVE VOUCHER-DUE TO DATE-CCYYMMDD.
051600     PERFORM FORMAT-THE-DATE.
051700     DISPLAY "6. DUE DATE: " FORMATTED-DATE.
051800
051900 DISPLAY-VOUCHER-DEDUCTIBLE.
052000     DISPLAY "7. DEDUCTIBLE: " VOUCHER-DEDUCTIBLE.
052100
052200 DISPLAY-VOUCHER-SELECTED.
052300     DISPLAY "   SELECTED FOR PAYMENT: " VOUCHER-SELECTED.
052400
052500 DISPLAY-VOUCHER-PAID-AMOUNT.
052600     MOVE VOUCHER-PAID-AMOUNT TO VOUCHER-PAID-AMOUNT-FIELD.
052700     DISPLAY "   PAID: " VOUCHER-PAID-AMOUNT-FIELD.
052800
052900 DISPLAY-VOUCHER-PAID-DATE.
053000     MOVE VOUCHER-PAID-DATE TO DATE-CCYYMMDD.
053100     PERFORM FORMAT-THE-DATE.
053200     DISPLAY "   PAID ON: " FORMATTED-DATE.
053300
053400 DISPLAY-VOUCHER-CHECK-NO.
053500     DISPLAY "   CHECK: " VOUCHER-CHECK-NO.
053600
053700*--------------------------------
053800* File I-O Routines
053900*--------------------------------
054000 READ-VOUCHER-RECORD.
054100     MOVE "Y" TO VOUCHER-RECORD-FOUND.
054200     READ VOUCHER-FILE RECORD
054300       INVALID KEY
054400          MOVE "N" TO VOUCHER-RECORD-FOUND.
054500
054600*or  READ VOUCHER-FILE RECORD WITH LOCK
054700*      INVALID KEY
054800*         MOVE "N" TO VOUCHER-RECORD-FOUND.
054900
055000*or  READ VOUCHER-FILE RECORD WITH HOLD
055100*      INVALID KEY
055200*         MOVE "N" TO VOUCHER-RECORD-FOUND.
055300
055400 WRITE-VOUCHER-RECORD.
055500     WRITE VOUCHER-RECORD
055600         INVALID KEY
055700         DISPLAY "RECORD ALREADY ON FILE".
055800
055900 REWRITE-VOUCHER-RECORD.
056000     REWRITE VOUCHER-RECORD
056100         INVALID KEY
056200         DISPLAY "ERROR REWRITING VENDOR RECORD".
056300
056400 DELETE-VOUCHER-RECORD.
056500     DELETE VOUCHER-FILE RECORD
056600         INVALID KEY
056700         DISPLAY "ERROR DELETING VENDOR RECORD".
056800
056900 READ-VENDOR-RECORD.
057000     MOVE "Y" TO VENDOR-RECORD-FOUND.
057100     READ VENDOR-FILE RECORD
057200       INVALID KEY
057300          MOVE "N" TO VENDOR-RECORD-FOUND.
057400
057500 READ-CONTROL-RECORD.
057600     MOVE 1 TO CONTROL-KEY.
057700     MOVE "Y" TO CONTROL-RECORD-FOUND.
057800     READ CONTROL-FILE RECORD
057900         INVALID KEY
058000          MOVE "N" TO CONTROL-RECORD-FOUND
058100          DISPLAY "CONTROL FILE IS INVALID".
058200
058300 REWRITE-CONTROL-RECORD.
058400     REWRITE CONTROL-RECORD
058500         INVALID KEY
058600         DISPLAY "ERROR REWRITING CONTROL RECORD".
058700
058800     COPY "pldate01.cbl".
058900
