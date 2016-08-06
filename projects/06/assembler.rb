load 'lib/parser.rb'
load 'lib/code.rb'
load 'lib/symbol_table.rb'
load 'lib/command_type.rb'

include CommandType
include Code

filename = ARGV[0]

parser = Parser.new(filename)

while parser.has_more_commands?
  puts parser.advance
  parser.command_type
  if parser.command_type == A_COMMAND or parser.command_type == L_COMMAND
    puts "symbol: #{parser.symbol}"
  else
    parser.parse
    puts "dest: #{parser.dest} #{dest(parser.dest)}" unless parser.dest.nil?
    puts "comp: #{parser.comp} #{comp(parser.comp)}" unless parser.comp.nil?
    puts "jump: #{parser.jump} #{jump(parser.jump)}" unless parser.jump.nil?
  end
end
