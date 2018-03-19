require 'rspec'
require './lib/babysitter'

describe 'Babysitter.calculate(start, stop, bedtime)' do
  let(:bed) { 22 }

  subject { Babysitter.new(start, stop, bed).calculate_wages }

  context 'start and stop are both 5 PM' do
    let(:start) { 17 }
    let(:stop)  { 17 }

    it 'returns 0' do
      expect(subject).to eq 0
    end
  end

  context 'babysitter works from 5 to 6 PM' do
    let(:start) { 17 }
    let(:stop)  { 18 }

    it 'returns 12' do
      expect(subject).to eq(12)
    end
  end

  context 'babysitter works 1 hour between bed and midnight' do
    let(:start) { 22 }
    let(:stop)  { 23 }

    it 'returns 8' do
      expect(subject).to eq(8)
    end
  end

  context 'babysitter works 1 hour after midnight' do
    let(:start) { 1 }
    let(:stop)  { 2 }

    it 'returns 16' do
      expect(subject).to eq(16)
    end
  end

  context 'realistic example for sanity checking' do
    let(:start) { 17 }
    let(:stop)  { 2  }
    let(:bed)   { 22 }

    # 5 hours before bed = $60
    # 2 hours between bed and midnight = $16
    # 2 hours after midnight = $32
    # total: $108

    it 'returns 108' do
      expect(subject).to eq(108)
    end
  end
end
