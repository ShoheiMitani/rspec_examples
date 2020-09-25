describe 'Subject' do
  class Counter
    def initialize(initial)
      @num = initial
    end

    def up(increment)
      @num = @num + increment
    end

    def num
      @num
    end
  end

  describe 'Counter' do
    describe '#count' do
      context 'Bad case' do
        let(:initial) { 1 }
        let(:increment) { 1 }
        let(:inst) { Counter.new(initial) }
        subject do
          inst.up(increment)
          inst.num
        end

        context '1 + 1 = 2' do
          it { is_expected.to eq 2 }
        end

        context '1 + 2 = 3' do
          let(:increment) { 2 }
          it { is_expected.to eq 3 }
        end

        context '2 + 1 = 2' do
          let(:initial) { 2 }
          it { is_expected.to eq 3 }
        end
      end

      context 'Good case' do
        context '1 + 1 = 2' do
          it 'should get correct result' do
            c = Counter.new(1)
            expect(c.up(1)).to eq 2
          end
        end

        context '1 + 2 = 3' do
          it 'should get correct result' do
            c = Counter.new(1)
            expect(c.up(2)).to eq 3
          end
        end

        context '2 + 1 = 3' do
          it 'should get correct result' do
            c = Counter.new(2)
            expect(c.up(1)).to eq 3
          end
        end
      end

      context 'Better case' do
        [
          { initial: 1, increment: 1, expect: 2, case: '1 + 1 = 2' },
          { initial: 1, increment: 2, expect: 3, case: '1 + 2 = 3' },
          { initial: 2, increment: 1, expect: 3, case: '2 + 1 = 3' }
        ].each do |test_case|
          context test_case[:case] do
            it "should get correct result" do
              initial   = test_case[:initial]
              increment = test_case[:increment]
              expect    = test_case[:expect]

              c = Counter.new(initial)
              expect(c.up(increment)).to eq expect
            end
          end
        end
      end
    end
  end
end
