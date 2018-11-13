import React from 'react';
import PropTypes from 'prop-types';

import Layout from 'root/components/Layout';
import Heading from 'root/components/Heading';
import Text from 'root/components/Text';

import './index.css';

const renderLetter = letter => (
  <div styleName="letter" dangerouslySetInnerHTML={{ __html: letter }} /> // eslint-disable-line react/no-danger
);

const ConfirmationsCreatePage = ({ username, letter }) => (
  <Layout>
    <div styleName="root">
      {' '}
      <Heading level="2" weight="bold" color="black">
        Secret Santa confirmado!
      </Heading>
      <div styleName="text">
        <Text color="black">
          {username}, acabaste de te tornar num Secret Santa!
        </Text>
        <Text color="black">
          Em baixo tens a carta da criança que te foi atribuída.
        </Text>
        <Text color="black">
          Fica atento às redes sociais para saberes como entregar a prenda num dos nossos pontos de recolha! Até breve {' '}
          <span role="img" aria-label="santa">
            🎅
          </span>
        </Text>
      </div>
      {renderLetter(letter)}
    </div>
  </Layout>
);

ConfirmationsCreatePage.propTypes = {
  username: PropTypes.string.isRequired,
  letter: PropTypes.string.isRequired,
};

export default ConfirmationsCreatePage;
