import React from 'react';
import {withRouter, Link, Redirect} from 'react-router-dom';

class SessionForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      username: "",
      password: ""
    };
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleSubmit(e) {
    e.preventDefault();
    const user = Object.assign({}, this.state);
    this.props.processForm(user);
  }

  handleChange(type) {
    return (e) => {
      this.setState({[type]: e.target.value});
    };
  }

  render(){
    if (this.props.loggedIn) return <Redirect to='/' />;
    const header = this.props.formType === 'login' ? "Log In" : "Sign Up";
    const link = this.props.formType === 'login' ?
      <Link to='/signup'>Sign Up</Link> :
      <Link to='/login'>Log In</Link>;
    return(
      <div>
        <form onSubmit={this.handleSubmit}>
          {link}
          <h3>{header}</h3>
          {this.props.errors}
          <br />
          <label>Username:
            <input onChange={this.handleChange('username')} value={this.state.username} />
          </label>
          <br />
          <label>Password:
            <input onChange={this.handleChange('password')} value={this.state.password}></input>
          </label>
          <button>Submit</button>
        </form>
      </div>
    );
  }
}

export default withRouter(SessionForm);
