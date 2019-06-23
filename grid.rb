class Grid
  def initialize(x_max = 5, y_max = 5)
    @x_max = x_max
    @y_max = y_max
  end

  def within_grid?(x ,y)
    (winthin_x?(x) && winthin_y?(y))
  end

  private

  def winthin_x?(x)
    x.between?(0, @x_max)
  end

  def winthin_y?(y)
    y.between?(0, @y_max)
  end
end