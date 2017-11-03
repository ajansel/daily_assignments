import {RECEIVE_ALL_POKEMON} from '../actions/pokemon_actions';

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

    default:
      return state;
  }
};

export default pokemonReducer;
