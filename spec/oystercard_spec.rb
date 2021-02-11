require 'oystercard.rb'


describe OysterCard do

  min_fare = OysterCard::MIN_FARE

  describe '#balance' do
    it 'Checks that balance is 0' do
      expect(subject.balance).to eq 0
    end

    it "Sends an error if user tries to top up beyond £90 and rejects payment" do
      expect{subject.top_up(100)}.to raise_error "Limit of £#{:limit} exceeded: payment rejected."
    end
  end

  describe '#top_up' do
    it 'Enables a top up with an amount chosen by the user' do
      expect{subject.top_up(20)}.to change {subject.balance}.by(20)
    end
    it 'requires at least £1 to successfully tap in' do
      subject.top_up(0.9)
      expect{subject.touch_in('Brixton')}.to raise_error "Insufficient funds"
    end
  end

  describe '#touch_in' do
    it { is_expected.to respond_to :touch_in }
  end

  describe '#touch_out' do
    it { is_expected.to respond_to :touch_out }
    it 'deducts min fare when tapping out' do
      expect { subject.touch_out('station')}.to change{subject.balance}.by(- min_fare)
    end
  end

  describe '#in_journey' do
    it { is_expected.to respond_to :in_journey? }
    it 'Tracks whether card is in use' do
      subject.top_up(1)
      subject.touch_in('Finsbury Park')
      expect(subject.entry_station).to be_kind_of(String)
    end
    let(:entry_station) { double :entry_station}
      it "holds the entry station during the journey" do
        subject.top_up(4)
        subject.touch_in(:entry_station)
        expect(subject.entry_station).to eq :entry_station
      end
  end
  describe '#history' do
    it 'should register journey history' do
      subject.top_up(10)
      subject.touch_in('Brixton')
      subject.touch_out('Victoria')
      expect(subject.card_history).to eq [{entry: 'Brixton', exit: 'Victoria'}]
    end
  end
  end
