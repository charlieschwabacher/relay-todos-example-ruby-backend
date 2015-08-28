UserType = GraphQL::ObjectType.define do
  name "User"
  description "A user of the todos app"
  interfaces [NodeInterface]

  field :id, field: GraphQL::Relay::GlobalIdField.new("User")
  connection :todos, TodosConnection do
    resolve -> (obj, args, ctx) {
      Todo.where(id: obj.todos)
    }
  end
end
