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
       01  LINE-NUMBER  PIC 99.
       01  SEPARATOR    PIC X.
       01  INCREMENT-BY PIC 9.

000500 PROCEDURE DIVISION.
000600 PROGRAM-BEGIN.
           MOVE "|since feeling is first" TO LINE-1.
           MOVE "|who pays any attention" TO LINE-2.
           MOVE "|to the syntax of things" TO LINE-3.
           MOVE "|will never wholly kiss you" TO LINE-4.
           MOVE "|wholly to be a fool" TO LINE-5.
           MOVE "|while spring is in the world" TO LINE-6.
           MOVE "|" TO LINE-7
           MOVE "|my blood approves " TO LINE-8.
           MOVE "|and kisses are a better fate" TO LINE-9.
           MOVE "|than wisdom" TO LINE-10.
           MOVE 1 TO LINE-NUMBER.
           MOVE "|" TO SEPARATOR.
           MOVE 5 TO INCREMENT-BY.

           DISPLAY LINE-NUMBER SEPARATOR LINE-1.
           ADD INCREMENT-BY TO LINE-NUMBER.
           DISPLAY LINE-NUMBER SEPARATOR LINE-2.
           ADD INCREMENT-BY TO LINE-NUMBER.
           DISPLAY LINE-NUMBER SEPARATOR LINE-3.
           ADD INCREMENT-BY TO LINE-NUMBER.
           DISPLAY LINE-NUMBER SEPARATOR LINE-4.
           ADD INCREMENT-BY TO LINE-NUMBER.
           DISPLAY LINE-NUMBER SEPARATOR LINE-5.
           ADD INCREMENT-BY TO LINE-NUMBER.
           DISPLAY LINE-NUMBER SEPARATOR LINE-6.
           ADD INCREMENT-BY TO LINE-NUMBER.
           DISPLAY LINE-NUMBER SEPARATOR LINE-7.
           ADD INCREMENT-BY TO LINE-NUMBER.
           DISPLAY LINE-NUMBER SEPARATOR LINE-8.
           ADD INCREMENT-BY TO LINE-NUMBER.
           DISPLAY LINE-NUMBER SEPARATOR LINE-9.
           ADD INCREMENT-BY TO LINE-NUMBER.
           DISPLAY LINE-NUMBER SEPARATOR LINE-10.
           ADD INCREMENT-BY TO LINE-NUMBER.

000800 PROGRAM-DONE.
000900     STOP RUN.
