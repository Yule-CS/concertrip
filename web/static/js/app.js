import React from 'react'
import ReactDOM from 'react-dom'
import { Provider } from 'react-redux'
import Index from './componets/room'
import configureStore from './store/configureStore'

let store = configureStore()

ReactDOM.render(
  <Provider store={store}>
    <Index />
  </Provider>,
  document.getElementById('main_container')
)
