import React from 'react';
import GreetingContainer from './greeting/greeting_container';
import LoginFormContainer from './form_container/login_form_container'
import SignUpFormContainer from './form_container/sign_up_form_container'
import {Route} from 'react-router-dom'
import { AuthRoute } from '../util/route_util';

const App = () => (
   <div>
      <header> 
         <h1>Bench BnB</h1>
         <GreetingContainer/>
      </header>
      <AuthRoute path='/login' component={LoginFormContainer}/>
      <AuthRoute path='/signup' component={SignUpFormContainer}/>
   </div>
);

export default App;