# TODO: Convince somebody on #ruby-core that this should be defined by default.
class String
  def >> obj
    obj.send self
  end
end

module Church::Kernel
  # Our reference to the Kernel constant
  KERNEL = ('ancestors' >> ('class' >> []))[-2]

  # Reads and returns a single line from standard input.
  GETS = -> { 'gets' >> KERNEL }

  # Reads lines from standard input and prints their results after being passed to fn, terminating on EOF.
  INTERACT = -> &fn {
    line = GETS[]
    line ? 0 : ('exit' >> KERNEL)
    line = 'chomp' >> line
    PUTS[fn[line]]
    INTERACT[&fn]
  }
end
