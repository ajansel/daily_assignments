import {RECEIVE_ALL_POKEMON, RECEIVE_POKEMON} from '../actions/pokemon_actions';
import merge from 'lodash/merge';

const pokemonReducer = (state = {}, action) => {
  // const newState = {};
  Object.freeze(state);
  switch(action.type) {
    case RECEIVE_ALL_POKEMON:
      // Object.assign(newState, state);
      // action.pokemon.forEach((poke) => {
      //   // let poke = Object.values(obj)[0];
      //   newState[poke.id] = poke;
      // });
      return action.pokemon;

    case RECEIVE_POKEMON:
    // console.log(state);
    // console.log(action.poke);
    console.log('action', action);
    let newState = merge({}, state);
    newState[action.poke.pokemon.id] = action.poke.pokemon;
    return newState;

    default:
      return state;
  }
};

export default pokemonReducer;
