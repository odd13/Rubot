require '../grid'

describe Grid do
  let(:subject) { described_class.new(5, 5) }
  let(:x) { 3 }
  let(:y) { 2 }

  describe '#within_grid' do
    context 'when within the grid' do

      it 'returns true' do
        expect(subject.within_grid?(x, y)).to eql(true)
      end
    end

    context 'when not within the grid' do
      context 'when x is within the grid and y is not' do
        let(:x) { 3 }
        let(:y) { 6 }

        it 'returns false' do
            expect(subject.within_grid?(x, y)).to eql(false)
        end
      end

      context 'when y is within the grid and x is not' do
        let(:x) { 7 }
        let(:y) { 2 }

        it 'returns false' do
            expect(subject.within_grid?(x, y)).to eql(false)
        end
      end

      context 'when none are withing the grid' do
        let(:x) { 7 }
        let(:y) { 6 }

        it 'returns false' do
            expect(subject.within_grid?(x, y)).to eql(false)
        end
      end
    end
  end
end