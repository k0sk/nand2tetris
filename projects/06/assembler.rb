load 'lib/parser.rb'
load 'lib/code.rb'
load 'lib/symbol_table.rb'

filename = ARGV[0]


# First path
rom_address = 0
parser = Parser.new(filename)
table = SymbolTable.new()

while parser.has_more_commands?
  parser.advance

  if parser.command_type == CommandType::C_COMMAND ||
      parser.command_type == CommandType::A_COMMAND
    rom_address += 1
  elsif parser.command_type == CommandType::L_COMMAND
    unless table.contains(parser.symbol)
      table.add_entry(parser.symbol, rom_address)
    end
  end
end


# Second path
ram_address = 16
parser = Parser.new(filename)
output_file = File.new(filename.gsub('asm', 'hack'), 'w')

while parser.has_more_commands?
  parser.advance

  if parser.command_type == CommandType::C_COMMAND
    parser.parse
    output_file.write("111#{Code.comp(parser.comp)}#{Code.dest(parser.dest)}" \
                        "#{Code.jump(parser.jump)}\n")
  elsif parser.command_type == CommandType::A_COMMAND
    if (true if Float(parser.symbol) rescue false) # If symbol is number
      symbol = parser.symbol.to_i
    else
      if table.contains(parser.symbol)
        symbol = table.get_address(parser.symbol)
      else
        table.add_entry(parser.symbol, ram_address)
        symbol = ram_address

        ram_address += 1
      end
    end

    output_file.write("0#{format('%.15b', symbol)}\n") unless symbol.nil?
  end
end

output_file.close()
