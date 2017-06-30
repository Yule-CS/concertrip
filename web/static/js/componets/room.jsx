import React from 'react'
import { gql, graphql } from 'react-apollo'
import PropTypes from 'prop-types'
import Whiteboard from './whiteboard'

class Room extends React.PureComponent {
  render() {
    if (this.props.data.loading) {
      return (<div>Loading</div>)
    }
    if (this.props.data.error) {
      return (<div>An unexpected error occurred</div>)
    }

    return (
      <div>
        <div>
          there are {this.props.data.rooms.length} whiteboard in your room
        </div>
        <div>
          {this.props.data.rooms.map(room =>
            <Whiteboard key={room.id} whiteboard={room.whiteboard} />,
          )}
        </div>
      </div>
    )
  }
}

Room.propTypes = {
  data: PropTypes.shape({
    loading: PropTypes.bool,
    error: PropTypes.object,
    rooms: PropTypes.array,
  }).isRequired,
}

const RoomQuery = gql`
  query RoomQuery {
    rooms {
      name
      whiteboard {
        id
      }
    }
  }
`
const RoomWithData = graphql(RoomQuery)(Room)
export default RoomWithData
