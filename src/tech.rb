require 'squib'
require_relative 'version'
require_relative 'embeds'
require_relative 'refinements'
using Squib::ArrayExtras

data = Squib.csv file: 'data/tech.csv'
File.open('data/tech.txt', 'w+') { |f| f.write data.to_pretty_text }

def embed_icons(embed, keys)
  size = 40
  keys.each do |k,f|
    embed.svg key: k, file: f, width: size, height: size, dy: -40
  end
end

Squib::Deck.new(cards: data.nrows, width: 825, height: 600) do
  background color: :white
  use_layout file: 'layouts/tech.yml'

  text str: data.name, layout: :name
  text str: data.name, layout: :clear_name
  svg file: data.icon.suffix(" tech").dot_svg, layout: :icon

  text str: data.description, layout: :description do |embed|
    embed_icons(embed, key_embeds)
  end

  svg file: data.img, layout: :img

  cut_zone
  # build(:proofs) do
    safe_zone
  # end

  save_png    prefix: 'tech_'
  save_sheet prefix: '_sheet_tech_', columns: 4, rows: 6
  save_pdf file: 'tech.pdf', trim: 37.5
end
