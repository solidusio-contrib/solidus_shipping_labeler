Deface::Override.new(
  :virtual_path => "spree/admin/return_authorizations/edit",
  :name => "add_return_labels_to_rma_edit",
  # :insert_after => "erb[loud]:contains('form_for'):contains('@return_authorization')",
  :insert_after => "[data-hook=bottom-of-return-authorization-edit]",
  :partial => "spree/admin/return_authorizations/return_shipping_labels"
)
