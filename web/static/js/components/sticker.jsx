import React from 'react'
import PropTypes from 'prop-types'

export default class Sticker extends React.PureComponent {
  render() {
    return (
      <div>
        StickerID: {this.props.sticker.id}
        Title: {this.props.sticker.title}
        URL: {this.props.sticker.url}
      </div>
    )
  }
}

Sticker.propTypes = {
  sticker: PropTypes.shape({
    id: PropTypes.string,
    title: PropTypes.string,
    url: PropTypes.string,
  }).isRequired,
}
