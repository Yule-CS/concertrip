import React from 'react'
import { withRouter } from 'react-router-dom'
import PropTypes from 'prop-types'
import { gql, graphql } from 'react-apollo'
import Sticker from './sticker'
import { RoomQuery } from './room'

class Whiteboard extends React.PureComponent {
  state = {
    title: '',
    url: '',
  }

  handleSave = () => {
    const { title, url } = this.state
    const room = this.props.roomId
    this.props.mutate({
      variables: { title, url, room },
      refetchQueries: [{
        query: RoomQuery,
      }],
    })
  }

  render() {
    return (
      <div>
        <div>
          Whiteboard: {this.props.whiteboard.id}
        </div>
        <div className="whiteboard">
          {this.props.whiteboard.stickers.map(sticker =>
            <Sticker key={sticker.id} sticker={sticker} />,
         )}
        </div>
        <div>
          <input
            value={this.state.title}
            placeholder="Title"
            onChange={e => this.setState({ title: e.target.value })}
          />
          <input
            value={this.state.url}
            placeholder="Url"
            onChange={e => this.setState({ url: e.target.value })}
          />
          <button onClick={this.handleSave}>Submit</button>
        </div>
      </div>
    )
  }
}

Whiteboard.propTypes = {
  history: PropTypes.object.isRequired,
  mutate: PropTypes.func.isRequired,
  roomId: PropTypes.string.isRequired,
  whiteboard: PropTypes.shape({
    id: PropTypes.string,
    stickers: PropTypes.array,
  }).isRequired,
}

const createStickerMutation = gql`
  mutation createSticker($room: ID, $title: String!, $url: String!) {
      createSticker(room: $room,
        stickerSet: [{
          title: $title
          url: $url
        }]
      ) {
        id
        title
        url
      }
  }
`

const createStickerWithMutation = graphql(createStickerMutation)(withRouter(Whiteboard))

export default createStickerWithMutation
