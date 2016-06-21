module Stacklike
  def stack
    @stack ||= [] #or-equals operator to set the variable sets it to a new empty array, if and only if the variable isn't already set to something other than nil or false
  end
  def add_to_stack(obj)
    stack.push(obj)
  end
  def take_from_stack
    stack.pop
  end
end
