require "combos/version"

module Combos

  def power_pair *true_params, &blk
    params = true_params.map(&:dup)
    n      =params.length
    params.each_with_index { |a, i| eval "@a#{i} = #{a}" }
    @combos = n!=1 ? eval("#{k = '@a0'; (n-1).times { |i| k+=".product(@a#{i+1})" }; k+=".map(&:flatten)"}") : @a0 #.map{|x|[x]}
    blk ? @combos.each { |a| yield a } : @combos
  end

  def serial_pair *params, &blk
    smart_pair nil, *params, &blk
  end

  def random_pair *params, &blk
    smart_pair "rand", *params, &blk
  end

  def combo_pair num, *params, &blk
    smart_pair num, *params, &blk
  end

  private
  def smart_pair rnd = nil, *true_params, &blk
    params = true_params.map(&:dup)
    # if rnd is a number, increase the first ary with rand entries (assuming first ary entry is larger)
    if rnd.class == Fixnum
      src_ary   = params.first
      diff      = rnd - src_ary.size
      res       = diff<1 ? (diff = rnd; []) : src_ary # assign blank and make the rnd sampling == rnd
      res       += diff.times.map { | | src_ary.sample }
      params[0] = res
    end
    n =params.length
    (p "No Ary passed for smart_pairing", :rnd; return) if n == 0
    params.each_with_index { |a, i| eval "@a#{i} = #{a}" }
    lim       = params.max_by(&:length).size
    rand_samp =-> ary { ary.shuffle! if rnd; ary.shift }
    @combos   = lim.times.map { params.each_with_index.map { |ary, i| eval "ary=[@a#{i}.sample]" if ary.empty?; rand_samp[ary] } }
    blk ? @combos.each { |a| yield a } : @combos
  end

end
