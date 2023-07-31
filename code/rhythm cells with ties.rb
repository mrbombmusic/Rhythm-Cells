

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

##| puts cells[4].ring.take_last(1)


use_random_seed 44444
use_bpm 60

define :slur do |cells, cell1|
  newCell1 = cell1.dup
  last_value = newCell1.pop
  cell2 = cells[rrand_i(0,7)].dup
  cell2[0] = cell2[0] + last_value
  return newCell1 + cell2
end

live_loop :kick do
  sample :bd_haus
  sleep 1
end

##| live_loop :basss, sync: :kick do
##|   use_synth :bass_foundation
##|   play (ring :d1, :fs1, :a1, :fs1).tick
##|   sleep 1
##| end

##| live_loop :chord, sync: :kick do
##|   play chord_degree((ring :i, :v, :vi, :iv).tick, :d3, :major, 3), release: 4
##|   sleep 4
##| end

live_loop :rhythim, sync: :kick do
  use_synth :piano
  n = rrand_i(0, 7)
  tick_reset
  if one_in(4)
    rhythm = slur cells, cells[n]
  else
    rhythm = cells[n]
  end
  puts rhythm
  rhythm.length.times do
    if one_in(4)
      a = 0
    else
      a = 1
    end
    play scale(:d4, :major).choose, release: rhythm.tick, amp: a
    sleep rhythm.look
  end
end




