require 'oystercard.rb'

describe OysterCard do

  #it { is_expected.to respond_to :check_balance }

  it 'Checks that balance is 0' do
    expect(subject.balance).to eq 0
  end
  it 'Enables a top up with an amount chosen by the user' do
    expect{subject.top_up(20)}.to change {subject.balance}.by(20)
  end
  it "Sends an error if user tries to top up beyond £90 and rejects payment" do
    expect{subject.top_up(100)}.to raise_error "Limit of £#{:limit} exceeded: payment rejected."
  end
end
