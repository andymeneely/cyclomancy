require 'squib'
require_relative 'version'

# Note: run this code by running "rake" at the command line
# To see full list of options, run "rake -T"

data = Squib.xlsx file: 'data/game.xlsx', sheet: 1

Squib::Deck.new(cards: data.nrows, width: 550, height: 825) do
  background color: :white
  use_layout file: 'layouts/deciphers.yml'

  text str: data.name, layout: :name

  text str: Cyclomancy::VERSION, layout: :version

  cut_zone
  build(:proofs) do
    safe_zone
  end

  save_png    prefix: 'decipher_'
  save_sheet prefix: 'sheet_decipher_'
end
