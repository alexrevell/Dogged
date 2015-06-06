describe User do

  before(:each) { @user = User.new(email: 'user@example.com', name: 'User Name') }

  subject { @user }

  it { should respond_to(:email) }

  it "#email returns a string" do
    expect(@user.email).to match 'user@example.com'
  end

  it { should respond_to(:name) }

  it "#name returns a string" do
    expect(@user.name).to match 'User Name'
  end

end
