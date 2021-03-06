require 'rails_helper'

RSpec.describe Dog, type: :model do

  before(:each) {
    @user = FactoryGirl.create(:user)
    @user.dogs << Dog.create(name: "Lucky", breed: "Siberian Husky", date_of_birth: "2001-01-01", registered_until: (Date.today + 6.months))
    @dog = @user.dogs.last
  }

  it "has a name" do
    expect(@dog.name).to eq("Lucky")
  end

  it "has a breed" do
    expect(@dog.breed).to eq("Siberian Husky")
  end

  it "has a date of birth" do
    expect(@dog.date_of_birth).to match(Date.parse("2001-01-01"))
  end

  it "is registered for a certain period of time" do
    expect(@dog.registered_until).to eq(Date.today + 6.months)
  end

  describe "#registration_cost" do
    it "returns the cost of dog's registration time period in dollars" do
      expect(@dog.registration_cost).to eq("$65")

    end
  end

  describe "#remaining_time_registered" do
    it "returns a string of the time remaining of dog's registration period" do
      expect(@dog.remaining_time_registered).to eq("6 months")
    end
  end

end
