require 'squib'
require_relative 'version'
require_relative 'embeds'

# Note: run this code by running "rake" at the command line
# To see full list of options, run "rake -T"

data = Squib.xlsx file: 'data/game.xlsx', sheet: 0

Squib::Deck.new(cards: data.nrows) do
  background color: :white
  use_layout file: 'layouts/spells.yml'

  text str: data.name, layout: :name
  text(str: data.reqs, layout: :reqs) { |e| embed_icons(e, LETTER_EMBEDS) }
  text(str: data.damage, layout: :damage)

  text str: Cyclomancy::VERSION, layout: :version

  cut_zone
  build(:proofs) do
    safe_zone
  end

  save_png    prefix: 'spell_'
  save_sheet prefix: 'sheet_spell_', columns: 4
  save_pdf file: 'sheet_spell_'
end
