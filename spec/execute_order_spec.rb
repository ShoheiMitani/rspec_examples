describe 'Execute order' do
  # Duplicate specs are removed
  # bin/rspec spec/execute_order_spec.rb spec/execute_order_spec.rb --format documentation
  #
  # Example groups
  #   in the describe spec
  #   in the context
  #     in the context spec
  #
  # If file name is different, execution order is changed in the same file.
  # ❯ bin/rspec spec/execute_order_spec.rb spec/groups_spec.rb --format documentation
  #
  # Execute order
  #   in the describe spec
  #   in the context
  #     in the context spec
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
