TodoType = GraphQL::ObjectType.define do
  name "Todo"
  description "An item in a todo list"
  interfaces [NodeInterface]

  field :id, field: GraphQL::Relay::GlobalIdField.new("Todo")
  field :text, types.String
  field :complete, types.Boolean
end
