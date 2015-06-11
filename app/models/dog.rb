class Dog < ActiveRecord::Base

  include ActionView::Helpers::DateHelper

  belongs_to :owner, class_name: 'User'


  def registration_cost

    registration_time = remaining_time_registered

    if registration_time == "3 months"
      @registration_fee = "$25"
    elsif registration_time == "6 months"
      @registration_fee = "$65"
    elsif registration_time == "about 1 year"
      @registration_fee = "$85"
    end

  end

  def remaining_time_registered
    distance_of_time_in_words(self.registered_until, Date.today)
  end

end
