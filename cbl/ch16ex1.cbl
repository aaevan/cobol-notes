       01  OUTER-VENDOR-RECORD.
           05  VENDOR-RECORD OCCURS 100 TIMES
               INDEXED BY VENDOR-INDEX.
               10    VENDOR-NUMBER            PIC 9(5).
               10    VENDOR-NAME              PIC X(30).
               10    VENDOR-ADDRESS-1         PIC X(30).
               10    VENDOR-ADDRESS-2         PIC X(30).
               10    VENDOR-CITY              PIC X(20).
               10    VENDOR-STATE             PIC X(2).
               10    VENDOR-ZIP               PIC X(10).
               10    VENDOR-CONTACT           PIC X(30).
               10    VENDOR-PHONE             PIC X(15).
