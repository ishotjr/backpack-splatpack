Option EXPLICIT

' seed RNG
Randomize Timer

' random background
CLS RGB(Rnd * 256, Rnd * 256, Rnd * 256)

' run sub on touch IRQ interrupt
SetPin 15, INTL, DrawSplat
Option EXPLICIT

' seed RNG
Randomize Timer

' random background
CLS RGB(Rnd * 256, Rnd * 256, Rnd * 256)

' run sub on touch IRQ interrupt
SetPin 15, INTL, DrawSplat
Do : Loop

Sub DrawSplat
  ' draw random circle at touch coords
  Local INTEGER r = Rnd * 256
  Local INTEGER g = Rnd * 256
  Local INTEGER b = Rnd * 256
  Local INTEGER x = Touch(X)
  Local INTEGER y = Touch(Y)

  Circle x, y, Rnd*MM.HRes/2, 1, 1, RGB(r, g, b), RGB(r, g, b)

  r = Rnd * 256
  g = Rnd * 256
  b = Rnd * 256
  Circle x, y, Rnd*MM.HRes/4, 1, 1, RGB(r, g, b), RGB(r, g, b)

  r = Rnd * 256
  g = Rnd * 256
  b = Rnd * 256
  Circle x, y, Rnd*MM.HRes/6, 1, 1, RGB(r, g, b), RGB(r, g, b)
End Sub
