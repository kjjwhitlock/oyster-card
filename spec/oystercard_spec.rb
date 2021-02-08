require 'oystercard.rb'

describe OysterCard do

  #it { is_expected.to respond_to :check_balance }

  it 'Checks that balance is 0' do
    expect(subject.balance).to eq 0
  end

end