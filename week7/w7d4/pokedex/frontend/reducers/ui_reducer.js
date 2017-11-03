import {RECEIVE_POKEMON} from '../actions/pokemon_actions';
import merge from 'lodash/merge';

const uiReducer = (state = {}, action) => {
  Object.freeze(state);
  switch(action.type) {
    case RECEIVE_POKEMON:
      let newState = {};
      newState["pokeDisplay"] = action.poke.pokemon.id;
    return newState;

    default:
      return state;
  }
};

export default uiReducer;
