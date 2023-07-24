require 'squib'
require_relative 'version'
require_relative 'embeds'
require_relative 'refinements'
using Squib::ArrayExtras

data = Squib.csv file: 'data/prestige.csv'

def embed_icons(embed, keys)
  size = 40
  keys.each do |k,f|
    embed.svg key: k, file: f, width: size, height: size, dy: -40
  end
end

Squib::Deck.new(cards: data.nrows, width: 825, height: 600) do
  background color: :white
  use_layout file: 'layouts/prestige.yml'

  text str: data.name, layout: :name
  text str: data.name, layout: :clear_name
  svg file: data.icon.suffix(" prestige").dot_svg, layout: :icon

  text str: data.description, layout: :description do |embed|
    embed_icons(embed, key_embeds)
  end

  svg file: data.img, layout: :img

  cut_zone
  # build(:proofs) do
    safe_zone
  # end

  save_png    prefix: 'prestige_'
  save_sheet prefix: '_sheet_prestige_', columns: 4, rows: 6
  # save_pdf file: 'prestige.pdf', trim: 37.5
end
