require_relative '../bond'

describe Bond do
  describe '#Bond' do
    before do
      @bond = Bond.new
    end

    it '#initialize current object with sample_data' do
      expect(@bond).to be_a Bond
    end

    context 'caulate gov bond benchmark' do
      it '#return current valid data' do
        result = @bond.caulate_gov_bond_benchmark
        expect(result).to be_truthy
      end

      it '#return valid bond code' do
        expected = 'C1'
        result = @bond.caulate_gov_bond_benchmark
        expect(result).to include expected
      end

      it '#return expected result data' do
        expected = 'G1,1.6%'
        result = @bond.caulate_gov_bond_benchmark
        expect(result).to include expected
      end
    end

    context 'caulate gov bond benchmark spred curve' do
      it '#return current valid curve' do
        result = @bond.caulate_spread_gov_bond_curve
        expect(result).to be_truthy
      end

      it '#return expected curve' do
        expected = '1.43%'
        result = @bond.caulate_spread_gov_bond_curve
        expect(result).to include expected
      end

      it '#return valid bond code' do
        expected = 'C1'
        result = @bond.caulate_spread_gov_bond_curve
        expect(result).to include expected
      end
    end
  end
end
