class MenuScene < Joybox::Core::Scene
  def on_enter
    self << MenuLayer.new
  end
end