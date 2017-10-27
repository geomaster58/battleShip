
@enemy_ships =
  {
    a: [0,0,0,0,0],
    b: [0,0,0,0,0],
    c: [0,0,0,0,0],
    d: [3,3,3,0,0],
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


  def attack
    puts "Where would you like to attack?"
    gun = gets.chomp!
    row = (gun.downcase.split"")[0].to_sym
    column = (gun.split"")[1].to_i
    bullet = @enemy_ships[row][column-1]

    
      if bullet.zero?
        puts "SPLOOSH"
        @hitting[row][column-1] = "-"
      else 
        puts "THATS A HIT!"
        @hitting[row][column-1] = "x"
      end

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

def checker
 @hitting.values.include?("x"*3)
end

display @hitting

attack
display @hitting
attack
display @hitting
attack
display @hitting
attack
display @hitting
