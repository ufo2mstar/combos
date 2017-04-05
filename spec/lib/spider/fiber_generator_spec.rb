gen = Gen.new (1..4).to_a

# srand 123


require_relative "../spec_helper"

describe Gen do

  describe 'initialize' do
    context 'new ary' do
      describe 'default Empty Array [] return checks' do
        # $VERBOSE = true

        let(:input) { [1, 2, 3] }

        let(:rnd_var) { [nil, 0, 'rand'].sample } # should work the same for any of these inputs

        it 'no inputs' do
          expect(smart_pair rnd_var).to eq([])
        end

        # $VERBOSE = false
      end
    end
  end

  describe 'functionality' do
    context 'next' do
      it "should be strict by default" do
        10.times { puts gen.next }
      end

      it "should be chill if necessary" do
        10.times { print gen.next 'chill' }
      end
    end

    context 'rnd' do
      it "should return a repeatable pseudo-random sample from the input array" do
        10.times { print gen.rnd }
      end
    end

    context 'last' do
      it "should return the last yielded value" do

      end

      it "should return 'nil' if next has not been called yet!" do

      end
    end


  end
end