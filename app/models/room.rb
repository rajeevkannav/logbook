class Room < ApplicationRecord

  ##### Associations #####################
  has_many :visitor_entries, inverse_of: :room, dependent: :destroy
  has_many :visitors, through: :visitor_entries
  has_many :uniq_visitors, -> {distinct}, through: :visitor_entries, source: :visitor

  ### Assuming that all input is logically well-formed: for each person entering a room,
  ### he or she will always leave it at some point in the future.
  ### A visitor will only be in one room at a time.
  def durations(visitor)
    visitor_entries.where(visitor: visitor).order(:visited_at).collect do |v_e|
      v_e.visited_at
    end.each_slice(2).collect {|i_o| (i_o[1] - i_o[0]) rescue 0.0}

    #############
    # In-case of input is mal-formed
    # expected_direction ||= 'I'
    # visitor_entries.where(visitor: visitor).order(:visited_at).collect do |v_e|
    #   raise 'InValidVisitorEntries' if expected_direction != v_e.direction
    #   expected_direction = ((expected_direction == 'I') ? 'O' : 'I')
    #   v_e.visited_at
    # end.each_slice(2).collect {|chunk| chunk[1] - chunk[0]}
    #############
  end

  def average_durations
    uniq_visitors.collect {|visitor| durations(visitor)}.flatten.sum / uniq_visitors.count
  end

  def uniq_visitors_count
    uniq_visitors.count
  end

  def self.all_result_set
    all.collect {|room| [room.id, room.uniq_visitors_count, room.average_durations]}
  end
end
