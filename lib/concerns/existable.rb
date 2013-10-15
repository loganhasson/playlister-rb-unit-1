module Existable

  def exists?(name)
    all.detect {|n| n.name == name}
  end

end