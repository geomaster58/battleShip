
require 'pry'




# cpu_ships[:d][0] = 1

# p cpu_ships[:d][0]



# 5 ships as follows: the aircraft carrier (size: 5 cells), the battleship (4 cells), the Submarine (3 cells), the Destroyer (3d cells) and the patrol boat (2 cells)

  @cpu_ships = {
  a: [0,0,0,0,0],
  b: [0,0,0,0,0],
  c: [0,0,0,0,0],
  d: [0,0,0,0,0],
  e: [0,0,0,0,0],





@my_ships =
  {
    a: [0,0,0,0,0],
    b: [0,0,0,0,0],
    c: [0,0,0,0,0],
    d: [0,0,0,0,0],
    e: [0,0,0,0,0],
  }

  @hitting = 
  {
    a: [0,0,0,0,0],
    b: [0,0,0,0,0],
    c: [0,0,0,0,0],
    d: [0,0,0,0,0],
    e: [0,0,0,0,0],
  }


  def attack
    puts "Where would you like to attack?"
    gun = gets.chomp!

    

    row = (gun.downcase.split"")[0].to_sym
    column = (gun.split"")[1].to_i
    bullet = @cpu_ships[row][column-1]

    
      if bullet.zero?
        puts "SPLOOSH"
        @hitting[row][column-1] = "-"
      else 
        puts "THATS A HIT!"

        @hitting[row][column-1] = "x"
      end

  end

      



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


def display grid_data
  puts "  " + ((1..5).to_a.join(" "))
  puts " +-+-+-+-+-+  " + "          ARTY AR MATEY!!!" + "   \u{1F48E}"
  grid_data.each do |key, array|
    puts key.to_s + "|" + (array.join("|")) + "|" + "\u{2620}"
    puts " +-+-+-+-+-+  " 
  end
  puts " \u{2620}" + "  \u{2620}" + "  \u{2620}" + "  \u{2620}" 
end



# display grid_data
display @enemy_ships

def checker
 @hitting.values.include?("x"*3)
end

display @hitting


display @enemy_ships


attack
display @hitting
attack
display @hitting
attack
display @hitting
attack
display @hitting

