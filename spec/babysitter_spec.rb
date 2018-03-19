require 'rspec'

describe 'Babysitter.calculate(start, stop, bedtime)' do
  let(:bed)   { 22 }

  subject { Babysitter.new(start, stop, bed).calculate_wages }

  context 'start and stop are both 5 PM' do
    let(:start) { 17 }
    let(:stop)  { 17 }

    it 'returns 0' do
      expect(subject).to eq 0
    end
  end
end
