describe User do

  before(:each) { @user = User.new(email: 'user@example.com', name: 'User Name', address: 'Wooftown, Dogville') }

  subject { @user }

  it { should respond_to(:email) }

  it "#email returns a string" do
    expect(@user.email).to match 'user@example.com'
  end

  it { should respond_to(:name) }

  it "#name returns a string" do
    expect(@user.name).to match 'User Name'
  end

  it { should respond_to(:address) }

  it "#address returns a string" do
    expect(@user.address).to match 'Wooftown, Dogville'
  end

end
