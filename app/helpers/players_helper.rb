module PlayersHelper

  def choose_positions(player)
    array = []
    Position.all.each do |p|
      array.push(p)
    end
    player.positions.each do |pos|
      array.keep_if { |a| a.id != pos.id }
    end
    array
  end

end
