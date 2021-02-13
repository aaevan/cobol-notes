       IDENTIFICATION DIVISION.
       PROGRAM-ID. EIGER03.

      * This program illustrates nested PERFORMs in a
      * structured program.
       ENVIRONMENT DIVISION.
       DATA DIVISION.

       WORKING-STORAGE SECTION.

       01 THE-MESSAGE      PIC X(50).
       01 THE-NUMBER       PIC 9(2).
       01 A-SPACE          PIC X.

       PROCEDURE DIVISION.

      * LEVEL 1 ROUTINES
       PROGRAM-BEGIN.

           PERFORM PROGRAM-INITIALIZATION.
           PERFORM MAIN-LOGIC.

       PROGRAM-DONE.
           STOP RUN.

      * LEVEL 2 ROUTINES
       PROGRAM-INITIALIZATION.
      * Initialize the space variable
           MOVE " " TO A-SPACE.
      * Start THE-NUMBER at 0
           MOVE 0 TO THE-NUMBER.

       MAIN-LOGIC.
      * Set up and display line 1
           MOVE "There once was a lady from Eiger,"
               TO THE-MESSAGE.
           PERFORM ADD-NUMBER-AND-DISPLAY.
       
      * Set up and display line 2
           MOVE "Who smiled and rode forth on a tiger."
               TO THE-MESSAGE.
           PERFORM ADD-NUMBER-AND-DISPLAY.

      * Set up and display line 3
           MOVE "They returned from the ride" TO THE-MESSAGE.
           PERFORM ADD-NUMBER-AND-DISPLAY.
           
      * Set up and display line 4
           MOVE "With the lady inside," TO THE-MESSAGE.
           PERFORM ADD-NUMBER-AND-DISPLAY.
           
      * Set up and display line 5
           MOVE "And a smile on the face of the tiger."
               TO THE-MESSAGE.
           PERFORM ADD-NUMBER-AND-DISPLAY.

      * LEVEL 3 ROUTINES
      * This paragraph is performed 5 times from within 
      * MAIN-LOGIC

       ADD-NUMBER-AND-DISPLAY.
           ADD 1 TO THE-NUMBER.
           DISPLAY
               THE-NUMBER
               A-SPACE
               THE-MESSAGE.
