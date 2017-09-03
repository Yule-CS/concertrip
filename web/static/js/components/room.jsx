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

    const room = this.props.data.room
    return (
      <div>
        <div>
          there are {this.props.data.room.length} whiteboard in your room
        </div>
        <div>
          <Whiteboard key={room.id} roomId={room.id} whiteboard={room.whiteboard} />,
        </div>
      </div>
    )
  }
}

Room.propTypes = {
  match: PropTypes.shape({
    params: PropTypes.shape({
      name: PropTypes.string,
    }),
  }).isRequired,
  data: PropTypes.shape({
    loading: PropTypes.bool,
    error: PropTypes.object,
    room: PropTypes.object,
  }).isRequired,
}

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
const RoomWithData = graphql(RoomQuery, {
  options: ownProps => ({
    variables: { name: ownProps.match.params.name },
  }),
})(Room)
export default RoomWithData
