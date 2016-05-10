# Generate ZPLII shipping labels for thermal printers.
# Connects to FedEx and pulls in a plaintext label.
#
# Expects a Spree::Shipping::Package
require 'fedex'

module Utilities
  class LabelError < Exception; end

  class FedExLabeler
    attr_reader :package
    def initialize(pkg=nil)
      @package = pkg
    end

    # Create a shipping label for a given package. Supports Fedex
    #
    def generate
      fedex_generate
    end

    #######################
    # Private Instance Methods
    #######################

    private
    # Makes recursive labeling a bit easier to test
    def companion_labeler
      @companion_memo ||= self.class.new
    end

    def fedex_generate
      begin
        result = self.class.fedex_connection.label({
          packages: [
            {
              weight: { value: package.weight, units: "LB" },
              dimensions: {
                length: package.length,
                width:  package.width,
                height: package.height,
                units: "IN"
              },
              customer_references: [
                { type: "CUSTOMER_REFERENCE", value: package.order_number },
                { type: "RMA_ASSOCIATION",    value: package.rma_number },
              ],
            }
          ],
          recipient:  package.formatted_destination,
          shipper:    package.formatted_origin,
          label_specification: {
            image_type:       "PDF",
            filename:         package.return_filename,
          },
          service_type: service_name,
          shipping_options: {
            return_reason: package.return_reason,
          },
        })
      rescue Exception => err
        raise Utilities::LabelError, err.message
      end

      {
        label:           result.image,
        tracking_number: result.options[:tracking_number]
      }
    end

    def service_name
      SpreeShippingLabeler::FedExConnection.service_name_mappings.fetch('Fedex::Ground')
    end

    #######################
    # Private Class Methods
    #######################

    def self.fedex_connection
      SpreeShippingLabeler::FedExConnection.connection
    end
  end
end
