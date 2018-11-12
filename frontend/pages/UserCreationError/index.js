import React from 'react';

import Layout from 'root/components/Layout';
import Heading from 'root/components/Heading';
import Text from 'root/components/Text';

import './index.css';

const UserCreationError = () => (
  <Layout>
    <div styleName="root">
      <Heading level="2" weight="bold" color="black">
        Oops! Algo de errado aconteceu{' '}
        <span role="img" aria-label="disappointed">
          😞
        </span>
      </Heading>
      <div styleName="text">
        <Text color="black">Lamentamos imenso esta situação!</Text>
        <Text color="black">
          Não te preocupes, estamos a par da ocorrência.
        </Text>
        <Text color="black">
          Tenta registar-te mais
          tarde e se o problema persistir fala connosco através do nosso email{' '}
          <a href="mailto:includebraga@gmail.com">includebraga@gmail.com</a>
        </Text>
      </div>
    </div>
  </Layout>
);

export default UserCreationError;
