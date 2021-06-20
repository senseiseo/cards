class Cardword < ApplicationRecord

  def time_to_next_appearance
		if reviewed_at.present?
			-[time_to_next_review.ago-reviewed_at,0].min
		else
			10.years 
		end
	end

  def time_to_next_review
    case group
    when 0
      0.seconds
    when 1
      5.seconds
    when 2
      25.seconds
    when 3
      2.minutes
    when 4
      10.minutes
    when 5
      1.hour
    when 6
      5.hours
    when 7
      1.day
    when 8
      5.days
    when 9
      25.days
    when 10
      4.months
    else
      10.years # если уровень группы вырос до 12 то не когда не будем показывать
    end
  end
end
