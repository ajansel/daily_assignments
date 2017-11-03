import React from 'react';
import { Link } from 'react-router-dom';

class Greeting extends React.Component{
  constructor(props){
    super(props);

    this.currentUser = this.props.currentUser;
    this.logout = this.props.logout;
    this.handleClick = this.handleClick.bind(this);
    this.button = this.button.bind(this);
  }

  handleClick(){
    return (e) => {
      e.preventDefault();
      this.logout();
    };
  }

  greeting(){
    if (this.currentUser){
      return (
        <div>
          <h3>Hello {this.currentUser.username}</h3>
          <button onClick={this.handleClick()}>Logout</button>;
        </div>
      );
    } else {
      return (
        <div>
          <Link to='/signup'>Signup</Link>
          <Link to='/login'>Login</Link>
        </div>
      );
    }
  }

  render(){
    return(
      <div>
        {this.greeting()}
      </div>
    );
  }
}

export default Greeting;
