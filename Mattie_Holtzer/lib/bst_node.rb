class BSTNode

  attr_accessor :left, :right
  attr_reader :value

  def initialize(value = nil)
    @value = value
    @left = nil
    @right = nil
  end

  def set_value(val)
    @value = val
  end
end
