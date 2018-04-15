class Subscriber < ActiveRecord::Base
  validates :f_name, :l_name, :email, :country, presence: true
end
