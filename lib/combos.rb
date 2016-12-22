# require "combos/version"
Dir[File.dirname(__FILE__)+"/combos/*.rb"].each { |f| require f }

module Combos

  # Generates All possible {Combos} of all your array elements
  # @see #brute_pair
  # @param [Array(Arrays(Objects))] params
  # @param [Object] blk
  def power_pair *params, &blk
    brute_pair *params, &blk
  end

  # Generates {Combos} to hit All the variables atleast once
  # @see #smart_pair
  # @param [Array(Arrays(Objects))] params
  # @param [Object] blk
  def serial_pair *params, &blk
    smart_pair nil, *params, &blk
  end

  # @see #smart_pair
  # @param [Array(Arrays(Objects))] params
  # @param [Object] blk
  def random_pair *params, &blk
    smart_pair "rand", *params, &blk
  end

  # Generates {Combos} to hit All the variables atleast once
  def combo_pair num, *params, &blk
    smart_pair num, *params, &blk
  end

end
