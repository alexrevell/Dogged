require "rails_helper"

RSpec.describe RegistrationMailer, type: :mailer do


  describe "dogged_registration" do

    before do
      @user = FactoryGirl.create(:user)
      @user.dogs << (@dog = FactoryGirl.create(:dog))
      @emailer = RegistrationMailer.dogged_registration(@user, @dog)
    end

    it "uses the 'dogged-registration' template " do
      expect(@emailer.template_name).to eq("dogged-registration")
    end

    it "includes a subject in the confirmation email" do
      expect(@emailer.message['subject']).to eq("Dogged Registration")
    end

    it "renders the default sender email" do
      expect(@emailer.message['from_email']).to eq("hello@dogged.com")
    end

    it "renders the receiver email" do
      expect(@emailer.message['to'].first['email']).to eq(@user.email)
    end

  end


end
