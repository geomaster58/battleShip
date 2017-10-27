require 'pry'

@grid_data = {
  a: [0,0,0,0,0],
  b: [0,0,0,0,0],
  c: [0,0,0,0,0],
  d: [0,0,0,0,0],
  e: [0,0,0,0,0],
  }


# cpu_ships[:d][0] = 1

# p cpu_ships[:d][0]



# 5 ships as follows: the aircraft carrier (size: 5 cells), the battleship (4 cells), the Submarine (3 cells), the Destroyer (3d cells) and the patrol boat (2 cells)

  @cpu_ships = {
  a: [0,0,0,0,0],
  b: [0,0,0,0,0],
  c: [0,0,0,0,0],
  d: [0,0,0,0,0],
  e: [0,0,0,0,0],
  }

def horizontal?
  num = (1..10).to_a.sample
  @horizontal = false
  num.even? ? @horizontal = true : @horizontal
end


def cpu_target type_number
  letter = [:a, :b, :c, :d, :e].sample
  index_arr = [0, 1, 2, 3, 4].sample


  @location = [letter, index_arr] 

  if @horizontal
    #we run into risk of overlapping grid horixontally.  We need to check and see if a space is available next to it, and we have sufficient room to place our ship.  If we don't have sufficient space, do not place, and we will get a new location .
    index_arr == 4 ? index_arr -= 1 : index_arr
      
      if @cpu_ships[letter][index_arr].zero? && @cpu_ships[letter][index_arr + 1].zero?
         @cpu_ships[letter][index_arr] = type_number
         @cpu_ships[letter][index_arr + 1] = type_number
         binding.pry
      end    
  else
    #we run into risk of overlapping grid vertically.  We need to check and see if a space is available next to it, and we have sufficient room to place our ship.  If we don't have sufficient space, do not place, and we will get a new location .
  end

end


def boat_placement boat_type = "submarine"
  # case boat_type
  # when "patrol_boat"
    horizontal?
    cpu_target(2)
  # when "submarine"
    #cpu_target(3)
    # horizontal?
    # binding.pry
    # if @horizontal == "true"
    #   puts "yo dawg I'm true"
    # else
      
    # end
    # binding.pry
  # end 
end

boat_placement

def display grid_data
  puts "  " + ((1..5).to_a.join(" "))
  grid_data.each do |key, array|
    puts key.to_s + " " + (array.join(" "))
  end
end


# display grid_data