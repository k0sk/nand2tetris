load 'lib/predefined_symbol.rb'

class SymbolTable
  def initialize()
    @table = {}.merge(PredefinedSymbol::SYMBOL)
  end

  def add_entry(symbol, address)
    @table[symbol.to_sym] = address
  end

  def contains(symbol)
    return @table.has_key?(symbol.to_sym)
  end

  def get_address(symbol)
    return @table[symbol.to_sym]
  end
end
