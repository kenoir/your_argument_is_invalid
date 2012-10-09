require 'gosu'

class GameWindow < Gosu::Window
  def initialize
    super 640, 480, false
    self.caption = "Your argument is INVALID"

    @player = Player.new(self)
  end

  def update
    @player.angle += 1
  end

  def draw
    @player.draw
  end
end

class Player

  attr :angle, true

  def initialize(window)
    @image = Gosu::Image.new(window, "media/nick_cage.jpeg", false)
    @angle = 0 
    
    @x = 320
    @y = 240
  end

  def draw
    @image.draw_rot(@x, @y, 1, @angle)
  end

end

window = GameWindow.new
window.show
