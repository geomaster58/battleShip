@enemy_ships =
  {
    a: [0,0,0,0,0],
    b: [0,0,0,0,0],
    c: [0,0,0,0,0],
    d: [0,0,1,1,1],
    e: [0,0,0,0,0],
  }
@my_ships =
  {
    a: [1,0,0,0,0],
    b: [1,0,0,0,0],
    c: [1,0,0,0,0],
    d: [0,0,0,0,0],
    e: [0,0,0,0,0],
  }


  def attack
    puts "Where would you like to attack?"
    gun = gets.chomp!

    if gun =~ /[a-jA-J]\d/
      p gun
    else
      puts "That didnt make any sense Cap'n! I need a letter then a number"
      attack
    end

    row = (gun.downcase.split"")[0].to_sym
    column = (gun.split"")[1].to_i
    bullet = @enemy_ships[row][column-1]

    case bullet
      when 0
        puts "SPLOOSH"
      when 1
        puts "THATS A HIT!"
      when 2
        puts "We've already hit them there Captain"
      when 3
        puts "We didnt hit anything there last time Captain. Are you ok?"
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

display @enemy_ships

attack

display @enemy_ships
