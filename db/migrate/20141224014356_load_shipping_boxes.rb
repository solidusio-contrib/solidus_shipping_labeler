class LoadShippingBoxes < SolidusSupport::Migration[4.2]
  def up
    SpreeShippingLabeler::Engine.load_seed
  end
end
