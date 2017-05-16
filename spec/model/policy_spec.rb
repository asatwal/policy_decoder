require 'rails_helper'

RSpec.describe Policy, type: :model do

  subject { described_class.new(document) }

  let(:document) do
    {
      'Version': '2017-04-05',
      'Statements': [
        {
          'Effect': 'Allow',
          'Actions': [ 'data:*' ],
          'Resource': 'urn:bigsofa:data:/**/account/**?+account=*'
        },
        {
          'Effect': 'Deny',
          'Actions': [ 'data:delete' ],
          'Resource': 'urn:bigsofa:data:/**/account?+account=${login.account}'
        }
      ]
    }
  end

  describe '.version' do
    it 'should return the policy document version' do
      expect(subject.version).to eq('2017-04-05')
    end
  end

  describe '.statements' do
    it 'should return the policy document statements' do
      expect(subject.statements[0].effect).to eq('Allow')
      expect(subject.statements[0].actions).to eq(['data:*'])
      expect(subject.statements[0].resource).to eq('urn:bigsofa:data:/**/account/**?+account=*')
      expect(subject.statements[1].effect).to eq('Deny')
      expect(subject.statements[1].actions).to eq(['data:delete'])
      expect(subject.statements[1].resource).to eq('urn:bigsofa:data:/**/account?+account=${login.account}')
    end
  end
end
