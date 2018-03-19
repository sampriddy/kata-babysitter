require 'rspec'
require './lib/babysitter'

describe Babysitter do
  describe '.calculate_pay(start_time, end_time, bedtime)' do
    subject { described_class.new(start_time, end_time, bed_time) }

    let(:bed_time) { Time.new(2018, 03, 18, 22) }

    context 'when start_time == end_time' do
      # Simple case, the babysitter shows up and immediately leaves.

      let(:start_time) { Time.new(2018, 03, 18, 17) }
      let(:end_time) { start_time }

      it 'returns 0' do
        expect(subject.calculate_pay).to eq(0)
      end
    end

    context 'working one full hour before bedtime' do
      let(:start_time) { Time.new(2018, 03, 18, 17) }
      let(:end_time) { Time.new(2018, 03, 18, 18) }

      it 'returns 12' do
        expect(subject.calculate_pay).to eq(12)
      end
    end

    context 'working one full hour after bedtime' do
      let(:start_time) { Time.new(2018, 03, 18, 23) }
      let(:end_time) { Time.new(2018, 03, 18, 24) }

      it 'returns 8' do
        expect(subject.calculate_pay).to eq(8)
      end
    end

    context 'working one full hour after midnight' do
      let(:start_time) { Time.new(2018, 03, 19, 0) }
      let(:end_time) { Time.new(2018, 03, 19, 1) }

      it 'returns 16' do
        expect(subject.calculate_pay).to eq(16)
      end
    end

    context 'a really long babysitting session' do
      let(:start_time) { Time.new(2018, 03, 19, 17) }
      let(:bed_time) { Time.new(2018, 03, 19, 22) }
      let(:end_time) { Time.new(2018, 03, 20, 2) }

      # This includes 5 hours before bedtime, 2 hours between bedtime
      # and midnight and 2 hours after midnight. Some napkin math:
      # (5 * 12) + (2 * 8) + (2 * 16) == (60 + 16 + 32) == 108

      it 'returns 108' do
        expect(subject.calculate_pay).to eq(108)
      end
    end

    context 'start_time not between 5:00 PM and 4:00 AM' do
      let(:start_time) { Time.new(2018, 03, 18, 16) }
      let(:end_time) { Time.new(2018, 03, 20, 20) }

      it 'should raise an error about the invalid start_time' do
        msg = "start_time must be between 5:00 PM and 4:00 AM"
        expect { subject }.to raise_error(msg)
      end
    end

    context 'end_time not between 5:00 PM and 4:00 AM' do
      let(:start_time) { Time.new(2018, 03, 18, 17) }
      let(:end_time) { Time.new(2018, 03, 19, 16) }

      it 'should raise an error about the invalid end_time' do
        msg = "end_time must be between 5:00 PM and 4:00 AM"
        expect { subject }.to raise_error(msg)
      end
    end

    context 'end_time is before start_time' do
      let(:start_time) { Time.new(2018, 03, 18, 20) }
      let(:end_time) { Time.new(2018, 03, 18, 18) }

      it 'should raise an error about it' do
        msg = "end_time must be after start_time"
        expect { subject }.to raise_error(msg)
      end
    end
  end
end
