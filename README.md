## Relay Todos Example Ruby Backend
This is a ruby implementation of the backend for the relay [todos example](https://github.com/facebook/relay/tree/master/examples/todo) using
[graphql-ruby](https://github.com/rmosolgo/graphql-ruby) and [graphql-ruby-relay](https://github.com/rmosolgo/graphql-ruby-relay)

To run, `rails s --port 8080`, comment out the following lines in server.js
from the todos example, and run that w/ `npm start`.

```
// var graphQLServer = express();
// graphQLServer.use('/', graphQLHTTP({schema: GraphQLTodoSchema, pretty: true}));
// graphQLServer.listen(GRAPHQL_PORT, () => console.log(
//   `GraphQL Server is now running on http://localhost:${GRAPHQL_PORT}`
// ));
```
