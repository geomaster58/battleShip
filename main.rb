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
  column = (gun.downcase.split"")[0].to_sym
  row = (gun.split"")[1].to_i
  @enemy_ships[column][row]


 if @enemy_ships[column][row] == 1
   puts "Thats a HIT!!"
 else @enemy
  puts "not ready"
end

end

attack
