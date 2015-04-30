import Graphics.Rendering.Chart.Easy
import Graphics.Rendering.Chart.Backend.Cairo

signal :: [Double] -> [(Double,Double)]
signal xs = [ (x,cosh(x)) | x <- xs ]

outProps = fo_format .~ PDF $ def

main = toFile outProps "example.pdf" $ do
  layout_title .= "Amplitude Modulation"
  plot (line "am" [signal [-5,(-4.99)..5]])
