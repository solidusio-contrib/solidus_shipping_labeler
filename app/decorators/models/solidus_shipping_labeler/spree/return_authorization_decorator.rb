# frozen_string_literal: true

module SolidusShippingLabeler::Spree::ReturnAuthorizationDecorator
  def self.prepended(base)
    base.has_many :return_labels, class_name: "Spree::ReturnLabel"
  end

  Spree::ReturnAuthorization.prepend self
end
