grid_data = 
  {
  a: [0,0,0,0,0],
  b: [0,0,0,0,0],
  c: [0,0,0,0,0],
  d: [0,0,1,0,0],
  e: [0,0,0,0,0],
  }

grid_data[:d][0] = 1

def display grid_data
  puts "  " + ((1..5).to_a.join(" "))
  grid_data.each do |key, array|
    puts key.to_s + " " + (array.join(" "))
  end
end

display grid_data