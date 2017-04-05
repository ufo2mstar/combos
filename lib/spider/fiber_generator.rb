
# My Generator - using fibers
class Gen
  def initialize ary
    @ary = ary
    @fib = Fiber.new do
      i = 0
      loop do
        Fiber.yield @ary[i]
        i+=1
      end
    end
  end

  def next not_strict = nil
    @last = (not_strict ? (@fib.resume || rnd) : @fib.resume)
    @last || raise("Generator Exhausted")
  end

  def last
    @last # should return nil if uninitiated
  end

  def rnd
    @ary.sample
  end
end
