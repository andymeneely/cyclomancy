require 'squib'
require_relative 'version'
require_relative 'embeds'

# Note: run this code by running "rake" at the command line
# To see full list of options, run "rake -T"

data = Squib.xlsx file: 'data/game.xlsx', sheet: 1

def embed_icons(embed, keys)
  size = 75
  keys.each do |k,f|
    embed.svg key: k, file: f, width: size, height: size
  end
end

Squib::Deck.new(cards: data.nrows) do
  background color: :white
  use_layout file: 'layouts/bonuses.yml'

  text str: data.type.map { |t| "#{t} Bonus" }, layout: :name
  text(str: data.bonus, layout: :bonus) { |e| embed_icons(e, LETTER_EMBEDS) }
  text(str: data.bonus2, layout: :bonus2) { |e| embed_icons(e, LETTER_EMBEDS) }
  text(str: data.power, layout: :power) { |e| embed_icons(e, KEY_EMBEDS) }

  text str: Cyclomancy::VERSION, layout: :version

  cut_zone
  build(:proofs) do
    safe_zone
  end

  save_png prefix: 'bonus_'
  save_sheet prefix: 'sheet_bonus_', columns: 8

end
