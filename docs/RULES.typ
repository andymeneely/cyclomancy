#import "@preview/in-dexter:0.0.6": *
#set enum(numbering: "1.a)")
#set page(
  width: 7in,
  height: 8.625in,
  margin: (inside: 0.5in),
  numbering: "1"
)
#set text(
  spacing: 80%,
  font: "Georgia",
)
#set par(leading: 0.40em)

#let capitalize(str) = {
    upper(str.text.first()) + str.text.slice(1)
}

#let action(name) = {
    strong(capitalize(name)) + box(image("../img/" + name.text + ".svg"),
            width: 1em)
    index(name + image("../img/" + name.text + ".svg"))
}

= Cyclomancy

= Component List

TBD

= Setup

+ Each player gets a *Player Sheet*, along with a pen or pencil to each player. Write your name and name your town at the top.
+ *Separate the cards* according to their backs and shuffle each pile facedown, i.e.
    - Starter spells #index[spells]
    - Super Spells
    - Normal Enemies
    - Elite Enemies
    - Neighborhoods
+ *Prepare Spells.*
    - Deal 2 starter spell cards to each player, face up.
    - Place both spell decks face down in reach of all players.
+ *Prepare Enemies*. You will have 2/3/4 piles for 2/3/4 players.
    + Find the Dark Mage card and deal 5/8/11 other Elite enemies facedown.
    + Shuffle the Dark Mage into the Elite enemies, then deal them into 2/3/4 piles.
    + Then, deal 3 Normal Enemies on top of each pile.
    + The result should a number piles equal to the number of players, each with 3 Elite and 3 Normal Enemies, with the Dark Mage unknown somewhere in the Elites.
+ Place the *Resources and Meeples* in reach of everyone at the table, including:
    + Water
    + Plantsx
    + Stone
    + Fire
    + Wind
    + Workers
    + Mages
+ Set up *Neighborhood* cards:
    + Deal 3 cardss face-up to each player.
    + You may (*should!*) openly discuss what spells and neighborhood cards you have with other players.
    + Each player chooses 2 Neighborhood cards to apply to their towns.
    + Fill in the corresponding tracks according to your card (see *Tracks* if this is your first game). You may also spend your Workers and Mages during this phase.
    + After choosing, place the discarded Neighborhood cards in the box.

= Gameplay

The order of play loops between:

+ Player phase
+ Overnight
    + Income
    + Grow crops
    + Gamble
    + Buffs and Debuffs effects
    + Cycle spells
    + Enemy phase


During the *Player Phase*, players may spend their Mages, Workers, and Resources on their City Sheet, as well as cast a spell (see Casting Spells). The player phase is simultaneous, collaborative play. Players have no secrets to keep from each other, and are encouraged to discuss and to help each other.

For *Income*, each player gains a :water: for each circle in :water-income:, similarly for :mage-income:, and :worker-income:. #index[income]

For Grow, players may spend Water :water: to grow their crops. See Farm section for how growing works.

For *Gamble*, roll 2d6 two times. Each player gains the bonus if a Bet :bet: has been filled in on that slot. #index[gamble]

For *Buffs and Debuffs*, apply any effects if Players or Enemies have them (e.g. Burning).

For *Cycle Spells*, every player passes their Active Spell to the player to their left. If that spell was previously cast, turn it back upright. Any resources placed on this spell may stay with this spell during this Cycle phase.


= City Sheet

The City Sheet represents your town and all of the resources it has to offer. Every time there is an arrow, that means you spend what is in the arrow to gain what it points to.

[Annotated City Sheet figure]

1. All places to spend Meeples are along the left-side, that is: Town Hall, University, Rangers.
2. The spaces in the Town Hall to the right of the heart is your Health.
3. All Prestige bonuses are along the right side, and are locked at game start. Some Neighborhoods unlock these, and all are available to unlock in multiple places
4. The Gate is the area that the Dark Mage’s army token will sit when it is at your town.
5. This is where your Active Spell sits.

== Town Hall & University

These are the primary places where you spend your Workers and Mages. When you spend a Worker or Mage, fill in the next slot on the track from left to right, then gain what is in the slot.

At the right side of the Town Hall tracks are slots for your Health. See *Taking Damage.*

== Scouting Party

The Scouting Party takes a Worker or Mage and you fill in a pentagon-shaped slot. All slots must be adjacent to an existing slot, starting from the already-filled center.

== Farm

The Farm is the primary source of gaining Plants. In each hex-shaped slot, you can place either a Sprinkler with a :sprinkler: or seeds :seed:. A Sprinkler represents the irrigation needed for growing your crops, and is drawn by drawing lines from opposite corners of the hex. You cannot place a Sprinkler :sprinkler: on a slot with Stone :stone:.

The hex slots with dotted lines are parts of your land that you do not own yet. When you gain the :expand-farm: action, you fill in the dotted lines and can treat it like any other slot.

During the Overnight phase (and some other special times), you can take the Grow :grow: action. You pay 1 :water: plus a :water: for each sprinkler you have, and then gain one Plant for each seed adjacent to a sprinkler.

All of the actions from the Farm come from other tracks all over the board and on a few spells, but the primary source of Farm actions are from Farmers in the Town Hall and Botanists in the University.

== Mountain

The Mountain contains many bonuses, but is difficult to excavate. First, you must *find a spot* to start, then #action([dig]). To find a starting spot:
    - By default, you start at the base of the mountain, so you can Excavate without finding a new spot.
    - The #action([hike]) action. Fill in the next circle up the side of the mountain. Note that you can start from either side of the mountain.
    - The #action([balloon]) action. Fill in the next circle on the track along the top, and its corresponding spot below (as though it has been hiked). This means that you can balloon, then hike the rest of the way.

To #action([dig]) the mountain, start with a circle slot already filled in. When you #action([dig]), you must dig to the left or right adjacent to an existing filled-in slot, or down (i.e. you cannot #action([dig]) upwards).

== Forge

The #action([forge]) action allows you to gain significant bonuses with careful planning, or repair a shield.

When using #action([forge]) on the Forge map, you fill in any two triangles (no adjacency restrictions). When you fill in four triangles surrounding a square, you fill in the square and gain that bonus.

Alternatively, you can spend a #action([forge]) action by repairing a shield of *any* player.

== Library

In the library, the Research :research:  action allows you to fill in a slot adjacent to an existing slot. If you have unlocked :2xlibrary:, the :research: action fills in two slots instead of one.

== Casino

Whenever you gain the Bet :bet: action, you fill in one of the slots in the Casino. Then, when the Gamble :gamble: action is taken (either from Overnight or elsewhere on the sheet), you roll 2d6 dice, and if one of your slots that you’ve filled out is the value rolled, you gain the bonus.

= Casting Spells

At all times, you must have a spell that is Active - denoted by sitting on the top-right of your City Sheet. At any time during Player Phase, you may swap our your Active Spell if it has not already been cast.

[Spell card figure]

To cast a spell, you must spend the resources in the middle of the card. You must choose either the top or the bottom effect of the spell.

You can *amplify* the effect of the spell by spending additional sets of required resources. The amplification effect is described in the text, but is often a multiplied effect. (Increasing stacks does *not* mean the spell is repeated, the effect is increased.)

*Leaving resources on spell.* You can only place resources on a card that match the cost of the card, and you are limited to the number of stacks. For example, Vine Whip can only take up to 4 :plant:  and 4 :air:. This effectively allows you to transfer resources to the person to your left.

[Figure of Vine Whip spell]

When your spell is cast, turn it on its side - it cannot be cast again this turn and cannot be removed from its Active slot.

= Enemies

Your nemesis in this game is the Dark Mage and his army. The mage has multiple piles, or *divisions,* of enemies. Enemies can either be Normal or Elite.

By default, all Enemies will start face-down. The following will make the Enemy face-up, called. *revealed:*

- Attacking the enemy
- A :scout: action
- The Enemy reaches its attack phase

When you cast a spell, you target one Enemy at the top of one of the Enemy piles. When you attack an enemy, they *Retaliate* back to the player who cast the spell (unless a debuff prevents them from doing so).

= Taking Damage

Whenever you take damage, you will fill in the *end* of one of the tracks and *not* take the bonus. You can take damage up to the line with the heart.

The Hospital provides additional slots with which you can assign damage if you gain the :heal: bonus. When you gain :heal:, fill in the square and that slot is available to fill in when taking damage.

Sometimes the text will limit which tracks you can apply damage to, such as “Worker” jobs or “Mage” jobs, or sometimes a specific job like “Travelers”. If the text does not specify, you get to choose.

*Cascading Double Damage.*  If you need to take damage, and there are no slots to fill in, then you take _double_ that damage on _different_ tracks without any specific track constraints. If you have no more places to fill in any of your tracks, then the player to your left takes the doubled damage. This can cascade exponentially from player to player, however, doubling only happens once per player.

If players are out of health slots, they still continue to play - but all damage they take will double and be applied to the player on their left.

[figure showing this example]

For example, Andy has one slot left in his Mage jobs, and 2 slots left on his other jobs. Suppose he takes 3 damage to Mage jobs. He takes the 1 damage to Pyros, but has two left over. The damage doubles to 4, and now the player to his left must take that damage. If they are out of health, the damage would double and continue to the next player.

If all players are out of health, they lose.

= Buffs and Debuffs

*Important*. Buffs and Debuffs do not stack. You cannot, for example, have more than one Shield.

*Shield*.  When the player or enemy takes damage, reduce the damage dealt to half, rounded down. The shield token has two states: Full and Broken. When you “Gain Shield”, it starts Full. When you take damage, it switches to Broken. When you take damage to a Broken shield, remove the token. Shields can be Repaired by a :forge: action, or other means. If you Gain a Shield when you have a Broken shield, Repair it instead.

*Burning.* During the Overnight phase, if you have any Fire and Plants, convert all Plants to Fire. Then, take 1 damage for every 2 Fire you have.

*Confused*. The next time the Enemy Retaliates, instead remove this token. Has no effect on normal Attack.

*Rooted*. The next time the Enemy moves, instead deal 1 damage to them and remove this token.

*Potent.* Applied to a Spell, and stays with the spell when it is cycled. If the spell is removed, the Buff is removed. The next time this Spell is cast, apply an extra stack (this may exceed the maximum stack limit of the spell), and remove the token.

= Terminology

== *Continue*

When the game text says “Continue”, and if the bonus, buff, or debuff does not apply, it continues to the next player or enemy. The “next player” is *always* the player to your left, and the “next enemy” continues left to right, wrapping around to the first.

For example, Andy must “Gain Shield, continuing”, and he already has Burning, then Burning is applied to the player to his left. If they already have it too, continue attempting to apply Burning until either a player takes Burning, or all players have Burning.

== Melee vs Ranged

If the Mage’s Army is in your town, that is considered *Melee* range. If the Army is *not* in your town, that is considered *Ranged*.

If the text states "Deal damage" without specifying Melee or Ranged, then you may choose.

== *Overkill*

The term *Overkill* applies when the total damage dealt to an Enemy exceeds its original HP.  When you overkill an enemy, they do not retaliate.

= Index


#columns(3)[
  #make-index(
    title: [Index],
    outlined: true,
),
]