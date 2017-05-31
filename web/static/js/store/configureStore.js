import {createStore, applyMiddleware} from 'redux'
import createSagaMiddleware from 'redux-saga'
import {logger} from 'redux-logger'
import rootReducer from '../reducers/index'
import thunk from 'redux-thunk'

export default function configureStore () {
  const sagaMiddleware = createSagaMiddleware()
  const store = createStore(
    rootReducer,
    applyMiddleware(
      thunk,
      logger
    )
  )
  return store
}
