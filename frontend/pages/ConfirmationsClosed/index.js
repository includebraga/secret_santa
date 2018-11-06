import React from 'react';

import Layout from 'root/components/Layout';
import Heading from 'root/components/Heading';
import Text from 'root/components/Text';

import './index.css';

const ConfirmationsClosedPage = () => (
  <Layout>
    <div styleName="root">
      <Heading level="2" weight="bold" color="black">
        Inscrições fechadas!
      </Heading>
      <div styleName="text">
        <Text color="black">Lamentamos imenso esta situação!</Text>
        <Text color="black">
          Infelizmente já temos registos suficientes para as crianças e idosos
          que reunimos de momento.
        </Text>
        <Text color="black">
          Mesmo assim, não desanimes! Ainda há a possibilidade de te registares
          outra vez ainda este Natal, fica atento!
        </Text>
        <Text color="black">
          Fica atento às redes sociais e vemo-nos em breve{' '}
          <span role="img" aria-label="santa">
            🎅
          </span>
        </Text>
      </div>
    </div>
  </Layout>
);

export default ConfirmationsClosedPage;
