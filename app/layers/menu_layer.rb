class MenuLayer < Joybox::Core::Layer
  def on_enter
    self << Sprite.new(file_name: 'sprites/menu/background.jpg',
                       position: Screen.center)

    start_button = MenuImage.new image_file_name: 'sprites/menu/start.jpg',
                                 selected_image_file_name: 'sprites/menu/start.jpg',
                                 disabled_image_file_name: 'sprites/menu/start.jpg' do |menu_item|
      Joybox.director << GameScene.new
    end

    self << Menu.new(position: [Screen.half_width, 100.0], items: [start_button])
  end
end