require 'rails_helper'

RSpec.describe VisitorEntry, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe 'Associations' do
    it {should belong_to :room}
    it {should belong_to :visitor}
  end


  describe 'Validations' do
    it {should validate_presence_of :direction}
    it {should validate_presence_of :visited_at}
  end

  describe 'Log file upload process' do
    context 'with blank log file' do
      it 'should given exception' do
        bool, message = VisitorEntry.make_entries(file_fixture("sample-blank.log"))
        expect(message).to eq('Not data found to account.')
        expect(bool).to eq(false)
      end
    end

    context 'with valid file' do
      it 'should given exception' do
        bool, message = VisitorEntry.make_entries(file_fixture("sample.log"))
        expect(message).to eq('Log file accounted successfully.')
        expect(bool).to eq(true)
      end
    end

  end


end
