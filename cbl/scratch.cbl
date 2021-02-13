       enter-the-data.
           PERFORM accept-the-data.
           PERFORM re-accept-the-data.
               UNTIL the-data is valid.
       accept-the-data.
           DISPLAY a-prompt.
           ACCEPT the-data.
           PERFORM edit-check-the-data.
       re-accept-the-data.
           DISPLAY error-message.
           PERFORM accept-the-data.

      *but this time about... VENDOR-NAME
       01  UPPER-ALPHA         PIC X(26) VALUE
           "ABCDEFGHIJKLMNOPQRSTUVWXYZ".
       01  LOWER-ALPHA         PIC X(26) VALUE
           "abcdefghijklmnopqrstuvwxyz".

       ENTER-VENDOR-NAME.
           PERFORM ACCEPT-VENDOR-NAME.
           PERFORM RE-ACCEPT-VENDOR-NAME
               UNTIL VENDOR-NAME NOT = SPACES.
      
       ACCEPT-VENDOR-NAME.
           DISPLAY "ENTER VENDOR NAME".
           ACCEPT VENDOR-NAME.
           PERFORM UPPERCASE-VENDOR-NAME

       RE-ACCEPT-VENDOR-NAME.
           DISPLAY "VENDOR NAME MUST BE ENTERED".
           PERFORM ACCEPT-VENDOR-NAME.
           PERFORM UPPERCASE-VENDOR-NAME

       UPPERCASE-VENDOR-NAME.
           INSPECT VENDOR-NAME
               CONVERTING LOWER-ALPHA
               TO         UPPER-ALPHA.
      
