import { combineReducers }  from 'redux';
import { routeReducer }     from 'react-router-redux';
import whiteboard           from './whiteboard';

const rootReducer = combineReducers({
  whiteboard
});

export default rootReducer
