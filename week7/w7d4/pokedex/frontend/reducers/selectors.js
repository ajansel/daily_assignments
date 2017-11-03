import Lodash from 'lodash';

export const selectAllPokemon = (state) => (
  Object.values(state.entities.pokemon)
);

export const selectPokemon = (state, pokeId) => (
  state.entities.pokemon[pokeId]
);
