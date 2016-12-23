module Combos

  protected
  # puts if $VERBOSE flag is truthy
  def vputs *args
    puts *args if $VERBOSE
  end

  # print if $VERBOSE flag is truthy
  def vprint *args
    print *args if $VERBOSE
  end

  private
  # @return [Array(Arrays(Objects))] the Array of combinations
  # @yieldreturn [Array(Objects)] yields to the block if &blk is provided
  # @option [Nil] rnd does serial pairing @see
  # @option [String] rnd does random pairing
  # @option [Integer] rnd does limited combos of pairing
  # @param [Array(Arrays(Objects))] true_params Array of the different Object Arrays for pairing
  # @param [Object] blk 
  def smart_pair rnd = nil, *true_params, &blk
    safe_quit=-> { vputs "exiting smart_pair"; [] }
    begin
      params = true_params.map(&:dup)
    rescue TypeError => e
      vputs "#{e.class}: #{e.message}"
      return safe_quit[]
    rescue Exception => e
      vputs "#{e.class}: #{e.message}"
      return safe_quit[]
    end
    params = [] if params.nil?
    (vprint "params are empty.."; return safe_quit[]) if params.flatten.empty?

    # if rnd is a number, increase the first ary with rand entries (assuming first ary entry is larger)
    if rnd.class == Fixnum
      src_ary = params.first
      diff = rnd - src_ary.size
      res = diff<1 ? (diff = rnd; []) : src_ary # assign blank and make the rnd sampling == rnd
      res += diff.times.map { | | src_ary.sample }
      params[0] = res
    end
    n =params.length
    (vputs "No Ary passed for smart_pairing", :rnd; return) if n == 0
    params.each_with_index { |a, i| eval "@a#{i} = #{a}" }
    lim = params.max_by(&:length).size
    rand_samp =-> ary { ary.shuffle! if rnd; ary.shift }
    combos = lim.times.map { params.each_with_index.map { |ary, i| eval "ary=[@a#{i}.sample]" if ary.empty?; rand_samp[ary] } }
    blk ? combos.each { |a| yield a } : combos
  end

  # @param [Array(Arrays(Objects))] true_params
  # @param [Block] blk
  # @return [Array(Arrays(Objects))] the Array of combinations
  # @yieldreturn [Array(Objects)] yields to the block if &blk is provided
  def brute_pair *true_params, &blk
    params = true_params.map(&:dup)
    n =params.length
    params.each_with_index { |a, i| eval "@a#{i} = #{a}" }
    combos = n!=1 ? eval("#{k = '@a0'; (n-1).times { |i| k+=".product(@a#{i+1})" }; k+=".map(&:flatten)"}") : @a0 #.map{|x|[x]}
    blk ? combos.each { |a| yield a } : combos
  end
end
