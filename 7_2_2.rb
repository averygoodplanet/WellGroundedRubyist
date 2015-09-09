class Banner < String
  def +@
    upcase
  end

  def -@
    downcase
  end

  def !
    reverse
  end
end

banner = Banner.new("Run for your health.")
puts +banner
puts -banner
puts !banner