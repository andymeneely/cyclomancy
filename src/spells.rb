require 'squib'
require_relative 'version'
require_relative 'embeds'

# Note: run this code by running "rake" at the command line
# To see full list of options, run "rake -T"

# data = Squib.xlsx file: 'data/game.xlsx', sheet: 0
data = Squib.csv file: 'data/spells.csv'

def embed_icons(embed, keys)
  size = 85
  keys.each do |k,f|
    embed.svg key: k, file: f, width: size, height: size
  end
end

def embed_icons_keys(embed, keys)
  size = 32
  keys.each do |k,f|
    embed.svg key: k, file: f, width: size, height: size, dy: -30
  end
end

Squib::Deck.new(cards: data.nrows) do
  background color: :white
  use_layout file: 'layouts/spells.yml'

  svg file: 'spell.svg'

  text str: data.name, layout: :name
  text(str: data.reqs, layout: :reqs) { |e| embed_icons(e, letter_embeds) }
  text(str: data.desc, layout: :desc) { |e| embed_icons_keys(e, key_embeds) }
  text(str: data.desc2, layout: :desc2) { |e| embed_icons_keys(e, key_embeds) }

  text str: data.stacks, layout: :stacks

  text str: data.type, layout: :type

  cut_zone
  build(:proofs) do
    safe_zone
  end

  save_png    prefix: 'spell_'
  save_sheet prefix: '_sheet_spell_', columns: 4, rows: 3
  save_pdf file: 'sheet_spells.pdf'
end
