import React from 'react'
import { NavLink } from 'react-router-dom'

export default class Nav extends React.PureComponent {
  render() {
    return (
      <header>
        <nav className="tp-Nav">
          <div className="tp-Nav_Left"></div>
          <div className="tp-Nav_Center">
            <NavLink to="/">
              <p> concertrip </p>
            </NavLink>
          </div>
          <div className="tp-Nav_Right">
            <ul>
              <li>
                <NavLink to="/about">
                  <p> about </p>
                </NavLink>
              </li>
              <li>
                <NavLink to="/FAQ">
                  <p> FAQ </p>
                </NavLink>
              </li>
              <li>
                <NavLink to="/contact">
                  <p> contact </p>
                </NavLink>
              </li>
              <li>
                <NavLink to="/login">
                  <p> login </p>
                </NavLink>
              </li>
            </ul>
          </div>
        </nav>
      </header>
    )
  }
}
