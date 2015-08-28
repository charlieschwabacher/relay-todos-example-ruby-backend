RenameTodo = GraphQL::Relay::Mutation.define do
  name 'RenameTodo'

  input_field :id, types.ID
  input_field :text, types.String

  return_field :todo, TodoType

  resolve -> (inputs, ctx) {
    viewer = User.first
    _, id = GraphQL::Relay::Node.from_global_id inputs[:id]
    todo = viewer.todos.find id
    todo.update_attributes! text: inputs[:text]

    {
      todo: todo
    }
  }
end
