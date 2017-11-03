const APIUtil = {
  fetchAllPokemon: function fetchAllPokemon() {
    return $.ajax({
      method: "GET",
      url: "/api/pokemon"
    });
  }
};

export default APIUtil;
