class GameLayer < Joybox::Core::Layer
  scene

  def on_enter
    # background = Sprite.new file_name: 'sprites/game/background.png', position: Screen.center
    # self << background

    @rocket = Sprite.new file_name: 'sprites/game/spaceship.png', position: Screen.center, alive: true
    self << @rocket

    # The following block will be called when the user touches the screen
    on_touches_began do |touches, event|
      # We retrieve the touch location and assign it to the rocket position
      touch = touches.any_object

      #@rocket.position = touch.location
      touch_location = touch.location
      rocket_location = @rocket.position
      angle = Math.atan2(touch_location.y-rocket_location.y, 
                         rocket_location.x-touch_location.x) * 180 / Math::PI

      rotate_by_action = Rotate.to angle: angle - 90
      #@rocket.run_action rotate_by_action
      #@rocket.run_action Move.to position: touch.location

      

      bezier_to_action = Bezier.to bezier: [touch.location, [touch.location.x + 50, touch.location.y + 50], [touch.location.x - 10, touch.location.y - 10]]
      
      @rocket.run_action Sequence.with actions: [rotate_by_action, bezier_to_action]

      #@rocket.run_action bezier_to_action
    end
  end
end
