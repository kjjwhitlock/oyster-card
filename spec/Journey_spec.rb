require 'journey.rb'

describe Journey do
let(:station) { double :station, zone: 1}
let(:card) { double :card, balance: 20, card_history: [], entry_station: "Finsbury Park"}

describe '#in_journey' do
  it { is_expected.to respond_to :in_journey? }

  it 'returns true if in journey' do
    expect(subject.in_journey?).to eq true
  end

    it "holds the entry station during the journey" do
      expect(card.entry_station).to eq "Finsbury Park"
    end
  end
  end
