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
  Local INTEGER r
  Local INTEGER g
  Local INTEGER b
  Local INTEGER x = Touch(X)
  Local INTEGER y = Touch(Y)
  Local INTEGER n = 2 + (Rnd * 7)
  Local INTEGER i

  ' draw 3-8 concentric circles of different colors

  For i = 1 To n
    ' TODO: check rounding: expected 0-0.999 but getting 1?
    r = Rnd * 255 '256
    g = Rnd * 255 '256
    b = Rnd * 255 '256
    Circle x, y, Rnd*MM.HRes/(n*2), 1, 1, RGB(r, g, b), RGB(r, g, b)
  Next

End Sub
