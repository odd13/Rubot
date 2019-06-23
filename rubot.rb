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
    @facing = facing
  end

  def move
    case @facing
    when "NORTH"
      @x += 1
    when "SOUTH"
      @x -= 1
    when "EAST"
      @y += 1
    when "WEST"
      @y -= 1
    end
  end

  def left
    case @facing
    when "NORTH"
      @facing = "WEST"
    when "SOUTH"
      @facing = "EAST"
    when "EAST"
      @facing = "NORTH"
    when "WEST"
      @facing = "SOUTH"
    end
  end

  def right
    case @facing
    when "NORTH"
      @facing = "EAST"
    when "SOUTH"
      @facing = "WEST"
    when "EAST"
      @facing = "SOUTH"
    when "WEST"
      @facing = "NORTH"
    end
  end

  def report
    "#{@x},#{@y},#{@facing.upcase}"
  end

  private

  def within_grid?(x, y)
    @grid.within_grid?(x, y)
  end
end