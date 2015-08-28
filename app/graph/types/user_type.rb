# var {
#   connectionType: TodosConnection,
#   edgeType: GraphQLTodoEdge,
# } = connectionDefinitions({
#   name: 'Todo',
#   nodeType: GraphQLTodo,
#   connectionFields: () => ({
#     totalCount: {
#       type: GraphQLInt,
#       resolve: (conn) => conn.edges.length,
#     },
#     completedCount: {
#       type: GraphQLInt,
#       resolve: (conn) => conn.edges.filter(edge => edge.node.complete).length
#     },
#   })r.
# });

# var GraphQLUser = new GraphQLObjectType({
#   name: 'User',
#   fields: {
#     id: globalIdField('User'),
#     todos: {
#       type: TodosConnection,
#       args: connectionArgs,
#       resolve: (obj, args) => connectionFromArray(getTodos(), args),
#     }
#   },
#   interfaces: [nodeInterface]
# });

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
