class LoadShippingBoxes < ActiveRecord::Migration
  def up
    SpreeShippingLabeler::Engine.load_seed
  end
end
