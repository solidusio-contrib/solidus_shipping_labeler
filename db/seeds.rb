# frozen_string_literal: true

dimensions = [
  ['(7x7x7)', '7x7x7'],
  ['(12x12x8)', '12x12x8'],
  ['(15x15x8)', '15x15x8'],
  ['(24x12x12)', '24x12x12'],
  ['(36x12x12)', '36x12x12'],
  ['(24x24x12)', '24x24x12'],
  ['(48x24x12)', '48x24x12']
]

dimensions.each do |desc, lwh|
  l, w, h = lwh.split('x')

  box = Spree::Shipping::Box.where(
    description: desc,
    length: l,
    width: w,
    height: h
  ).first_or_create!

  puts "Ensured existence of shipping box #{box.description}"
end
