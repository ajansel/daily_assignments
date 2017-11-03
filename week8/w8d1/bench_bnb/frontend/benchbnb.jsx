import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';

// DELETE THIS LATER
// import {postUser, postSession, deleteSession} from './util/session_api_util';
import {signup, login, logout} from './actions/session_actions';
import {getBenches, postBench} from './util/bench_api_util';
import {fetchBenches} from './actions/bench_actions';
// DELETE THIS LATER

document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('root');
  const preloadedState = {};
  if (window.currentUser){
    preloadedState.session = {currentUser: window.currentUser };
    delete window.currentUser;
  }
  const store = configureStore(preloadedState);

  // DELETE THIS LATER
  // window.postUser = postUser;
  // window.postSession = postSession;
  // window.deleteSession = deleteSession;
  window.getState = store.getState;
  window.dispatch = store.dispatch;
  window.signup = signup;
  window.login = login;
  window.logout = logout;
  window.getBenches = getBenches;
  window.postBench = postBench;
  window.fetchBenches = fetchBenches;
  // DELETE THIS LATER

  ReactDOM.render(<Root store={store}/>, root);
});
