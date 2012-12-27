class User < ActiveRecord::Base
  attr_accessible :name

  def self.deliver id
    sleep 10
    puts "this user is delivered"
  end

end
