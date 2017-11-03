import React from 'react';
import ReactDOM from 'react-dom';
import {receiveAllPokemon, requestAllPokemon, receivePokemon,
        requestPokemon} from './actions/pokemon_actions';
import APIUtil from './util/api_util';
import configureStore from './store/store';
import selectAllPokemon from './reducers/selectors';
import Root from './components/root';

document.addEventListener('DOMContentLoaded', () => {
  const store = configureStore();


  //REMOVE THIS, ONLY FOR TESTING
  window.receiveAllPokemon = receiveAllPokemon;
  window.requestAllPokemon = requestAllPokemon;
  window.receivePokemon = receivePokemon;
  window.requestPokemon = requestPokemon;
  window.fetchAllPokemon = APIUtil.fetchAllPokemon;
  window.fetchPokemon = APIUtil.fetchPokemon;
  window.selectAllPokemon = selectAllPokemon;
  window.getState = store.getState;
  window.dispatch = store.dispatch;
  //REMOVE THIS, ONLY FOR TESTING


  const root = document.getElementById('root');
  ReactDOM.render(<Root store={store}/>, root);
});
