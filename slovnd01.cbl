000100*--------------------------------
000200* SLOVND01.CBL
000300*--------------------------------
000400     SELECT OLD-VENDOR-FILE
000500         ASSIGN TO "ovendor"
000600         ORGANIZATION IS INDEXED
000700         RECORD KEY IS OLD-VENDOR-NUMBER
000800         ACCESS MODE IS DYNAMIC.
