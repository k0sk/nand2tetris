load 'lib/parser.rb'
load 'lib/code.rb'
load 'lib/symbol_table.rb'
load 'lib/command_type.rb'

include CommandType

filename = ARGV[0]

parser = Parser.new(filename)

while parser.has_more_commands?
  puts parser.advance()
  puts parser.command_type()
  if parser.command_type() == A_COMMAND or parser.command_type() == L_COMMAND
    puts parser.symbol()
  else
    puts parser.dest()
  end
end

