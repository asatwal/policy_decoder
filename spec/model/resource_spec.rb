require 'rails_helper'

RSpec.describe Resource, type: :model do

  subject { described_class.new(resource) }

  let(:resource) { 'urn:bigsofa:data:/**/account/**?+account.id=11' }

  context 'Resource methods' do
    it 'should return the expected values' do
      expect(subject.schema_name).to eq('data')
      expect(subject.search_spec).to eq('/**/account/**')
      expect(subject.search_param).to eq('account.id')
      expect(subject.search_value).to eq('11')
    end
  end
end
