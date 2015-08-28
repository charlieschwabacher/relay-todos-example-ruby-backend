class QueriesController < ApplicationController
  def create
    query_string = params[:query]
    query_variables = params[:variables] || {}
    query = GraphQL::Query.new(TodoSchema, query_string, variables: query_variables)
    render json: query.result
  end
end
