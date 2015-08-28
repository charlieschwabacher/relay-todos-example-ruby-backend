AddTodo = GraphQL::Relay::Mutation.define do
  name 'AddTodo'

  input_field :text, !types.String

  return_field :todoEdge, TodoEdge
  return_field :viewer, UserType

  resolve -> (inputs, ctx) {
    viewer = User.first
    todos_connection = GraphQL::Relay::RelationConnection.new(viewer.todos, {})
    todo = viewer.todos.create text: inputs[:text], complete: false

    {
      viewer: viewer,
      todoEdge: OpenStruct.new(
        cursor: todos_connection.cursor_from_node(todo).to_s,
        node: todo
      )
    }
  }
end
