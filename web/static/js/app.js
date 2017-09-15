import React from 'react'
import ReactDOM from 'react-dom'
import { ApolloClient, ApolloProvider, createNetworkInterface } from 'react-apollo'
import { BrowserRouter, Route, Switch } from 'react-router-dom'
import Index from './index'
import Nav from './nav'
import Room from './components/room'

const networkInterface = createNetworkInterface({ uri: '/api' })
networkInterface.useAfter([{
  applyAfterware({ response }, next) {
    if (response.status === 400) {
      // TODO redirect index but <Redirect to '/'> doesn't work...
    }
    next()
  },
}])
const client = new ApolloClient({
  networkInterface,
  dataIdFromObject: o => o.id,
})

ReactDOM.render(
  <ApolloProvider client={client}>
    <BrowserRouter>
      <div>
        <Nav />
        <Switch>
          <Route exact path="/" component={Index} />
          <Route path="/rooms/:name" component={Room} />
          <Route render={() => <p>Not Found</p>} />
        </Switch>
      </div>
    </BrowserRouter>
  </ApolloProvider>,
  document.getElementById('main_container')
)
