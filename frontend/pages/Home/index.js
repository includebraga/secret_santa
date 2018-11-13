import React from 'react';

import Header from 'root/components/Header';
import Adventure from 'root/components/Adventure';
import Plan from 'root/components/Plan';
import SignUp from 'root/components/SignUp';
import Footer from 'root/components/Footer';

import './index.css';

const HomePage = () => (
  <div styleName="root">
    <Header />
    <Adventure />
    <Plan />
    <SignUp />
    <Footer />
  </div>
);

export default HomePage;
