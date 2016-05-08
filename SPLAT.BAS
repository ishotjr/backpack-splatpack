Option EXPLICIT

' seed RNG
Randomize Timer

' random background
CLS RGB(Rnd * 256, Rnd * 256, Rnd * 256)

' run sub on touch IRQ interrupt
SetPin 15, INTL, DrawSplat
Do : Loop

' draw random concentric circles at touch coords
Sub DrawSplat
  Local INTEGER r
  Local INTEGER g
  Local INTEGER b
  Local INTEGER x = Touch(X)
  Local INTEGER y = Touch(Y)
  Local INTEGER n = 2 + (Rnd * 4)'5)
  Local INTEGER i
  Local INTEGER d

  ' ignore weird touch values
  If x >= 0 Then
    If y >= 0 Then
    ' draw 2-6 concentric circles of different colors
      Print "n: " n
      For i = 1 To n
        ' TODO: check rounding: expected 0-0.999 but getting 1?
        r = Rnd * 255 '256
        g = Rnd * 255 '256
        b = Rnd * 255 '256
        d = MM.VRes/(i*6) + (Rnd * MM.VRes/((i+1)*4))
        Circle x, y, d/2, 1, 1, RGB(r, g, b), RGB(r, g, b)
        Print "circle: " x y d "(" r "," g "," b ")"
      Next
    EndIf
  EndIf

End Sub
