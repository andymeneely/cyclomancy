require 'squib'
require_relative 'embeds'
require_relative 'version'
require_relative 'refinements'

using Squib::ArrayExtras

data = Squib.csv file: 'data/secrets.csv'

File.open('data/secrets.txt', 'w+') { |f| f.write data.to_pretty_text }

def embed_icons(embed)
  size = 60
  key_embeds.each do |k,f|
    embed.svg key: k, file: f, width: size, height: size, dy: -30
  end
end

Squib::Deck.new(cards: data.nrows) do
	background color: :white
  use_layout file: 'layouts/base.yml'
	use_layout file: 'layouts/secrets.yml'

  text str: data.num, layout: :num
  text str: data.name, layout: :name
  text str: data.desc, layout: :desc

	cut_zone
	safe_zone

	save_png prefix: 'secrets_'
	save_sheet prefix: '_sheet_secrets_', columns: 4, rows: 3
	save_pdf file: 'secrets.pdf', trim: 37.5
end

Squib::Deck.new(cards: data.nrows) do
	background color: :white
  use_layout file: 'layouts/base.yml'
	use_layout file: 'layouts/secrets.yml'

	save_png prefix: 'secret_back_'
	save_sheet prefix: '_sheet_secret_back_', columns: 4, rows: 3
	save_pdf file: 'secret_back.pdf', trim: 37.5
end