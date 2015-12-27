module Spree
  class ReturnAddressor
    attr_reader :rma, :order, :return_label

    def initialize(return_label)
      @return_label = return_label
      @rma          = return_label.return_authorization
      @order        = rma.order
      self
    end

    def box
      return_label.shipping_box
    end

    def height; box.height; end
    def length; box.length; end
    def width;  box.width;  end

    def weight
      calc_weight = rma.inventory_units.flat_map(&:variant).sum(&:weight)
      calc_weight.zero? ? default_weight : calc_weight
    end

    def return_filename
      "Return filename Goes Here"
    end

    def return_reason
      rma.reason
    end

    def order_number
      order.number
    end

    def rma_number
      rma.number
    end

    def formatted_origin
      order.shipping_address.fedex_formatted
    end

    def formatted_destination
      base = Spree::StockLocation.return_processing.fedex_formatted
      base.merge({
        name: care_of
      })
    end

    def care_of
      base = SpreeShippingLabeler::FedExConnection.connection_params[:care_of]
      base.blank? ? base : "co #{base}"
    end

    def generate_label!
      labeler.generate
    end

    def labeler
      Utilities::FedExLabeler.new(self)
    end

    def default_weight
      1.0 # pounds
    end
  end
end
