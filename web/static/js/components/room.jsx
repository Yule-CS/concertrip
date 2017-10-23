import React from 'react'
import { gql, graphql, compose } from 'react-apollo'
import PropTypes from 'prop-types'
import Whiteboard from './whiteboard'

class Room extends React.PureComponent {
  render() {
    const { history, mutate } = this.props
    const { room, loading, error } = this.props.data
    if (loading) {
      return (<div>Loading</div>)
    }
    if (error) {
      switch (error.graphQLErrors[0].code) {
        case 'not_found':
          mutate()
          break
        case 'bad_request':
          history.replace('/')
          break
        default:
          return (<div>Internal Server Error</div>)
      }
    }
    return (
      <div>
        <div>
          there are {room.length} whiteboard in your room
        </div>
        <div>
          <Whiteboard key={room.id} room={room} />
        </div>
      </div>
    )
  }
}

Room.propTypes = {
  data: PropTypes.shape({
    loading: PropTypes.bool,
    error: PropTypes.object,
    room: PropTypes.object,
  }).isRequired,
}

const createRoom = gql`
  mutation createRoom($name: String!) {
    rooms(name: $name){
      name
      id
      whiteboard {
        id
        stickers {
          id
          title
          url
        }
      }
    }
  }
`

export const RoomQuery = gql`
  query RoomQuery($name: String!) {
    room(name: $name) {
      name
      id
      whiteboard {
        id
        stickers {
          id
          title
          url
        }
      }
    }
  }
`
const RoomWithData = compose(
  graphql(createRoom, {
    options: ownProps => ({
      variables: { name: ownProps.match.params.name },
    }),
  }),
  graphql(RoomQuery, {
    options: ownProps => ({
      variables: { name: ownProps.match.params.name },
    }),
  }),
)(Room)
export default RoomWithData
