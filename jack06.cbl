       IDENTIFICATION DIVISION.
       PROGRAM-ID. JACK06.
       ENVIRONMENT DIVISION.
       DATA DIVISION.

       WORKING-STORAGE SECTION.

       01  THE-WHOLE-MESSAGE.
           05  THE-NUMBER          PIC 9(2) VALUE 1.
           05  A-SPACE             PIC X    VALUE SPACE.
           05  THE-MESSAGE.
               10  JACKS-NAME      PIC x(5) VALUE "Jack".
               10  JACKS-TASK      PIC x(45).

       PROCEDURE DIVISION.
       PROGRAM-BEGIN.
     
      * Set up and display line 1
           MOVE "be nimble," to JACKS-TASK.
           DISPLAY THE-WHOLE-MESSAGE.
      *
      * Set up and display line 2
           MOVE "be quick," to JACKS-TASK.
           ADD 1 TO THE-NUMBER.
           DISPLAY THE-WHOLE-MESSAGE.
      *
      * Set up and display line 3
           MOVE "jump over the candlestick." to JACKS-TASK.
           ADD 1 TO THE-NUMBER.
           DISPLAY THE-WHOLE-MESSAGE.
      
      * Set up and display line 3
           MOVE "That's all folks" to THE-WHOLE-MESSAGE.
           DISPLAY THE-WHOLE-MESSAGE.

       PROGRAM-DONE.
           STOP RUN.
