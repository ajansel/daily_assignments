import React from 'react';
import {Provider} from 'react-redux';
import PokemonIndexContainer from './pokemon/pokemon_index_container';
import { HashRouter, Route} from 'react-router-dom';
import PokemonDetailContainer from './pokemon_detail/pokemon_detail_container';

const Root = ({store}) => (
    <Provider store = {store}>
      <HashRouter>
        <div>
          <h1>Pokedex</h1>
          <Route path="/" component={PokemonIndexContainer} />
          <Route path="/pokemon/:pokemonId" component={PokemonDetailContainer} />
        </div>
      </HashRouter>
    </Provider>
);

export default Root;
