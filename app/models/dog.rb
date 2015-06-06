class Dog < ActiveRecord::Base

  belongs_to :owner, class => 'User'

end
