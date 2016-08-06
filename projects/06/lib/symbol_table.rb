class SymbolTable
  def initialize()
    @table = {}
  end

  def add_entry(symbol, address)
    @table[symbol] = address
  end

  def contains(symbol)
    return @table.has_key?(symbol)
  end

  def get_address(symbol)
    return @table[symbol]
  end
end
