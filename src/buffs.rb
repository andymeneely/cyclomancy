require 'squib'
require_relative 'version'
require_relative 'embeds'
require_relative 'refinements'
using Squib::ArrayExtras

data = Squib.csv file: 'data/buffs.csv'

def embed_icons(embed)
  size = 35
  key_embeds.each do |k,f|
    embed.svg key: k, file: f, width: size, height: size, dy: -size
  end
end

Squib::Deck.new(cards: data.nrows, width: 600, height: 825) do
  background color: :white
  use_layout file: 'layouts/buffs.yml'

  text layout: :name, str: data.name
  text layout: :type, str: data.type
  text layout: :desc, str: data.desc do |embed|
    embed_icons(embed)
  end

  svg file: data.name.dot_svg, layout: :icon

  cut_zone
  build(:proofs) do
    safe_zone
  end

  save_png    prefix: 'buffs_'
  save_sheet prefix: '_sheet_buffs_', columns: 3, rows: 3
  save_pdf file: 'buffs.pdf', trim: 37.5
end
