require 'squib'

data = Squib.csv file: 'data/armies.csv'
File.open('data/armies.txt', 'w+') { |f| f.write data.to_pretty_text }

Squib::Deck.new(cards: data.nrows) do
	background color: :white
	use_layout file: 'layouts/armies.yml'

	text layout: :name, str: data.name

	cut_zone
	safe_zone

	save_png prefix: 'army_'
	save_sheet prefix: '_sheet_army_', columns: 5, rows: 3
end