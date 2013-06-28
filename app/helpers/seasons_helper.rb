module SeasonsHelper
  def ordinal(pos)
    if pos == 1
      'Winner'
    elsif pos == 2
      '2nd'
    elsif pos == 3
      '3rd'
    else
      "#{pos}th"
    end
  end
end
