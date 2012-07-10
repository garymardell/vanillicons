require 'digest/md5'

module Vanillicons
  
  def self.included(base)    
    base.send :include, InstanceMethods
    base.send :extend, ClassMethods    
  end
  
  module ClassMethods
      
    attr_reader :vanillicon_field
    
    def vanillicon(field, options = {})
      options = options.is_a?(Hash) ? options : {}
      
      # Set the field to generate the url based on
      @vanillicon_field = field
      
      # Merge the options into the default options
      @vanillicon_options = self.vanillicon_defaults.merge(options)      
    end
  
    def vanillicon_defaults
      {
        :secure => true,
        :size => 200
      }
    end
    
    def vanillicon_options
      @vanillicon_options || self.vanillicon_defaults
    end
  end
  
  module InstanceMethods
    
    def vanillicon_url(options = {})
      options = options.is_a?(Hash) ? options : {}
      options = self.class.vanillicon_options.merge(options)
      
      vanillicon_host(options[:secure]) + vanillicon_id(options[:size]) + vanillicon_image_extension
    end
    
    def vanillicon_hash
      # Generate hash based on field set
      Digest::MD5.hexdigest(send(vanillicon_field).to_s)
    end
    
    def vanillicon_id(size)
      "#{vanillicon_hash}_#{exact_or_larger_size(size)}"
    end
    
    private
    
    def available_sizes
      [50, 100, 200]
    end
    
    def exact_or_larger_size(size)
      # If size is set use that
      if available_sizes.include? size
        size
      else
        sizes = available_sizes.sort
        
        # Get the largest size if the size given is greater than the largest value
        if size > sizes.last
          sizes.last
        else
          # Get the size next up from the size given
          sizes.reject { |s| s < size }.first
        end      
      end
    end
    
    def vanillicon_host(secure = true)
      (secure ? 'https' : 'http') + '://vanillicon.com/' 
    end
    
    def vanillicon_field
      self.class.vanillicon_field || :email
    end
    
    def vanillicon_image_extension
      '.png'
    end
    
  end
  
end