module ApplicationHelper

	def flash_class(level)
		case level
			when :success then "alert alert-success"
			when :notice then "alert alert-info"
			when :alert then "alert alert-warning"
			when :error then "alert alert-danger"
		end
	end

	def sport_alias(sport)
		case sport
			when "ProFootball" then "NFL"
			when "ProBaseball" then "MLB"
		end
	end
end
