const APIUtil = {
  fetchAllPokemon: function fetchAllPokemon() {
    return $.ajax({
      method: "GET",
      url: "/api/pokemon"
    });
  },

  fetchPokemon: function fetchPokemon(pokeId) {
    return $.ajax({
      method: 'GET',
      url: `api/pokemon/${pokeId}`
    });
  }
};

export default APIUtil;
