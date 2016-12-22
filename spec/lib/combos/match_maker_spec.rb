require_relative "../spec_helper"

describe Combos do

  describe 'smart_pair' do
    context 'Corner cases' do
      describe 'default Empty Array [] return checks' do
        # $VERBOSE = true
        let(:input) { [] }
        let(:rnd_var) { [nil, 0, 'rand'].sample } # should work the same for any of these inputs
        it 'no inputs' do
          expect(smart_pair rnd_var).to eq([])
        end
        it 'nil input' do
          expect(smart_pair rnd_var, nil).to eq([])
        end
        it 'multiple nil inputs' do
          expect(smart_pair rnd_var, nil, nil).to eq([])
        end
        it 'single empty array input' do
          expect(smart_pair rnd_var, input).to eq([])
        end
        it 'multiple empty array inputs' do
          expect(smart_pair rnd_var, input, input, input).to eq([])
        end
        # $VERBOSE = false
      end
    end

  end
end
