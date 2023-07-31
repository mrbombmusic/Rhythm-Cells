

cells = [
  [2],
  [1, 1],
  [0.5, 0.5, 1],
  [1, 0.5, 0.5],
  [0.5, 0.5, 0.5, 0.5],
  [1.5, 0.5],
  [0.5, 1.5],
  [0.5, 1, 0.5]
]

use_bpm 100

live_loop :rhythim do
  n = rrand_i(0, 7)
  puts n
  cells[n].length.times do
    if one_in(8) == false
      play scale(:d4, :major).choose, release: cells[n].tick
    else
      play 0, release: cells[n].tick
    end
    sleep cells[n].look
  end
end

