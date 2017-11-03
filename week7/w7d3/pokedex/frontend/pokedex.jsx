import React from 'react';
import ReactDOM from 'react-dom';
import {receiveAllPokemon, requestAllPokemon} from './actions/pokemon_actions';
import APIUtil from './util/api_util';
import configureStore from './store/store';
import selectAllPokemon from './reducers/selectors';


document.addEventListener('DOMContentLoaded', () => {
  const store = configureStore();


  //REMOVE THIS, ONLY FOR TESTING
  window.receiveAllPokemon = receiveAllPokemon;
  window.requestAllPokemon = requestAllPokemon;
  window.fetchAllPokemon = APIUtil.fetchAllPokemon;
  window.selectAllPokemon = selectAllPokemon;
  window.getState = store.getState;
  window.dispatch = store.dispatch;
  //REMOVE THIS, ONLY FOR TESTING


  const root = document.getElementById('root');
  ReactDOM.render(<h1>Pokedex</h1>, root);
});
