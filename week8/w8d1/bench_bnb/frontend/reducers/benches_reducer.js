import {RECEIVE_BENCHES} from '../actions/bench_actions';

const _nullBenches = {
  benches: {}
};

const BenchesReducer = (state = _nullBenches, action) => {
  Object.freeze(state);
  switch(action.type){
    case RECEIVE_BENCHES:
      return action.benches;
    default:
      return state;
  }
};

export default BenchesReducer;
