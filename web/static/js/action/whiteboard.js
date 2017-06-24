import axios from 'axios'

function fetchWhiteboard() {
  return function (dispatch) {
    axios.get('http://localhost:4000/api/v1/rooms/1/whiteboards')
      .then((response) => {
        dispatch({
          type: 'FETCH_WHITEBOARD_FULLFILLED',
          payload: response.data,
        })
      })
      .catch((err) => {
        dispatch({
          type: 'FETCH_WHITEBOARD_REJECTED',
          payload: err,
        })
      })
  }
}

export default fetchWhiteboard
