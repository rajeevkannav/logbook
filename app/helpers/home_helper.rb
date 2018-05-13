module HomeHelper

  def readable_inference(room: nil, average_duration: nil, visitors: nil)
    "Room #{room}, #{average_duration} minute average visit, #{visitors} visitor(s) total"
  end
end
