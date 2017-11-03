import React from 'react';
import GreetingContainer from './greeting_container';
import SessionFormContainer from './session_form_container';
import {Route} from 'react-router-dom';
import {AuthRoute} from '../util/route_util';
import SearchContainer from './bench/search_container';


const App = () => (
  <div>
    <header>
      <h1>Bench Bnb</h1>
      <GreetingContainer />
    </header>

    <AuthRoute path='/login' component={SessionFormContainer} />
    <AuthRoute path='/signup' component={SessionFormContainer} />
    <Route exact path='/' component={SearchContainer}/>
  </div>
);

export default App;
