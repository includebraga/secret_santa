import React from 'react';

import Layout from 'root/components/Layout';
import Heading from 'root/components/Heading';
import Text from 'root/components/Text';

import './index.css';

const UserCreationError = () => (
  <Layout>
    <div styleName="root">
      <Heading level="2" weight="bold" color="black">
        Oops! Alguém já se registou com este email{' '}
        <span role="img" aria-label="disappointed">
          😞
        </span>
      </Heading>
      <div styleName="text">
        <Text color="black">Lamentamos imenso esta situação!</Text>
        <Text color="black">
          Se achas que isto não é normal por favor contacta-nos via email para{' '}
          <a href="mailto:includebraga@gmail.com">includebraga@gmail.com</a>
        </Text>
      </div>
    </div>
  </Layout>
);

export default UserCreationError;
