# var Root = new GraphQLObjectType({
#   name: 'Root',
#   fields: {
#     viewer: {
#       type: GraphQLUser,
#       resolve: () => getViewer()
#     },
#     node: nodeField
#   },
# });


QueryRoot = GraphQL::ObjectType.define do
  name 'Query'
  description 'The query root for this schema'

  field :viewer do
    type UserType
    resolve -> (obj, args, ctx) { User.first }
  end

  field :todo, TodoType, field: FetchField.new(type: TodoType, model: Todo)
end
