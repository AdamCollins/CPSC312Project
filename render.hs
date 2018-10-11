import Graphics.Gloss

window_size :: Float
window_size = 296 * 2
squares_per_row = 4
numof_edges = squares_per_row + 1
square_to_edge_ratio = 8

edge_size = window_size / (numof_edges + squares_per_row * square_to_edge_ratio)
square_size = edge_size * square_to_edge_ratio

background :: Color
background = greyN 0.5

window :: Display
window = InWindow "Static 2048 Board" (round window_size, round window_size) (10, 10)

drawSquare :: Float -> Color -> Picture
drawSquare index scolor = 
  translate (-1/2 * window_size + edge_size * (index + 1) + square_size * index + 1/2 * square_size) 0 $ 
  color scolor $ rectangleSolid square_size square_size

drawRow :: Float -> Picture
drawRow index =
  translate 0 (1/2 * window_size - edge_size * (index + 1) - square_size * index - 1/2 * square_size) $ 
    pictures [drawSquare 0 (greyN 0.7), 
              drawSquare 1 (greyN 0.7), 
              drawSquare 2 (greyN 0.7), 
              drawSquare 3 (greyN 0.7)]

drawing :: Picture
drawing = pictures [drawRow 0, drawRow 1, drawRow 2, drawRow 3]

main :: IO ()
main = display window background drawing