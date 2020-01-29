# solidus_shipping_labeler

[![CircleCI](https://circleci.com/gh/solidusio-contrib/solidus_shipping_labeler.svg?style=svg)](https://circleci.com/gh/solidusio-contrib/solidus_shipping_labeler)

Note: Currently this gem is written only for FedEx shipping labels. 

This [Solidus](https://github.com/solidusio/solidus) extension leverages the `fedex` gem to print FedEx labels for your Return Authorizations (RAs). It provides two new tables to store the labels and a utility table to store box sizes. On the Admin screen, it provides Admin operators the ability to generate a new FedEx label automatically, using the customer's address as the 'from' address and Stock location that will be receiving the package as the 'to' address. 

The labels are generated as PDF and are compliant with FedEx's requirements for computer generated labels (in fact, FedEx generates the PDF and sends it back to us and all you need to do is send the PDF). Note that this requires a FedEx account and you will need to set up "FedEx Web Services" for you account (speak to your FedEx account manager or call FedEx support for assistance).  

During the setup process, FedEx will require you to generate a sample label, print it out, and send it back to them. 


## Screenshot
![screenshot](http://content.screencast.com/users/JasonFB/folders/Jing/media/b46a8034-ac78-4204-8f46-9ce5b1635d27/00001333.png)

# Installation
* Add to your Gemfile & bundle install
```
gem 'solidus_shipping_labeler', github: 'solidusio-contrib/solidus_shipping_labeler'
```

* to generate the migrations and seed the Shipping Box data
```
bundle exec rake railties:install:migrations FROM=solidus_shipping_labeler
```

* In your app, create a new file at ```initializers/fed_ex.rb```

```
fed_ex_config = YAML.load_file("config/fedex_api.yml")[Rails.env]

SolidusShippingLabeler::FedExConnection.config({
    key:            fed_ex_config["key"],
    password:       fed_ex_config["password"],
    meter:          fed_ex_config["meter"],
    account_number: fed_ex_config["account_number"],
    mode:           fed_ex_config["mode"]
})

```

(you will of course need a file at ```config/fedex_api.yml``` with YAML-based configuration. here's an example file https://gist.github.com/jasonfb/8a4f51da2c809a9d971a8aad1f26495e)

*If you prefer to use ENV variables for configuration instead of storing credentials in your source, modify your initialization file accordingly.*



# Structure

* spree_shipping_boxes

| field	      | datatype  |
|-------------|-----------|
| description | string  |
| length      | integer |
| width       | integer |
| height      | integer |

(and timestamp fields)

* spree_return_labels

| field	      | datatype  |
|-------------|-----------|
| return_authorization_id      | integer  |
| spree_shipping_box_id      | integer  |
| weight      | decimal  |
| tracking_number      | string |
| width       | integer |
| height      | integer |

(and timestamp fields)

* The migration generator will also generate a migration that will run the seed generator (found in ```db/seeds.rb```)

# Configuration
Make sure your stock location has complete address and phone number details. (FedEx requires a phone number to generate a label and will complain if one is not present.)


# Admin Use

1. On a completed and shipped order, create a new RA (Return Authorization)
2. After you create the RA, you will land back on the screen showing the list of RAs associated with that order
3. Edit your RA, at the bottom of the screen you will see a drop-down to choose the box size and a button "Generate New Label"
4. You will see a numeric key corresponding to the new label. When you click it, it will open in a new window allowing you to print as PDF or print directly from your computer. 

Note although it is an edge case, you can create multiple labels for a single Return Authorization. For example, if the customer needed to send more than one box back or might have used the first label issued. 



