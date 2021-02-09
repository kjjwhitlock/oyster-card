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
    it { is_expected.to respond_to :touch_in }

    it { is_expected.to respond_to :touch_out }

    it { is_expected.to respond_to :in_journey? }

    it 'Tracks whether card is in use' do
##########      allow(subject).to receive(:top_up).and_return(1)
      subject.top_up(1)
      subject.touch_in
      expect(subject.in_journey?).to eq true
    end
    it 'requires at least £1 to successfully tap in' do
      subject.top_up(0.9)
      expect{subject.touch_in}.to raise_error "Insufficient funds"
    end
    it 'deducts min fare when tapping out' do
      min_fare = OysterCard::MIN_FARE
      expect { subject.touch_out}.to change{subject.balance}.by(- min_fare)
    end
    let(:entry_station) { double :entry_station}
      it "holds the entry station during the journey" do
        subject.top_up(4)
        subject.touch_in(:entry_station)
        expect(subject.entry_station).to eq :entry_station
      end
  end
end
=begin      
      subject.top_up(4)
      subject.touch_in("Barnes")
      expect (subject.entry_station).to include 'Barnes'
=end