# frozen_string_literal: true

module Spree
  module Shipping
    class Box < ApplicationRecord
      self.table_name = "spree_shipping_boxes"

      validates :description, uniqueness: { case_sensitive: false }

      def self.preferred_for_returns
        first
      end
    end
  end
end
