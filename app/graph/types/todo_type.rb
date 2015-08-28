# var {nodeInterface, nodeField} = nodeDefinitions(
#   (globalId) => {
#     var {type, id} = fromGlobalId(globalId);
#     if (type === 'Todo') {
#       return getTodo(id);
#     } else if (type === 'User') {
#       return getUser(id);
#     }
#     return null;
#   },
#   (obj) => {
#     if (obj instanceof Todo) {
#       return GraphQLTodo;
#     } else if (obj instanceof User) {
#       return GraphQLUser;
#     }
#     return null;
#   }
# );

# var GraphQLTodo = new GraphQLObjectType({
#   name: 'Todo',
#   fields: {
#     id: globalIdField('Todo'),
#     text: {
#       type: GraphQLString,
#       resolve: (obj) => obj.text,
#     },
#     complete: {
#       type: GraphQLBoolean,
#       resolve: (obj) => obj.complete,
#     }
#   },
#   interfaces: [nodeInterface]
# });

TodoType = GraphQL::ObjectType.define do
  name "Todo"
  description "An item in a todo list"
  interfaces [NodeInterface]

  field :id, field: GraphQL::Relay::GlobalIdField.new("Todo")
  field :text, types.String
  field :complete, types.Boolean
end
