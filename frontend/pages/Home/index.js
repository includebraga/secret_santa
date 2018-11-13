import React from 'react';
import PropTypes from 'prop-types';

import Header from 'root/components/Header';
import Adventure from 'root/components/Adventure';
import Plan from 'root/components/Plan';
import SignUp from 'root/components/SignUp';
import SignUpClosed from 'root/components/SignUpClosed';
import Footer from 'root/components/Footer';

import './index.css';

const HomePage = ({ registrationsEnabled }) => (
  <div styleName="root">
    <Header />
    <Adventure />
    <Plan />
    {registrationsEnabled ? <SignUp /> : <SignUpClosed />}
    <Footer />
  </div>
);

HomePage.propTypes = {
  registrationsEnabled: PropTypes.bool.isRequired
}

export default HomePage;
