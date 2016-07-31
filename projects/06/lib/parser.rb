load 'lib/command_type.rb'

class Parser
  include CommandType

  def initialize(filename)
    @asm = File.new(filename)
    @command = ''
  end

  def has_more_commands?()
    if (@asm.eof?)
      return false
    end

    return true
  end

  def advance()
    @command = @asm.readline.chomp()
  end

  def command_type()
    if /@/.match(@command)
      return A_COMMAND
    elsif /=|;/.match(@command)
      return C_COMMAND
    end

    return L_COMMAND
  end

  def symbol()
  end

  def dest()
  end

  def comp()
  end

  def jump()
  end
end

