import React                    from 'react'
import ReactDOM                 from 'react-dom'
import { connect }              from 'react-redux'
import { fetchWhiteboard }      from '../action/whiteboard'
import { bindActionCreators }   from 'redux'

class Whiteboard extends React.Component {

  componentDidMount(){
    this.props.fetch()
  }

  render() {
    const ids = this.props.whiteboard.ids
    return (
      <div>
      <ul>
        {(() => {
          if(ids.length > 0){
            return ids.map(id => <li key={id}>{id}</li>)
          }
        })()}
      </ul>
        <button onClick={e => {
          this.props.fetch()
        }}>
          fetch
        </button>
      </div>
    );
  }
}

const mapStateToProps = state => {
  return {
    whiteboard: state.whiteboard
  }
}

const mapDispatchToProps = dispatch => {
  return {
    fetch: () => dispatch(fetchWhiteboard())
  }
}

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(Whiteboard)
