load 'lib/code_table.rb'

module Code
  include CodeTable

  def dest(mnemonic)
    return DEST[mnemonic.to_sym] unless mnemonic.nil?

    return DEST[:null]
  end

  def comp(mnemonic)
    return COMP[mnemonic.to_sym]
  end

  def jump(mnemonic)
    return JUMP[mnemonic.to_sym] unless mnemonic.nil?

    return JUMP[:null]
  end

  module_function :dest, :comp, :jump
end
