class Parser
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

