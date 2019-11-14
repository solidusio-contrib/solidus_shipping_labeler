# frozen_string_literal: true

class LoadShippingBoxes < SolidusSupport::Migration[4.2]
  def up
    SolidusShippingLabeler::Engine.load_seed
  end
end
