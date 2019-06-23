require '../grid'

describe Grid do
  describe '#place' do

    context 'when given the correct command' do
      let(:subject) { described_class.new() }

      it 'sets the starting possition' do
        x = 1
        y = 3
        facing = "north"

        subject.place(x, y, facing)

        expect(subject.x).to eql(x)
        expect(subject.y).to eql(y)
        expect(subject.facing).to eql(facing)
      end

      it 'sets the initial possition'
    end
    context 'when given the incorrect command' do
      it 'returns failure'
    end
  end
end