require 'rails_helper'

RSpec.describe Room, type: :model do

  describe 'Associations' do
    it {should have_many :visitor_entries}
    it {should have_many :visitors}
  end

  describe 'All results set components' do

    context 'with no records available' do
      it 'should return an empty array' do
        expect(Room.all_result_set).to eq([])
      end
    end

    context 'with sample records available' do


      it 'should return an valid value for durations for visitors per room' do
        bool, message = VisitorEntry.make_entries(file_fixture('sample.log'))
        expect(Room.first.average_durations).to eq(20.0)
        expect(Room.last.average_durations).to eq(20.0)
      end

      it 'should return an valid value visitors count per room' do
        bool, message = VisitorEntry.make_entries(file_fixture('sample.log'))
        expect(Room.first.uniq_visitors_count).to eq(1)
        expect(Room.last.uniq_visitors_count).to eq(1)
      end

    end

  end


end


