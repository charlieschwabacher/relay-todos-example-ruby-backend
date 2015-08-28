class NodeImplementation
  def object_from_id(id)
    type_name, id = GraphQL::Relay::Node.from_global_id(id)
    type_name.constantize.find id
  end

  def type_from_object(object)
    object.class.name
  end
end
