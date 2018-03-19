require 'rspec'
require './lib/babysitter'

describe 'Babysitter.calculate(start, stop, bedtime)' do
  let(:bed) { '10 PM' }

  subject { Babysitter.new(start, stop, bed).calculate_wages }

  context 'start and stop are both 5 PM' do
    let(:start) { '5 PM' }
    let(:stop)  { '5 PM' }

    it 'returns 0' do
      expect(subject).to eq 0
    end
  end

  context 'babysitter works from 5 to 6 PM' do
    let(:start) { '5 PM' }
    let(:stop)  { '6 PM' }

    it 'returns 12' do
      expect(subject).to eq(12)
    end
  end

  context 'babysitter works 1 hour between bed and midnight' do
    let(:start) { '10 PM' }
    let(:stop)  { '11 PM' }

    it 'returns 8' do
      expect(subject).to eq(8)
    end
  end

  context 'babysitter works 1 hour after midnight' do
    let(:start) { '1 AM' }
    let(:stop)  { '2 AM' }

    it 'returns 16' do
      expect(subject).to eq(16)
    end
  end

  context 'realistic example for sanity checking' do
    let(:start) { '5 PM' }
    let(:stop)  { '2 AM'  }
    let(:bed)   { '10 PM' }

    # 5 hours before bed = $60
    # 2 hours between bed and midnight = $16
    # 2 hours after midnight = $32
    # total: $108

    it 'returns 108' do
      expect(subject).to eq(108)
    end
  end
end
