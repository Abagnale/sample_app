module ApplicationHelper
	
	def titre
		titre_base = "Simple App du Tutoriel Ruby on Rails"
		
		if @titre.nil?
			titre_base
		else
			titre_base + " | " + @titre
		end
	end

end
