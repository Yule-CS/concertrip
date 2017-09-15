import React from 'react'
import PropTypes from 'prop-types'

export default class Index extends React.PureComponent {
  constructor(props) {
    super(props)
    this.state = { value: '' }
    this.handleChange = this.handleChange.bind(this)
    this.handleSubmit = this.handleSubmit.bind(this)
  }
  handleChange(event) {
    this.setState({ value: event.target.value })
  }
  handleSubmit() {
    this.props.history.push(`/rooms/${this.state.value}`)
  }

  render() {
    return (
      <div>
        <div className="home-Main">
          <div className="home-Main_Form">
            <form onSubmit={this.handleSubmit}>
              <div className="home-Main_Input">
                <label htmlFor="roomName">
                  concertrip.com/
                  <input
                    id="roomName"
                    type="text"
                    placeholder="bad man will go to pataya"
                    value={this.state.value}
                    onChange={this.handleChange}
                  />
                </label>
              </div>
            </form>
            <button className="home-Main_Button" onClick={this.handleSubmit}>Create Room</button>
          </div>
        </div>
        <div>
          <ul className="home-Info">
            <li className="home-Info_Desc">
              <section>
                <h1>description</h1><br />
                <p>this is a test</p><br />
                <h2>usage</h2><br />
                <p>this is a loooooooooooooog sentence</p><br />
                <p>description</p><br />
                <p>for what</p><br />
                <p>What can you do</p><br />
              </section>
            </li>
            <li className="home-Info_Example">
              <section>
                <h1>title</h1>
                <p>halong bay</p>
                <h2>usage</h2>
                <p>you can use like this</p>
              </section>
              <img src="/images/halong_thumb.jpg" alt="halong bey" />
            </li>
          </ul>
        </div>
      </div>
    )
  }
}

Index.propTypes = {
  history: PropTypes.shape().isRequired,
}
