RemoveCompletedTodos = GraphQL::Relay::Mutation.define do
  name 'RemoveCompletedTodos'

  return_field :deletedTodoIds, GraphQL::ListType.new(of_type: types.ID)
  return_field :viewer, UserType

  resolve -> (inputs, ctx) {
    viewer = User.first
    todo_ids = viewer.todos.where(complete: true).pluck :id
    viewer.todos.where(id: todo_ids).delete_all

    {
      deletedTodoIds: todo_ids.map{|id|
        GraphQL::Relay::Node.to_global_id 'Todo', id
      },
      viewer: viewer
    }
  }
end
