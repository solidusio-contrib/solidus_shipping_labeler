# What
This is intended to be a [Spree](https://github.com/spree/spree) extension that leverages the `fedex` gem to print RMA labels.

## Screenshot
![screenshot](http://i.imgur.com/tj7EqUP.png)

## install
* Add `gem 'spree_shipping_labeler', github: 'dpritchett/spree_shipping_labeler', branch: '2-0-stable'` to your `Gemfile`.
* ` rails g spree_shipping_labeler:install` to generate the migrations and seed the Shipping Box data.
