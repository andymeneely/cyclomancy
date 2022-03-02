require 'squib'
require 'irb'
require 'rake/clean'

# Add Rake's clean & clobber tasks
CLEAN.include('_output/*').exclude('_output/gitkeep.txt')

desc 'By default, just build the deck without extra options'
task default: [:deciphers, :decipher_bonuses, :spells]

desc 'Build everything, with all the options'
task all: [:with_pnp, :with_proofs, :default]

desc 'Build the decipher deck'
task(:deciphers)        { load 'src/deciphers.rb' }
task(:decipher_bonuses) { load 'src/decipher_bonuses.rb' }
task(:spells)           { load 'src/spells.rb' }

desc 'Enable proof lines'
task(:with_proofs) do
  puts "Enabling proofing lines."
  Squib.enable_build_globally :proofs
end

desc 'Enable print-and-play builds'
task(:with_pnp) do
  puts "Enabling print-and-play builds."
  Squib.enable_build_globally :pnp
end
