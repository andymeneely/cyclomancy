require 'squib'
require_relative 'version'
require_relative 'embeds'

# Note: run this code by running "rake" at the command line
# To see full list of options, run "rake -T"

# data = Squib.xlsx file: 'data/game.xlsx', sheet: 0
data = Squib.csv file: 'data/neighborhoods.csv'
File.open('data/neighborhoods.txt', 'w+') { |f| f.write data.to_pretty_text }

def embed_icons(embed, keys)
  size = 85
  keys.each do |k,f|
    embed.svg key: k, file: f, width: size, height: size
  end
end

def embed_icons_keys(embed, keys)
  size = 70
  keys.each do |k,f|
    embed.svg key: k, file: f, width: size, height: size, dy: -30
  end
end

Squib::Deck.new(cards: data.nrows) do
  background color: :white
  use_layout file: 'layouts/neighborhoods.yml'

  text str: data.name, layout: :name
  new_desc = data.desc.map {|str| str.gsub(",", "\n")}
  text(str: new_desc, layout: :desc) { |e| embed_icons_keys(e, key_embeds) }

  cut_zone
  build(:proofs) do
    safe_zone
  end

  save_png    prefix: 'neighborhood_'
  save_sheet prefix: '_sheet_neighborhood_', columns: 4, rows: 3
  save_pdf file: 'neighborhoods.pdf', trim: 37.5
end
