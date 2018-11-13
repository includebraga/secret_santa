import React from 'react';
import PropTypes from 'prop-types';

import Layout from 'root/components/Layout';
import Heading from 'root/components/Heading';
import Text from 'root/components/Text';

import './index.css';

const UserCreated = ({ username, email }) => (
  <Layout>
    <div styleName="root">
      <Heading level="2" weight="bold" color="black">
        #include &lt;braga&gt;{' '}
        <span role="img" aria-label="love">
          ❤️
        </span>{' '}
        {username}
      </Heading>
      <div styleName="text">
        <Text color="black">Obrigado pelo teu registo!</Text>
        <Text color="black">A tua contribuição significa imenso para nós.</Text>
        <Text color="black">
          Por favor confirma o teu email ao clicar no link que acabamos de
          enviar para {email}
        </Text>
      </div>
    </div>
  </Layout>
);

UserCreated.propTypes = {
  username: PropTypes.string.isRequired,
  email: PropTypes.string.isRequired,
};

export default UserCreated;
