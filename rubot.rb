require_relative './grid'

class Rubot
  attr_reader :x, :y, :facing

  def initialize()
    @grid = Grid.new()
  end

  def place(x, y, facing)
    return "Outside of grid limitations" unless within_grid?(x, y)
    @x = x
    @y = y
    @facing = facing.upcase
  end

  def move
    case @facing
    when "NORTH"
      move_north
    when "SOUTH"
      move_south
    when "EAST"
      move_east
    when "WEST"
      move_west
    end
  end

  def left
    case @facing
    when "NORTH"
      turn_west
    when "SOUTH"
      turn_east
    when "EAST"
      turn_north
    when "WEST"
      turn_south
    end
  end

  def right
    case @facing
    when "NORTH"
      turn_east
    when "SOUTH"
      turn_west 
    when "EAST"
      turn_south
    when "WEST"
      turn_north
    end
  end

  def report
    "#{@x},#{@y},#{@facing}"
  end

  private

  def within_grid?(x, y)
    @grid.within_grid?(x, y)
  end

  def move_north
    @x += 1 if within_grid?(@x + 1, @y)
  end

  def move_south
    @x -= 1 if within_grid?(@x - 1, @y)
  end

  def move_east
    @y += 1 if within_grid?(@x, @y + 1)
  end

  def move_west
    @y -= 1 if within_grid?(@x, @y - 1)
  end

  def turn_east
    @facing = "EAST"
  end

  def turn_west
    @facing = "WEST"
  end

  def turn_south
    @facing = "SOUTH"
  end

  def turn_north
    @facing = "NORTH"
  end

end