class Publication
  attr_accessor :publisher #reads and writes publisher
end
class Magazine < Publication #Magazine is a subclass of Publication, inherits the methods from Publication
  attr_accessor :editor #reads and writes editor
end
class Ezine < Magazine
end

mag = Magazine.new
mag.publisher = "David A. Black"
mag.editor = "Joe Smith"
puts "Mag is published by #{mag.publisher}, and edited by #{mag.editor}."

mag.is_a?(Magazine)
mag.is_a?(Publication)
