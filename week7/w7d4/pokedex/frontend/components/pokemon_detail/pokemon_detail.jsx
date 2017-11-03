import React from 'react';
// import PokemonDetailItem from './pokemon_detail_item';

class PokemonDetail extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.requestPokemon(this.props.match.params.pokemonId);
  }

  componentWillReceiveProps(newProps) {
    if (this.props.match.params.pokemonId !== newProps.match.params.pokemonId) {
      this.props.requestPokemon(newProps.match.params.pokemonId);
    }
  }

  render() {
    console.log('detail', this.props);
    if(this.props.pokemon === undefined) return <div >loading</div>;

    return (
      <ul>
        <li>
          {this.props.pokemon.name}
          <img src={this.props.pokemon.image_url} width="300" height="300" />
          <br />
          {this.props.pokemon.type}
          <br />
          {this.props.pokemon.attack}
          <br />
          {this.props.pokemon.defense}
        </li>
      </ul>
    );
  }
}

export default PokemonDetail;
