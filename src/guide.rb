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
:worker: Worker
:meeple: Mage or Worker

<b>Overnight</b>
:recruit-mage: Increase Mage recruits
:recruit-worker: Increase Worker recruits
:gain: Gain a resource of your choosing

<b>Actions</b>
:sow: Sow
:mine: Mine
:research: Research
:balloon: Balloon
:forge: Forge
:grow: Grow
:hike: Hike
:cycle: Gain cycle token
:scout: Scout
:hide: Hide

<b>Buffs and Debuffs</b>
:strength: Strength
:weak: Weakened
:shield: Shield
:shield-broken: Broken shield
:confuse: Confuse.
:panic: Panic
:burning: Burning. Overnight, if you have any :fire:, convert all :plant: to :fire:. Take 1 damage for every :fire: :fire:

EOS

	text layout: :desc, str: guide_str, markup: true do |embed|
		key_embeds.each do |(key, file)|
			embed.svg key: key, file: file, layout: :embed
		end
	end

	save_png prefix: 'guide', count_format: ''
	save_pdf file: 'guide.pdf'
end