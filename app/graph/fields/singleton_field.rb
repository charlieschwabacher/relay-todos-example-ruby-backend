class SingletonField < GraphQL::Field
  def initialize(model:, type:)
    self.type = type
    @model = model
    self.description = "Find the #{model.name}"
    self.arguments = {}
  end

  def resolve(object, arguments, ctx)
    @model.first
  end
end
