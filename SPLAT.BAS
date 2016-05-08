Option EXPLICIT

' seed RNG
Randomize Timer

' random blue-ish background
CLS RGB(Rnd * 15, Rnd * 15, 64 + Rnd * 63)

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
  Local INTEGER m = 4 + (Rnd * 4)'5)
  Local INTEGER i
  Local INTEGER j
  Local INTEGER d
  Local INTEGER xm
  Local INTEGER ym

  ' ignore weird touch values
  If x >= 0 Then
    If y >= 0 Then
      ' scatter several circles around point
      Print "m: " m
      For j = 1 To m

        xm = x+(Rnd*3*m)*(1-Rnd)
        ym = y+(Rnd*3*m)*(1-Rnd)

        ' draw 2-6 concentric circles of different blue-ish colors
        Print "n: " n
        For i = 1 To n
         ' TODO: check rounding: expected 0-0.999 but getting 1?
          r = Rnd * 15 '16
          g = Rnd * 15 '16
          b = 128 + Rnd * 95 '256
          d = MM.VRes/(i*6) + (Rnd * MM.VRes/((i+1)*4))
          Circle xm, ym, d/2, 1, 1, RGB(r, g, b), RGB(r, g, b)
          Print "circle: " xm ym d "(" r "," g "," b ")"
        Next

      Next
    EndIf
  EndIf

End Sub
