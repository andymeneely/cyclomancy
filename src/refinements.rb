module Squib
  module ArrayExtras
    refine Array do
			def dot_svg
				map { |f| f.nil? ? nil : "#{f.downcase}.svg" }
			end

			def suffix(str)
				map { |f| "#{f}#{str}"}
			end

		end
  end
end