class Resource
  def initialize(resource)
    @resource = resource.split(':')
  end

  def schema_name
    resource.third
  end

  def search_spec
    resource.fourth.split('?+').first
  end

  def r_component
    resource.fourth.split('?+').second
  end

  def search_param
    r_component.split('=').first
  end

  def search_value
    r_component.split('=').last
  end

  private

  attr_reader :resource
end
