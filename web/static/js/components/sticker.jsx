import React from 'react'
import PropTypes from 'prop-types'

export default class Sticker extends React.PureComponent {
  render() {
    const imageUrl = `https://blinky.nemui.org/shot/large?${this.props.sticker.url}`
    const styles = {
      backgroundImage: `url(${imageUrl})`,
      backgroundRepeat: 'no-repeat',
      backgroundSize: 'cover',
    }
    return (
      <div className="sticker" style={styles}>
        <div className="description">
          <p>StickerID: {this.props.sticker.id}</p>
          <h3 className="title">Title: {this.props.sticker.title}</h3>
          <p>URL: {this.props.sticker.url}</p>
        </div>
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
