require 'pry'

@grid_data = {
  a: [0,0,0,0,0],
  b: [0,0,0,0,0],
  c: [0,0,0,0,0],
  d: [0,0,0,0,0],
  e: [0,0,0,0,0],
  }

# grid_data[:d][0] = 1

# p grid_data[:d][0]


# 5 ships as follows: the aircraft carrier (size: 5 cells), the battleship (4 cells), the Submarine (3 cells), the Destroyer (3 cells) and the patrol boat (2 cells)

def patrol_boat 
  letter = [:a, :b, :c, :d, :e].sample
  index = [0, 1, 2, 3, 4].sample
  @grid_data[letter][index] = 1
  binding.pry
end
patrol_boat

