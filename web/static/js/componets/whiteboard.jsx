import React from 'react'
import PropTypes from 'prop-types'
// import { connect } from 'react-redux'
// import { fetchWhiteboard } from '../action/whiteboard'

export default class Whiteboard extends React.PureComponent {
  render() {
    return (
      <div>
         Whiteboard: {this.props.whiteboard.id}
      </div>
    )
  }
}
Whiteboard.propsTypes = {
  whiteboard: PropTypes.shape({
    id: PropTypes.number,
  }),
}

// const mapStateToProps = state => ({
//   whiteboard: state.whiteboard,
// })
//
// const mapDispatchToProps = dispatch => ({
//   fetch: () => dispatch(fetchWhiteboard()),
// })
//
// export default connect(
//   mapStateToProps,
//   mapDispatchToProps,
// )(Whiteboard)
