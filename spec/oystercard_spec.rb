require 'oystercard.rb'

describe OysterCard do

  #it { is_expected.to respond_to :check_balance }
  describe 'manages balance' do
    it 'Checks that balance is 0' do
      expect(subject.balance).to eq 0
    end

    it "Sends an error if user tries to top up beyond £90 and rejects payment" do
      expect{subject.top_up(100)}.to raise_error "Limit of £#{:limit} exceeded: payment rejected."
    end
  end

  describe 'manages top ups and deductions' do
    it 'Enables a top up with an amount chosen by the user' do
      expect{subject.top_up(20)}.to change {subject.balance}.by(20)
    end
    
    it 'Enables a deduction to be made from the card' do
      subject.top_up(10)
      expect{subject.deduct(3)}.to change {subject.balance}.by(- 3)
    end
  end

  describe 'manages tapping in and out' do
    it { is_expected.to respond_to :touch_in}
  end
end
