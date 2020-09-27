describe 'Context groups' do
  def type_of(args)
    args.class
  end

  context 'when args is string' do
    it 'in the context spec' do
      expect(type_of("string")).to eq String
    end
  end

  context 'when args is integer' do
    it 'in the context spec' do
      expect(type_of(1)).to eq Integer
    end
  end
end

class Dummy
  attr_accessor :input

  def initialize(input)
    @input = input
  end

  def less_than?(val)
    input < val
  end
end

describe 'Context groups' do
  context '#less_than?' do
    subject { Dummy.new(100) }

    it 'should has getter method' do
      expect(subject.input).to eq 100
    end

    context 'args is 99' do
      it 'should return false' do
        expect(subject.less_than?(99)).to eq false
      end
    end

    context 'args is 100' do
      it 'should return false' do
        expect(subject.less_than?(100)).to eq false
      end
    end

    context 'args is 101' do
      it 'should return false' do
        expect(subject.less_than?(101)).to eq true
      end
    end
  end
end
