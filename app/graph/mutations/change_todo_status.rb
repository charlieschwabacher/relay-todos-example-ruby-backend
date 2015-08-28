ChangeTodoStatus = GraphQL::Relay::Mutation.define do
  name 'ChangeTodoStatus'

  input_field :complete, !types.Boolean
  input_field :id, !types.ID

  return_field :todo, TodoType
  return_field :viewer, UserType

  resolve -> (inputs, ctx) {
    viewer = User.first
    _, id = GraphQL::Relay::Node.from_global_id inputs[:id]
    todo = viewer.todos.find id
    todo.update_attributes! complete: inputs[:complete]

    {
      todo: todo,
      viewer: viewer
    }
  }
end
