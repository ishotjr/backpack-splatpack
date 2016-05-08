Option EXPLICIT

Dim first = 1

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

      If first = 1 Then

        ' seed RNG using touch coords + Timer
        Randomize Timer + (x * 16) + (y * 16)

        Dim INTEGER r0 = 32 + Rnd * 95
        Dim INTEGER g0 = 32 + Rnd * 95
        Dim INTEGER b0 = 32 + Rnd * 95

        ' random dark-ish background
        CLS RGB(r0, g0, b0)
        Print "r0: " r0
        Print "g0: " g0
        Print "b0: " b0

        first = 0
      EndIf

      ' scatter several circles around point
      Print "m: " m
      For j = 1 To m

        xm = x+(Rnd*3*m)*(1-Rnd)
        ym = y+(Rnd*3*m)*(1-Rnd)

        ' draw 2-6 concentric circles of different blue-ish colors
        Print "n: " n
        For i = 1 To n
         ' TODO: check rounding: expected 0-0.999 but getting 1?
          r = 255 - r0 + 24 + (Rnd * n * 4) '16
          If r > 255 Then r = 255
          g = 255 - g0 + 24 + (Rnd * n * 4) '16
          If g > 255 Then g = 255
          b = 255 - b0 + 24 + (Rnd * n * 4) '16
          If b > 255 Then b = 255
          d = MM.VRes/(i*6) + (Rnd * MM.VRes/((i+1)*4))
          Circle xm, ym, d/2, 1, 1, RGB(r, g, b), RGB(r, g, b)
          Print "circle: " xm ym d "(" r "," g "," b ")"
        Next

      Next
    EndIf
  EndIf

End Sub
