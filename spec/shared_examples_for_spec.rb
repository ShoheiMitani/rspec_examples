describe 'Shared Examples For groups' do
  # https://ysk-pro.hatenablog.com/entry/replace_constructor_with_factory_method
  class Car
    def self.create(imported, price)
      if imported
        if price > 100
          ForeignHighGradeCar.new(price)
        else
          ForeignCar.new(price)
        end
      else
        if price > 100
          DomesticHighGradeCar.new(price)
        else
          DomesticCar.new(price)
        end
      end
    end

    def initialize(price)
      @price = price
    end

    def guarantee?
      raise NoMethodError
    end

    def driving_seat_side
      raise NoMethodError
    end
  end

  module HighBrandOption
    def guarantee?
      true
    end
  end

  class DomesticCar < Car
    def guarantee?
      false
    end

    def driving_seat_side
      'right'
    end
  end

  class DomesticHighGradeCar < DomesticCar
    include HighBrandOption
  end

  class ForeignCar < Car
    def guarantee?
      false
    end

    def driving_seat_side
      'left'
    end
  end

  class ForeignHighGradeCar < ForeignCar
    include HighBrandOption
  end

  shared_examples_for 'guaranteed car' do
    it 'is expected to be true' do
      expect(subject.guarantee?).to be true
    end
  end

  shared_examples_for 'no guaranteed car' do
    it 'is expected to be false' do
      expect(subject.guarantee?).to be false
    end
  end

  shared_examples_for 'right side driving seat car' do
    it 'is expected to be true' do
      expect(subject.driving_seat_side).to eq 'right'
    end
  end

  shared_examples_for 'left side driving seat car' do
    it 'is expected to be true' do
      expect(subject.driving_seat_side).to eq 'left'
    end
  end

  context 'foreign car' do
    subject { Car.create(true, 100) }

    it_behaves_like 'no guaranteed car'
    it_behaves_like 'left side driving seat car'
  end

  context 'foreign high brand car' do
    subject { Car.create(true, 101) }

    it_behaves_like 'guaranteed car'
    it_behaves_like 'left side driving seat car'
  end

  context 'domestic car' do
    subject { Car.create(false, 100) }

    it_behaves_like 'no guaranteed car'
    it_behaves_like 'right side driving seat car'
  end

  context 'domestic high brand car' do
    subject { Car.create(false, 101) }

    it_behaves_like 'guaranteed car'
    it_behaves_like 'right side driving seat car'
  end
end


describe 'Foo' do
  describe '#complex_method' do
    context 'when object is new object' do
      it 'should create model' do
        expect { Foo.new.complex_method }.to change { AModel.count }.from(0).to(1)

        model = AModel.last
        expect(model.a).to eq :b
      end
    end

    context 'when object had already persisted before' do
      it 'should create model' do
        expect { Foo.new.complex_method }.not_to change { AModel.count }

        model = AModel.last
        expect(model.a).to eq :b
      end
    end
  end
end
