# frozen_string_literal: true

Deface::Override.new(
  virtual_path: "spree/admin/return_authorizations/edit",
  name: "add_return_labels_to_rma_edit",
  # :insert_after => "erb[loud]:contains('form_for'):contains('@return_authorization')",
  insert_after: "[data-hook='return-authorization-form-wrapper']",
  partial: "spree/admin/return_authorizations/return_shipping_labels"
)
