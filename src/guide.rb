require 'squib'
require_relative 'embeds'

Squib::Deck.new(width: '8in', height: '10in') do
	background color: :white
	use_layout file: 'layouts/guide.yml'

	guide_str = <<~EOS
<b>Elements</b>
:air: Air
:fire: Fire
:plant: Plant
:stone: Stone
:water: Water

<b>Meeples</b>
:mage: Mage
:laborers: Worker
:meeple: Mage or Worker

<b>Actions</b>
:sow: Sow
:mine: Mine
:research: Research
:balloon: Balloon
:forge: Forge
:decipher: Decipher
:grow: Grow
:hike: Hike

<b>Components</b>
:spell: Spell
EOS

	text layout: :desc, str: guide_str, markup: true do |embed|
		key_embeds.each do |(key, file)|
			embed.svg key: key, file: file, layout: :embed
		end
	end



	save_png prefix: 'guide', count_format: ''
end