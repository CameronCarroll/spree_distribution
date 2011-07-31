Spree Distribution
===============

Spree distribution is a simple distribution solution for Spree Commerce. Spree distribution adds a distributor login and signup page as well as an admin to approve and deny applicants.


Installation
------------


If you're on Spree 0.50.0 and above, you'll have to install Spree Distribution from the source since I haven't released it yet. Just add this to your Gemfile:

    # spree 0.70.x
    gem 'spree_distribution', :git => 'git://github.com/citrus/spree_distribution'
    
    # spree 0.60.x
    gem 'spree_distribution', :git => 'git://github.com/citrus/spree_distribution', :branch => '0.60.x'
    
    # spree 0.50.x
    gem 'spree_distribution', :git => 'git://github.com/citrus/spree_distribution', :branch => '0.50.x'
    

Otherwise just use the last stable release:
    
    gem 'spree_distribution', '0.40.2.2'
    
    
Then install the necessary migrations, db:migrate, and create the distribution role:

    # spree 0.50.x and above
    rails g spree_distribution:install
    rake db:migrate spree_distribution:create_role

    # legacy spree
    rake spree_distribution:install
    rake db:migrate spree_distribution:create_role
      
      
If you'd like to generate sample distribution prices based on a 66% discount:

    rake spree_distribution:assume_distribution_prices



Testing
-------

If you'd like to run tests:
    
    git clone git://github.com/citrus/spree_distribution.git
    cd spree_distribution
    bundle install
    bundle exec dummier
    bundle exec rake


Demo
----

If you'd like a demo of spree_distribution:
    
    git clone git://github.com/citrus/spree_distribution.git
    cd spree_distribution
    mv test/dummy_hooks/after_migrate.rb.sample mv test/dummy_hooks/after_migrate.rb
    bundle install
    bundle exec dummier
    cd test/dummy
    rails s
    


To Do
-------

* Write more/better tests
* Finish i18n implementation 


Known Issues
-------

* A user created in the 'user' tab, or an already existing user with an added 'distributor' flag will not be able to purchase at distribution price. They will see the retail and distribution price, but when added to cart will purchase at retail price. Only accounts created using distribution interface work properly.
* Deface override for admin_tabs (Adds distributors tab to admin interface) isn't targeting hook correctly, and has been set to insert to bottom of the div#store-menu ul instead.


Contributors
------------

* Spencer Steffen ([@citrus](https://github.com/citrus))
* Cameron Carroll ([@sanarothe](https://github.com/sanarothe))


License
-------

Copyright (c) 2011 Spencer Steffen and Citrus, released under the New BSD License All rights reserved.
