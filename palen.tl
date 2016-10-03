#include dynamic_mem

IN [P, O, O, P]
STACK []
NULL []

:C:
  IN IS END:
    :B:
  *:
    STACK < IN
    :C:

:B:
  IN IS BEGINNING:
    IN >>
    :R:
  *:
    IN <<
    :B:

:R:
  IN IS END:
    :CB:
  STACK == IN:
    STACK <<
    IN >>
    :R:

:CB:
  STACK IS BEGINNING:
    PRINT "GOOD"
    EXIT 0
  *:
    PRINT "BAD"
    EXIT 1
