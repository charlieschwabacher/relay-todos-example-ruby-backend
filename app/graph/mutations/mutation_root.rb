MutationRoot = GraphQL::ObjectType.define do
  name 'Mutation'
  description 'The mutation root for this schema'

  field :addTodo, field: AddTodo.field
  field :changeTodoStatus, field: ChangeTodoStatus.field
  field :markAllTodos, field: MarkAllTodos.field
  field :removeCompletedTodos, field: RemoveCompletedTodos.field
  field :removeTodo, field: RemoveTodo.field
  field :renameTodo, field: RenameTodo.field
end
