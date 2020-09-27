describe 'Scope groups' do
  # ❯ bin/rspec spec/scope_spec.rb --format documentation
  #
  # Scope groups
  # Called let! at describe
  # Called before at describe
  #   in the describe spec
  #   in the context
  # Called let! at describe
  # Called before at describe
  # Called let! at context
  # Called before at context
  #     in the context spec

  context 'in the context' do
    let!('context_let!') { puts 'Called let! at context'}
    before { puts 'Called before at context' }
    let(:context_let) { puts 'Called let at context' }

    it 'in the context spec' do
      expect { context_let }.to output("Called let at context\n").to_stdout
      # let isn't executed twice
      expect { context_let }.not_to output.to_stdout
    end
  end

  let!('describe_let!') { puts 'Called let! at describe'}
  before { puts 'Called before at describe' }
  let(:not_called_let) { puts 'Do not call let at describe' }
  let(:described_let) { puts 'Called let at describe' }

  it 'in the describe spec' do
    expect { described_let }.to output("Called let at describe\n").to_stdout
  end
end

describe 'Bad case' do
  # ❯ bin/rspec spec/scope_spec.rb --format documentation --example 'Bad case'
  #
  # Bad case
  #   unnecessary let!
  #     should be unnecessary
  #   unnecessary before
  # Called here
  #     in the context spec
  #     nested context
  # Called here
  #       in the nested context spec

  context 'unnecessary let!' do
    # should use let
    let!(:unnecessary) { :unnecessary }

    it 'should be unnecessary' do
      expect(unnecessary).to eq :unnecessary
    end
  end

  context 'unnecessary before' do
    let(:hoge) { 1 }

    # should execute in the nested context
    let(:fuga) { 1 }
    before(:all) { puts "Called before"}
    before do
      puts "Called here"
      @sum_up = hoge + fuga
    end

    context 'nested context' do
      it 'in the nested context spec' do
        expect(@sum_up).to eq 2
      end
    end

    it 'in the context spec' do
      expect(hoge).to eq 1
    end
  end
end
