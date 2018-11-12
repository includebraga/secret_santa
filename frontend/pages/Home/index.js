import React from 'react';

import Header from 'root/components/Header';
import SignUp from 'root/components/SignUp';
import Footer from 'root/components/Footer';

import './index.css';

const HomePage = () => (
  <div styleName="root">
    <Header />
    <SignUp />
    <Footer />
  </div>
);

export default HomePage;
