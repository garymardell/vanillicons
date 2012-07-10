# vanillicons

A quick and simple way of using [vanillicons](http://vanillicon.com) in your next project. 

## Install
    gem install 'vanillicons'

## Usage
If you are using this in a Rails project, or a project using Bundler then add the following to your `Gemfile`  

    gem 'vanillicons', '0.1.0'

In your model or class include the Vanillicons module

    class User < ActiveRecord::Base
      include Vanillicons 
    end

And thats all it takes to get started, in your views you can now use the `#vanillicon_url` method.

    <%= image_tag @user.vanillicon_url %>


### Changing the field used
By default the gem will call a method `#email` on the object and hash that value. However you can change this to use any other field in the class, to change it you can do the following.

    class User < ActiveRecord::Base
      include Vanillicons 
    
      vanillicon :name
    end

The gem will now call the `#name` accessor to generate the image url.

### Changing the options

There are a couple of options that can be passed to the `#vanillicon_url` method. The defaults are the following.  

    {
      :size => 200, # Options are: 50, 100, 200
      :secure => true
    }

This sets the image size to 200px by 200px and to use https connection.  
You may override this when calling the `#vanillicon_url` method.  

    <%= image_tag @user.vanillicon_url(:size => 50, :secure => false) %>

Or in the class if you frequently use a particular set of options. 

    class User < ActiveRecord::Base
      include Vanillicons 
    
      vanillicon :email, :size => 100
    end


## Contributing to vanillicons
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2012 Gary Mardell. See LICENSE.txt for
further details.
