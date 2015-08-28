RemoveTodo = GraphQL::Relay::Mutation.define do
  name 'RemoveTodo'

  input_field :id, types.ID

  return_field :deletedTodoId, types.ID
  return_field :viewer, UserType

  resolve -> (inputs, ctx) {
    viewer = User.first
    _, id = GraphQL::Relay::Node.from_global_id inputs[:id]
    todo = viewer.todos.find id
    todo.destroy

    {
      deletedTodoId: inputs[:id],
      viewer: viewer
    }
  }
end
