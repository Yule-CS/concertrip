import React from 'react'
import { connect } from 'react-redux'
import { fetchWhiteboard } from '../action/whiteboard'

class Whiteboard extends React.Component {

  componentDidMount() {
    this.props.fetch()
  }

  render() {
    const ids = this.props.whiteboard.ids
    return (
      <div>
        <ul>
          {(() => {
            if (ids.length > 0) {
              return ids.map(id => <li key={id}>{id}</li>)
            }
            return []
          })()}
        </ul>
        <button onClick={() => {
          this.props.fetch()
        }}
        >
          fetch
        </button>
      </div>
    )
  }
}

const mapStateToProps = state => ({
  whiteboard: state.whiteboard,
})

const mapDispatchToProps = dispatch => ({
  fetch: () => dispatch(fetchWhiteboard()),
})

export default connect(
  mapStateToProps,
  mapDispatchToProps,
)(Whiteboard)
