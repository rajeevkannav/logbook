# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#VisitorID RoomIndex Direction TimeStamp
sample_log = <<-SLOG
0 0 I 540
1 0 I 540
0 0 O 560
1 0 O 560
0 1 I 540
1 1 I 540
0 1 O 560
1 1 O 560
SLOG

sample_log.each_line do |line|
  visitor_id, room_index, direction, time = line.split(' ')
  room = Room.find_or_create_by(id: room_index)
  room.visitor_entries.create(visited_at: Time.now, direction: direction, visitor: Visitor.find_or_create_by(id: visitor_id))
end



