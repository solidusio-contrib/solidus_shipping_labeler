module SolidusShippingLabeler
  module Spree
    module PermittedAttributesDecorator
      def self.prepended(base)
        base.class_eval do
          user_attributes << :label_printer_name
        end
      end

      ::Spree::PermittedAttributes.prepend self
    end
  end
end
