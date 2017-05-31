import React                    from 'react';
import ReactDOM                 from 'react-dom';
import Index                    from './componets/room';
import {Provider}               from 'react-redux';
import rootReducer              from './reducers/index'
import configureStore           from './store/configureStore';

let store = configureStore()

ReactDOM.render(
  <Provider store={store}>
    <Index />
  </Provider>,
  document.getElementById('main_container')
);
