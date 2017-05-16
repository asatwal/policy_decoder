class Policy
  attr_reader :document

  delegate :version, :statements, to: :decoded_policy

  def initialize(document)
    @document = document
  end

  def decoded_policy
    @_decoded_policy ||= JSON.parse(policy_json, object_class: OpenStruct)
  end

  private

  def policy_json
    document.deep_transform_keys { |key| key.to_s.underscore.to_sym }.to_json
  end
end
