describe 'Example groups' do
  # Same group name is ok
  # ❯ bin/rspec spec/namespace_spec.rb --format documentation
  #
  # Example groups
  #   namespace
  #     in the context spec
  #   namespace
  #     in the context spec
  context 'namespace' do
    it 'in the context spec' do
      expect(1).to eq 1
    end
  end

  context 'namespace' do
    it 'in the context spec' do
      expect(1).to eq 1
    end
  end
end
