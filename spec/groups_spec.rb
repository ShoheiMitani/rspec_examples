describe 'Example groups' do
  # execution order is changed
  # ❯ bin/rspec spec/groups_spec.rb --format documentation
  #
  # Example groups
  #   in the describe spec
  #   in the context
  #     in the context spec

  let(:describe_scope) { :describe_scope }

  context 'in the context' do
    let(:context_scope) { :context_scope }

    it 'in the context spec' do
      expect(describe_scope).to eq :describe_scope
      expect(context_scope).to eq :context_scope
    end
  end

  it 'in the describe spec' do
    expect(describe_scope).to eq :describe_scope
    # Out of scope
    expect{ context_scope }.to raise_error(NameError)
  end
end
