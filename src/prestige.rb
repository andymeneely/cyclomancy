require 'squib'
require_relative 'version'
require_relative 'embeds'

data = Squib.csv file: 'data/prestige.csv'

Squib::Deck.new(cards: data.nrows, width: 825, height: 600) do
  background color: :white
  use_layout file: 'layouts/prestige.yml'

  cut_zone
  build(:proofs) do
    safe_zone
  end

  save_png    prefix: 'prestige_'
  save_sheet prefix: '_sheet_prestige_', columns: 4, rows: 3
  save_pdf file: 'prestige.pdf', trim: 37.5
end
