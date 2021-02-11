require 'journey.rb'
require 'oystercard.rb'

describe Journey do
let(:card) { OysterCard.new }

describe '#in_journey' do
  it { is_expected.to respond_to :in_journey? }

  it 'returns true if in journey' do
    card.top_up(1)
    card.touch_in('Finsbury Park')
    expect(subject.in_journey?).to eq true
  end
  # it 'Tracks whether card is in use' do
  #   card.top_up(1)
  #   subject.touch_in('Finsbury Park')
  #   expect(subject.entry_station).to be_kind_of(String)
  # end
  let(:entry_station) { double :entry_station}
    it "holds the entry station during the journey" do
      card.top_up(4)
      subject.touch_in(:entry_station)
      expect(subject.entry_station).to eq :entry_station
    end
  end

end
