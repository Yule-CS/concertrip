import { createStore, applyMiddleware } from 'redux';
import { createLogger }                     from 'redux-logger';
import createSagaMiddleware             from 'redux-saga';
import { syncHistory }                  from 'react-router-redux';
import reducers                         from '../reducers';

const loggerMiddleware = createLogger({
  level: 'info',
  collapsed: true,
});

export default function configureStore(browserHistory) {
  const reduxRouterMiddleware = syncHistory(browserHistory);
  const sagaMiddleware = createSagaMiddleware();
  const createStoreWithMiddleware = applyMiddleware(reduxRouterMiddleware, sagaMiddleware, loggerMiddleware)(createStore);

  return createStoreWithMiddleware(reducers);
}
