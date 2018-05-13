class VisitorEntry < ApplicationRecord

  ##### Constants ########################
  DIRECTIONS = %w(I O)

  ##### Validations ######################
  validates :direction, presence: true, inclusion: {in: DIRECTIONS}
  validates :visited_at, presence: true

  ##### Associations #####################
  belongs_to :room, inverse_of: :visitor_entries
  belongs_to :visitor, inverse_of: :visitor_entries

  def self.make_entries(log_file, reset_previous_data = true)

    Room.destroy_all if reset_previous_data
    _lines = File.readlines(log_file)
    number_of_log_lines = _lines.first.to_i

    raise 'Not data found to account.' if number_of_log_lines < 1

    _lines[1..number_of_log_lines].each do |line|
      visitor_id, room_index, direction, time = line.split(' ')
      raise 'Not data found to account.' if number_of_log_lines < 1
      if room_index.to_i < 100 and visitor_id.to_i < 1024 and time.to_f < 1440.0
        VisitorEntry.create(
            room: Room.find_or_create_by(id: room_index),
            visitor: Visitor.find_or_create_by(id: visitor_id),
            visited_at: time,
            direction: direction
        )
      end

    end
    return true, 'Log file accounted successfully.'
  rescue Exception => e
    return false, e.message
  end

end

