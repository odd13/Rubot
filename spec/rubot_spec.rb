
require '../rubot'

describe Rubot do
  describe '#place' do

    context 'when given the correct command' do
      let(:subject) { described_class.new() }

      it 'sets the starting possition' do
        x = 1
        y = 3
        z = 2
        f = "north"

        subject.place(x, y, z, f)

        expect(subject.x).to eql(x)
        expect(subject.y).to eql(y)
        expect(subject.z).to eql(z)
        expect(subject.f).to eql(f)
      end

      it 'sets the initial possition'
    end
    context 'when given the incorrect command' do
      it 'returns failure'
    end
  end
  describe '#move' do
    context 'when given the correct command' do
      it 'will move the toy robot one unit forward in the direction it is currently facing'
    end
  end
  describe '#left' do
    it 'changes the direction by 90 deg to the left'
    it 'does not move possition'
  end
  describe '#right' do
    it 'changes the direction by 90 deg to the right'
    it 'does not move possition'
  end
  describe '#report' do
    it 'will announce the X,Y and F'
  end
end