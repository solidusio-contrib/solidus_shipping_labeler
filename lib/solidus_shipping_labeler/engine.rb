# frozen_string_literal: true

require 'spree/core'

module SolidusShippingLabeler
  class Engine < Rails::Engine
    include SolidusSupport::EngineExtensions::Decorators

    isolate_namespace Spree

    engine_name 'solidus_shipping_labeler'

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end
  end
end
