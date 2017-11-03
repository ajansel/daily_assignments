import React from 'react';
import { Link } from 'react-router-dom';

const PokemonIndexItem = ({ poke }) => (
  <li key={poke.id}>
    <Link to={`/pokemon/${poke.id}`}>
      {poke.name}
      <img src={poke.image_url} width="50" height="50" />
    </Link>
  </li>
);

export default PokemonIndexItem;
