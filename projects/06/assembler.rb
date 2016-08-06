load 'lib/parser.rb'
load 'lib/code.rb'
load 'lib/symbol_table.rb'

filename = ARGV[0]

parser = Parser.new(filename)

while parser.has_more_commands?
  parser.advance
  if parser.command_type == CommandType::A_COMMAND
    puts "0#{format('%.15b', parser.symbol)}"
  elsif parser.command_type == CommandType::L_COMMAND
    # puts "symbol: #{parser.symbol}"
  else
    parser.parse
    puts "111#{Code.comp(parser.comp)}#{Code.dest(parser.dest)}" \
            "#{Code.jump(parser.jump)}"
    # puts "dest: #{parser.dest} #{Code.dest(parser.dest)}"
    # puts "comp: #{parser.comp} #{Code.comp(parser.comp)}"
    # puts "jump: #{parser.jump} #{Code.jump(parser.jump)}"
  end
end
