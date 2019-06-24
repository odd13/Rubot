require_relative './rubot'

@rubot = Rubot.new()

def process_array(array)
  array.each do |entry|
    entry = entry.split(" ")
    command = entry.first
    options = entry.last.split(',')

    case command
    when "PLACE"
      @rubot.place(options[0].to_i, options[1].to_i, options[2])
    when "MOVE"
      @rubot.move
    when "LEFT"
      @rubot.turn_left
    when "RIGHT"
      @rubot.turn_right
    when "REPORT"
      puts @rubot.report
    end
  end
end

a = ["PLACE 0,0,NORTH", "MOVE", "REPORT"] #Output: 0,1,NORTH
b = ["PLACE 0,0,NORTH", "LEFT", "REPORT"] #Output: 0,0,WEST
c = ["PLACE 1,2,EAST", "MOVE", "MOVE", "LEFT", "MOVE", "REPORT"] #Output: 3,3,NORTH

process_array(a)
process_array(b)
process_array(c)