load 'lib/parser.rb'
load 'lib/code.rb'
load 'lib/symbol_table.rb'

filename = ARGV[0]

parser = Parser.new(filename)

