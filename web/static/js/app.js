import React from 'react'
import ReactDOM from 'react-dom'
import { ApolloClient, ApolloProvider, createNetworkInterface } from 'react-apollo'
import { BrowserRouter, Route, Switch } from 'react-router-dom'
import Index from './index'
import Nav from './nav'
import Room from './components/room'

const client = new ApolloClient({
  networkInterface: createNetworkInterface({ uri: '/api' }),
  dataIdFromObject: o => o.id,
})

ReactDOM.render(
  <ApolloProvider client={client}>
    <BrowserRouter>
      <div>
        <Nav />
        <Switch>
          <Route exact path="/" component={Index} />
          <Route path="/room" component={Room} />
          <Route render={() => {
            return <p>Not Found</p>
          }} />
        </Switch>
      </div>
    </BrowserRouter>
  </ApolloProvider>,
  document.getElementById('main_container')
)
