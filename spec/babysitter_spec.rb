require 'rspec'
require './lib/babysitter'

describe 'Babysitter.calculate(start, stop, bedtime)' do
  let(:bed) { '10 PM' }

  subject { Babysitter }

  context 'start and stop are both 5 PM' do
    let(:start) { '5 PM' }
    let(:stop)  { '5 PM' }

    it 'returns 0' do
      expect(subject.new(start, stop, bed).calculate_wages).to eq 0
    end
  end

  context 'babysitter works from 5 to 6 PM' do
    let(:start) { '5 PM' }
    let(:stop)  { '6 PM' }

    it 'returns 12' do
      expect(subject.new(start, stop, bed).calculate_wages).to eq(12)
    end
  end

  context 'babysitter works 1 hour between bed and midnight' do
    let(:start) { '10 PM' }
    let(:stop)  { '11 PM' }

    it 'returns 8' do
      expect(subject.new(start, stop, bed).calculate_wages).to eq(8)
    end
  end

  context 'babysitter works 1 hour after midnight' do
    let(:start) { '1 AM' }
    let(:stop)  { '2 AM' }

    it 'returns 16' do
      expect(subject.new(start, stop, bed).calculate_wages).to eq(16)
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
      expect(subject.new(start, stop, bed).calculate_wages).to eq(108)
    end
  end

  context 'with invalid timestrings' do
    bad_times = ['73 PM', 'Snackbot', '10 PM 5 AM', '', '5', '5 AM']

    bad_times.each do |bad_time|
      it "you're gonna have a bad time..." do
        msg = "invalid timestring: #{bad_time}. Valid examples: '4 AM', '10 PM'"
        expect{subject.new(bad_time, '10 PM', '10 PM')}.to raise_error(msg)
        expect{subject.new('10 PM', bad_time, '10 PM')}.to raise_error(msg)
        expect{subject.new('10 PM', '10 PM', bad_time)}.to raise_error(msg)
      end
    end
  end

  context 'babysitter starts before 5 PM' do
    let(:start) { '4 PM' }

    it 'raises an error' do
      msg = "invalid timestring: #{start}. Valid examples: '4 AM', '10 PM'"
      expect{subject.new('4 PM', '10 PM', '10 PM')}.to raise_error(msg)
    end
  end

  context 'babysitter stops after 4 AM' do
    let(:stop) { '5 AM' }

    it 'raises an error' do
      msg = "invalid timestring: #{stop}. Valid examples: '4 AM', '10 PM'"
      expect{subject.new('10 PM', stop, '10 PM')}.to raise_error(msg)
    end
  end
end
