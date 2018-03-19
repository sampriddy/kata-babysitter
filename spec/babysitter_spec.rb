require 'rspec'
require './lib/babysitter'

describe Babysitter do
  describe '.calculate_pay(start_time, end_time, bedtime)' do
    subject { described_class.calculate(start_time, end_time, bed_time) }

    let(:bed_time) { Time.new(2018, 03, 18, 22) }

    context 'when start_time == end_time' do
      # Simple case, the babysitter shows up and immediately leaves.

      let(:start_time) { Time.new(2018, 03, 18, 17) }
      let(:end_time) { start_time }

      it 'returns 0' do
        expect(subject).to eq(0)
      end
    end

    context 'working one full hour before bedtime' do
      let(:start_time) { Time.new(2018, 03, 18, 17) }
      let(:end_time) { Time.new(2018, 03, 18, 18) }

      it 'returns 12' do
        expect(subject).to eq(12)
      end
    end

    context 'working one full hour after bedtime' do
      let(:start_time) { Time.new(2018, 03, 18, 23) }
      let(:end_time) { Time.new(2018, 03, 18, 24) }

      it 'returns 8' do
        expect(subject).to eq(8)
      end
    end
  end
end
