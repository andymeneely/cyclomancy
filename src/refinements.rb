module Squib
  module ArrayExtras
    refine Array do
			def dot_svg
				map { |f| "#{f.downcase}.svg"}
			end
		end
  end
end