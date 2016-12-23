require_relative "spec_helper"

describe Combos do
  describe 'Gem Specs' do
    it 'has a version number' do
      # puts "Version: #{Combos::VERSION}"
      expect(Combos::VERSION).not_to be nil
    end
  end

  describe 'API Specs' do
    it 'on include, it exposes all these methods in the API' do
      API_METHODS.each do |method_name|
        expect(defined? send(method_name)).to eq('method')
      end
    end
  end

  describe 'Method Behavior: Happy path' do
    before(:each) do
      RESET_RAND[]
    end
    describe 'power_pair' do
      it 'generates all possible combinations (not permutations)' do
        res = power_pair(NUMS, WORDS, CHARS)
        # todo: think of a better way to manage the expecteds
        exp_res = [[1, "a", "#"], [1, "a", "!"], [1, "b", "#"], [1, "b", "!"], [1, "c", "#"], [1, "c", "!"],
                   [2, "a", "#"], [2, "a", "!"], [2, "b", "#"], [2, "b", "!"], [2, "c", "#"], [2, "c", "!"],
                   [3, "a", "#"], [3, "a", "!"], [3, "b", "#"], [3, "b", "!"], [3, "c", "#"], [3, "c", "!"],
                   [4, "a", "#"], [4, "a", "!"], [4, "b", "#"], [4, "b", "!"], [4, "c", "#"], [4, "c", "!"]]
        expect(res).to eq(exp_res)
      end
    end

    describe 'serial_pair' do
      it 'generates structured combinations in the same order as the arrays provided: minimum number of pairs to hit all variables' do
        res = serial_pair NUMS, WORDS, CHARS
        exp_res = [[1, "a", "#"], [2, "b", "!"], [3, "c", "#"], [4, "b", "#"]]
        expect(res).to eq(exp_res)
      end
    end

    describe 'random_pair' do
      it 'generates random combinations: max array length long!' do
        res = random_pair NUMS, WORDS, CHARS
        exp_res = [[4, "b", "!"], [1, "a", "#"], [3, "c", "!"], [2, "b", "#"]]
        expect(res).to eq(exp_res)
      end
    end

    describe 'combo_pair' do
      it 'generates specified number of combinations' do
        res = combo_pair 5, NUMS, WORDS, CHARS
        exp_res = [[2, "a", "!"], [1, "c", "#"], [3, "b", "#"], [3, "b", "#"], [4, "c", "#"]]
        expect(res).to eq(exp_res)
      end
    end
  end

end
