[0, 0, 1, 0]

:B:
  0:
    >>
    :R0:
  1:
    >>
    :R1:
  _:
    PRINT "GOOD"
    EXIT 0

:R0:
  _:
    <<
    :E0:
  1:
    1
    >>
    :R0:
  0:
    0
    >>
    :R0:

:E0:
  0:
    _
    <<
    :BB:
  *:
    PRINT "BAD"
    EXIT 1

:R1:
  _:
    <<
    :E1:
  1:
    1
    >>
    :R1:
  0:
    0
    >>
    :R1:

:E1:
  1:
    _
    <<
    :BB:
  *:
    PRINT "BAD"
    EXIT 1

:BB:
  _:
    >>
    _
    :B:
  *:
    <<
    :BB:
