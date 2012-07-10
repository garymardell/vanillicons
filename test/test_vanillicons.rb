require 'helper'

class TestVanillicons < Test::Unit::TestCase
  
  def setup
    # Create a new class with an email method
    @klass = Class.new do |c|
      c.send(:include, Vanillicons)
      c.send(:attr_accessor, :email)
    end
    
    # Create a new instance with example email
    @instance = @klass.new
    @instance.email = 'example@example.com'
  end
  
  should "have the method vanillicon" do
    assert @klass.respond_to? :vanillicon
  end
  
  should "have the method vanillicon_url" do
    assert @klass.method_defined? :vanillicon_url
  end
  
  should "give the secure host" do
    assert_equal "https://vanillicon.com/", @instance.send(:vanillicon_host, true)
  end
  
  should "give the non-secure host" do
    assert_equal "http://vanillicon.com/", @instance.send(:vanillicon_host, false)
  end
  
  should "default to secure host" do
    assert_equal "https://vanillicon.com/", @instance.send(:vanillicon_host)
  end
  
  should "give the available sizes" do
    assert_equal [50, 100, 200], @instance.send(:available_sizes)
  end
  
  should "give size or larger size" do
    assert_equal 50, @instance.send(:exact_or_larger_size, 20)
    assert_equal 50, @instance.send(:exact_or_larger_size, 50)
    
    assert_equal 100, @instance.send(:exact_or_larger_size, 60)
    assert_equal 100, @instance.send(:exact_or_larger_size, 99)
    assert_equal 100, @instance.send(:exact_or_larger_size, 100)
    
    assert_equal 200, @instance.send(:exact_or_larger_size, 110)
    assert_equal 200, @instance.send(:exact_or_larger_size, 199)
    assert_equal 200, @instance.send(:exact_or_larger_size, 200)
    assert_equal 200, @instance.send(:exact_or_larger_size, 500)    
  end
  
  should "default field to email" do
    assert_equal :email, @instance.send(:vanillicon_field)
  end
  
  should "have field of name" do  
    @instance.class.vanillicon :name
    assert_equal :name, @instance.send(:vanillicon_field)
  end
  
  should "md5 hash field" do
    assert_equal "23463b99b62a72f26ed677cc556c44e8", @instance.vanillicon_hash
  end
  
  should "generate vanillicon url for { :size => 50, :secure => false }" do
    assert_equal "http://vanillicon.com/23463b99b62a72f26ed677cc556c44e8_50.png", @instance.vanillicon_url(:size => 50, :secure => false)
  end
  
  should "generate vanillicon for size 200 url for { :size => 300 }" do
    assert_equal "https://vanillicon.com/23463b99b62a72f26ed677cc556c44e8_200.png", @instance.vanillicon_url(:size => 300)
  end
  
end
