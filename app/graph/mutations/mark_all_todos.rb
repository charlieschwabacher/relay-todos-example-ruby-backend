MarkAllTodos = GraphQL::Relay::Mutation.define do
  name 'MarkAllTodos'

  input_field :complete, !types.Boolean

  return_field :changedTodos, GraphQL::ListType.new(of_type: TodoType)
  return_field :viewer, UserType

  resolve -> (inputs, ctx) {
    viewer = User.first
    todos = viewer.todos.where(complete: !inputs[:complete])
    todos.update_all complete: inputs[:complete]

    {
      changedTodos: todos,
      viewer: viewer
    }
  }
end
