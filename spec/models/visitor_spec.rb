require 'rails_helper'

RSpec.describe Visitor, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe 'Associations' do
    it {should have_many :visitor_entries}
    it {should have_many :rooms}
  end


end
