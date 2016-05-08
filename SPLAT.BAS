OPTION EXPLICIT

' seed RNG
Randomize Timer

' random background
CLS RGB(Rnd * 256, Rnd * 256, Rnd * 256)

' run sub on touch IRQ interrupt
SetPin 15, INTL, DrawSplat
Do : Loop

Sub DrawSplat
  ' draw random circle at touch coords
  LOCAL INTEGER r = Rnd * 256
  LOCAL INTEGER g = Rnd * 256
  LOCAL INTEGER b = Rnd * 256
  LOCAL INTEGER x = Touch(X)
  LOCAL INTEGER y = Touch(Y)
  CIRCLE x, y, Rnd*MM.HRes/2, 1, 1, RGB(r, g, b), RGB(r, g, b)
  'Pixel Touch(X) Touch(Y)
End Sub
