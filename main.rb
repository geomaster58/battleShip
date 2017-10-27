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
}

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
  @hit_me =
  {
    a: [0,0,0,0,0],
    b: [0,0,0,0,0],
    c: [0,0,0,0,0],
    d: [0,0,0,0,0],
    e: [0,0,0,0,0],
  }

  @checker = true
  @comp_check = true

  def attack
    puts "Where would you like to attack?"
    gun = gets.chomp!



    row = (gun.downcase.split"")[0].to_sym
    column = ((gun.split"")[1].to_i) - 1
    bullet = @cpu_ships[row][column]


      if bullet.zero?
        puts "SPLOOSH"
        @hitting[row][column] = "-"
      else
        puts "THATS A HIT!"

        @hitting[row][column] = "x"
      end
      display @hitting
  end

  def cpu_attack
    puts "I will kill you for that User"
    row = [:a, :b, :c, :d, :e].sample
    column = [0, 1, 2, 3, 4].sample

    sleep(1)

    puts "Hmmm...Where do I shoot you"

    sleep(1)

    puts "HERE!"

    bullet = @my_ships[row][column]



      destruction = @hit_me[row][column]
      if destruction == "x"
        puts "hmmm..."
        sleep(1)
      elsif bullet.zero?
        puts "SPLOOSH"
        puts "You survive..for now"
        @hit_me[row][column] = "-"
      else
        puts "TAKE THAT MEAT BAG!!"

        @hit_me[row][column] = "x"
      end
    display @hit_me
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
  @horizontal = true
  if @horizontal
    index_arr == 4 ? index_arr -= 1 : index_arr

      if @cpu_ships[letter][index_arr].zero? && @cpu_ships[letter][index_arr + 1].zero?
         @cpu_ships[letter][index_arr] = type_number
         @cpu_ships[letter][index_arr + 1] = type_number
      end    
  else 
    letter == :e ? letter = :d : letter
    case letter
      when :a
        row_down = :b
      when :b
        row_down = :c
      when :c
        row_down = :d
      when :d
        row_down = :e
    end

    if @cpu_ships [letter][index_arr].zero? && @cpu_ships[row_down][index_arr].zero?
      @cpu_ships[letter][index_arr] = type_number
      @cpu_ships[row_down][index_arr] = type_number
    end

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

boat_placement
# display grid_data
#

def checker grid
  length = [] 
  grid.each {|key, arr| arr.each {|x| length << x if x =="x"}}

  length.length == 2 ? @checker= false : @checker = true
end

def checker_comp grid
  length = [] 
  grid.each {|key, arr| arr.each {|x| length << x if x =="x"}}

  length.length == 2 ? @comp_check= false : @comp_check = true
end


#display @hitting
# display @cpu_ships
#display @cpu_ships



 # attack
 # display @hitting
# attack
# display @hitting



attack
display @hitting
attack
display @hitting
attack
display @hitting
attack
display @hitting

# attack
# display @hitting
# attack
# display @hitting

puts "Would you like to play battleship?"
ans1 = gets.chomp!
if ans1 == "yes"
  boat_placement

  # puts "Now where would you like to place your ships?"
  # display @my_ships
  # placement1 = gets.chomp!
  # add code
  while @checker && @comp_check
    puts "Your shots"
    display @hitting
    attack
    puts "Computer shots on you"
    cpu_attack
    checker @hitting
    checker_comp @hit_me
  end
  puts "YOU WIN!!" if @comp_check
  puts "YOU LOSE!!" if @checker
  
else
  puts "get outta here"
end
