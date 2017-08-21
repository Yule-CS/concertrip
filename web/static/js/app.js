import React from 'react'
import ReactDOM from 'react-dom'
import { ApolloClient, ApolloProvider, createNetworkInterface } from 'react-apollo'
import { BrowserRouter, Route, Switch } from 'react-router-dom'
import Room from './componets/room'

const client = new ApolloClient({
  networkInterface: createNetworkInterface({ uri: '/api' }),
  dataIdFromObject: o => o.id,
})

ReactDOM.render(
  <ApolloProvider client={client}>
    <BrowserRouter>
      <Switch>
        <Route exact path="/" component={Room} />
        <Route render={() => {
          return <p>Not Found</p>
        }} />
      </Switch>
    </BrowserRouter>
  </ApolloProvider>,
  document.getElementById('main_container')
)
