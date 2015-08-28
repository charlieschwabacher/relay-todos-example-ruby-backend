TodosConnection = GraphQL::Relay::RelationConnection.create_type(TodoType) do
  field :totalCount do
    description 'the total number of todos available'
    type types.Int
    resolve -> (obj, args, ctx) { obj.object.count }
  end

  field :completedCount do
    description 'the total number of completed todos'
    type types.Int
    resolve -> (obj, args, ctx) { obj.object.where(complete: true).count }
  end
end
