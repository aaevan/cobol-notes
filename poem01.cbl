000100 IDENTIFICATION DIVISION.
000200 PROGRAM-ID. POEM01.
000300 ENVIRONMENT DIVISION.
000400 DATA DIVISION.
       WORKING-STORAGE SECTION.

       01  LINE-1       PIC X(50).
       01  LINE-2       PIC X(50).
       01  LINE-3       PIC X(50).
       01  LINE-4       PIC X(50).
       01  LINE-5       PIC X(50).
       01  LINE-6       PIC X(50).
       01  LINE-7       PIC X(50).
       01  LINE-8       PIC X(50).
       01  LINE-9       PIC X(50).
       01  LINE-10      PIC X(50).
000500 PROCEDURE DIVISION.
000600 PROGRAM-BEGIN.
           MOVE "1|since feeling is first" to LINE-1.
           MOVE "2|who pays any attention" to LINE-2.
           MOVE "3|to the syntax of things" to LINE-3.
           MOVE "4|will never wholly kiss you" to LINE-4.
           MOVE "5|wholly to be a fool" to LINE-5.
           MOVE "6|while spring is in the world" to LINE-6.
           MOVE "7|" to LINE-7
           MOVE "8|my blood approves " to LINE-8.
           MOVE "9|and kisses are a better fate" to LINE-9.
           MOVE "a|than wisdom" to LINE-10.
           DISPLAY LINE-1.
           DISPLAY LINE-2.
           DISPLAY LINE-3.
           DISPLAY LINE-4.
           DISPLAY LINE-5.
           DISPLAY LINE-6.
           DISPLAY LINE-7.
           DISPLAY LINE-8.
           DISPLAY LINE-9.
           DISPLAY LINE-10.
000800 PROGRAM-DONE.
000900     STOP RUN.
