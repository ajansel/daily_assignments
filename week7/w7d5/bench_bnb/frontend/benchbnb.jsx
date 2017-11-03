import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';

// DELETE THIS LATER
// import {postUser, postSession, deleteSession} from './util/session_api_util';
// import {signup, login, logout} from './actions/session_actions';
// DELETE THIS LATER

document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('root');
  const store = configureStore();

  // DELETE THIS LATER
  // window.postUser = postUser;
  // window.postSession = postSession;
  // window.deleteSession = deleteSession;
  // window.getState = store.getState;
  // window.dispatch = store.dispatch;
  // window.signup = signup;
  // window.login = login;
  // window.logout = logout;
  // DELETE THIS LATER

  ReactDOM.render(<Root store={store}/>, root);
});
