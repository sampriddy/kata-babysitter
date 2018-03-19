require 'rspec'
require './lib/babysitter'

describe Babysitter do
  describe '.calculate_pay(start_time, end_time, bedtime)' do
    subject { described_class.calculate(start_time, end_time, bed_time) }

    context 'when start_time == end_time' do
      # Simple case, the babysitter shows up and immediately leaves.

      let(:start_time) { Time.new(2018, 03, 18, 17) }
      let(:end_time) { start_time }
      let(:bed_time) { Time.new(2018, 03, 18, 22) }

      it 'returns 0' do
        expect(subject).to eq(0)
      end
    end
  end
end
