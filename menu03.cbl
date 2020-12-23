       IDENTIFICATION DIVISION.
       PROGRAM-ID. MENU01.
      *-----
      * This program displays a three choice menu of
      * messages that can be displayed.
      * The user enters the choice, 1, 2, or 3, and
      * the appropriate message is displayed.
      * An error message is displayed if an invalid
      * choice is made
      *-----
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01  MENU-PICK          PIC 9.
           88 PICK-IS-EXIT    VALUE 9.
           88 PICK-IS-VALID   VALUES 1 THRU 3, 9.

       PROCEDURE DIVISION.
       PROGRAM-BEGIN.

           MOVE 1 TO MENU-PICK.
           PERFORM GET-AND-DO-PICK
               UNTIL PICK-IS-EXIT.
      *

           DISPLAY "Thank you. Exiting".
       
       PROGRAM-DONE.
           STOP RUN.

       GET-AND-DO-PICK.
           PERFORM GET-THE-MENU-PICK.

           PERFORM DO-THE-MENU-PICK.
       
       GET-THE-MENU-PICK.

           PERFORM DISPLAY-THE-MENU.
           PERFORM GET-THE-PICK.

       DO-THE-MENU-PICK.
      *
           IF NOT PICK-IS-VALID
               DISPLAY "Invalid selection".

           IF MENU-PICK = 1
               DISPLAY "One for the money.".

           IF MENU-PICK = 2
               DISPLAY "Two for the show.".

           IF MENU-PICK = 3
               DISPLAY "Three to get ready.".

      * LEVEL 3 ROUTINES
       DISPLAY-THE-MENU.
      * Includes the display of some blank lines to
      * improve the appearance
           DISPLAY "Please enter the number of the message".
           DISPLAY "that you wish to display.".
           DISPLAY " ".
           DISPLAY "1. First Message".
           DISPLAY "2. Second Message".
           DISPLAY "3. Third Message".
           DISPLAY " ".
           DISPLAY "9. EXIT".
           DISPLAY "Your selection (1-3)?".

       GET-THE-PICK.
           ACCEPT MENU-PICK.
