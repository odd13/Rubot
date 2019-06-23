
require '../rubot'

describe Rubot do
  let(:subject) { described_class.new() }
  let(:x) { 1 }
  let(:y) { 3 }
  let(:facing) { "north" }
  let(:grid) { instance_double(Grid) }

  before do
    allow(Grid).to receive(:new).and_return(grid)
    allow(grid).to receive(:within_grid?).and_return(true)
  end

  describe '#place' do
    context 'when placement is within grid' do
      it 'sets the starting possition' do
        subject.place(x, y, facing)

        expect(subject.x).to eql(x)
        expect(subject.y).to eql(y)
        expect(subject.facing).to eql(facing)
      end
    end

    context 'when placement is not within the grid' do
      before do
        allow(grid).to receive(:within_grid?).and_return(false)
      end

      it 'returns error' do
        expect(subject.place(x, y, facing)).to eql("Outside of grid limitations")
      end
    end
  end

  describe '#move' do
    context 'when within the grid limits' do
      context 'when facing SOUTH' do
        let(:facing) { "SOUTH" }

        it 'increase x' do
          subject.place(x, y, facing)
          subject.move
          expect(subject.x).to eql( x - 1 )
        end
      end

      context 'when facing NORTH' do
        let(:facing) { "NORTH" }

        it 'decrease x' do
          subject.place(x, y, facing)
          subject.move
          expect(subject.x).to eql( x + 1 )
        end
      end

      context 'when facing EAST' do
        let(:facing) { "EAST" }

        it 'decrease x' do
          subject.place(x, y, facing)
          subject.move
          expect(subject.y).to eql( y + 1 )
        end
      end

      context 'when facing WEST' do
        let(:facing) { "WEST" }

        it 'decrease x' do
          subject.place(x, y, facing)
          subject.move
          expect(subject.y).to eql( y - 1 )
        end
      end
    end
  end

  describe '#left' do
    context 'when facing NORTH' do
      let(:facing) { "NORTH" }

      it 'changes to the WEST' do
        subject.place(x, y, facing)
        subject.left
        expect(subject.facing).to eql("WEST")
      end
    end
    context 'when facing WEST' do
      let(:facing) { "WEST" }

      it 'changes to the SOUTH' do
        subject.place(x, y, facing)
        subject.left
        expect(subject.facing).to eql("SOUTH")
      end
    end
    context 'when facing SOUTH' do
      let(:facing) { "SOUTH" }
      it 'changes to the east' do
        subject.place(x, y, facing)
        subject.left
        expect(subject.facing).to eql("EAST")
      end
    end
    context 'when facing EAST' do
      let(:facing) { "EAST" }
      it 'changes to the north' do
        subject.place(x, y, facing)
        subject.left
        expect(subject.facing).to eql("NORTH")
      end
    end

    it 'does not move' do
        subject.place(x, y, facing)
        subject.left
        expect(subject.x).to eql(x)
        expect(subject.y).to eql(y)
    end
  end
  describe '#right' do
    context 'when facing NORTH' do
      let(:facing) { "NORTH" }

      it 'changes to the east' do
        subject.place(x, y, facing)
        subject.right
        expect(subject.facing).to eql("EAST")
      end
    end

    context 'when facing EAST' do
      let(:facing) { "EAST" }

      it 'changes to the SOUTH' do
        subject.place(x, y, facing)
        subject.right
        expect(subject.facing).to eql("SOUTH")
      end
    end
    context 'when facing SOUTH' do
      let(:facing) { "SOUTH" }

      it 'changes to the east' do
        subject.place(x, y, facing)
        subject.right
        expect(subject.facing).to eql("WEST")
      end
    end
    context 'when facing WEST' do
      let(:facing) { "WEST" }

      it 'changes to the NORTH' do
        subject.place(x, y, facing)
        subject.right
        expect(subject.facing).to eql("NORTH")
      end
    end

    it 'does not move' do
      subject.place(x, y, facing)
      subject.left
      expect(subject.x).to eql(x)
      expect(subject.y).to eql(y)
    end
  end
  describe '#report' do
    it 'will announce the X,Y and F' do
      subject.place(x, y, facing)
      expect(subject.report).to eql("1,3,NORTH")
    end
  end
end