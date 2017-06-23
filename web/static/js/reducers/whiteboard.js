const initialState = {
  ids: [],
  errorState: false,
}

function whiteboard(state = initialState, action) {
  switch (action.type) {
    case 'FETCH_WHITEBOARD_FULLFILLED':
      return {
        ...state,
        ids: action.payload.data.map(wb => wb.id),
      }
    case 'FETCH_WHITEBOARD_REJECTED':
      return {
        ...state,
        errorState: true,
      }
    default:
      return state
  }
}

export default whiteboard
