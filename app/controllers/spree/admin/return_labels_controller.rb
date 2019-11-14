# frozen_string_literal: true

module Spree
  module Admin
    class ReturnLabelsController < Spree::Admin::BaseController
      def show
        order = Spree::Order.where(number: params[:order_id]).first
        rma   = order.return_authorizations.find(params[:return_authorization_id])
        label = rma.return_labels.find(params[:id])

        send_data(label.pdf_text, type: 'application/pdf', disposition: 'inline')
      end
    end
  end
end
