module SpreeShippingLabeler
  module Generators
    class InstallGenerator < Rails::Generators::Base
      def add_migrations
        run 'bundle exec rake railties:install:migrations FROM=solidus_shipping_labeler'
      end

      def run_migrations
        return(run 'bundle exec rake db:migrate') if ENV['RUN_MIGRATIONS'] == 'true'

        res = ask "Would you like to run the migrations now? [Y/n]"
        if res == "" || res.downcase == "y"
          run 'bundle exec rake db:migrate'
        else
          puts "Skipping rake db:migrate, don't forget to run it!"
        end
      end
    end
  end
end
