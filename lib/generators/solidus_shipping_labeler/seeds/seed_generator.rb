# frozen_string_literal: true

module SolidusShippingLabeler
  module Generators
    class SeedGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __dir__)

      desc "Create default shipping boxes"

      def run_db_seeds
        seed_file = File.join(File.expand_path('../../../db', __dir__), "seeds.rb")
        load(seed_file) if File.exist?(seed_file)
      end
    end
  end
end
