require 'squib'
require_relative 'embeds'
require_relative 'version'

data = Squib.csv file: 'data/armies.csv'

File.open('data/armies.txt', 'w+') { |f| f.write data.to_pretty_text }

def embed_icons(embed)
  size = 60
  key_embeds.each do |k,f|
    embed.svg key: k, file: f, width: size, height: size, dy: -30
  end
end

Squib::Deck.new(cards: data.nrows) do
	background color: :white
	use_layout file: 'layouts/armies.yml'

	svg file: 'army.svg'

	text layout: :name, str: data.name
	text layout: :attack, str: data.attack
	text layout: :retaliate, str: data.retaliate
	text(layout: :special, str: data.special) { |e| embed_icons(e) }
	text layout: :level, str: data.level
	text layout: :hp, str: data.hp
	text layout: :version, str: Cyclomancy::VERSION

	cut_zone
	safe_zone

	save_png prefix: 'army_'
	save_sheet prefix: '_sheet_army_', columns: 4, rows: 3
	save_pdf file: 'army.pdf', trim: 37.5
end