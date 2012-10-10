require 'gosu'

class GameWindow < Gosu::Window

  attr :entities
  attr :width
  attr :height

  def self.height
    480
  end

  def self.width
    640
  end

  def initialize
    super GameWindow.width, GameWindow.height, false
    self.caption = "Your argument is INVALID"

    @entities = []

    @player = Player.new(self)

    @entities.push(@player)
  end

  def update

    @entities.each do | entity |
      entity.tick
    end
  end

  def draw
    @entities.each do | entity |
      entity.draw
    end
  end

end

class Entity 

  attr :x,true
  attr :y,true

  attr :x_velocity,true
  attr :y_velocity

  def tick
    @x += @x_velocity
    @y += @y_velocity

    # Hacks!
    @x = 0 if @x >= GameWindow.width     
    @y = 0 if @y >= GameWindow.height
  end

end

class Player < Entity

  attr :angle, true

  def initialize(window)
    @image = Gosu::Image.new(window, "media/nick_cage.jpeg", false)
    @angle = 0 
    
    @x = 320
    @y = 240

    @x_velocity = 1
    @y_velocity = 1
  end

  def tick
    @angle += 1

    super()
  end

  def draw
    @image.draw_rot(@x, @y, 1, @angle)
  end

end

window = GameWindow.new
window.show
