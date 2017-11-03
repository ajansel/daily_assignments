import { connect } from 'react-redux';
import { selectPokemon } from '../../reducers/selectors';
import PokemonDetail from './pokemon_detail';
import {requestPokemon} from '../../actions/pokemon_actions';
import { withRouter} from 'react-router-dom';

const mapStateToProps = (state, ownProps) => ({
  pokemon: selectPokemon(state, state.ui.pokeDisplay)
});

const mapDispatchToProps = dispatch => ({
  requestPokemon: (pokeId) => dispatch(requestPokemon(pokeId))
});

export default withRouter(connect(
  mapStateToProps, mapDispatchToProps
)(PokemonDetail));
