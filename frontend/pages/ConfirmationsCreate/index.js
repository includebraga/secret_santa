import React from 'react';
import PropTypes from 'prop-types';

import Layout from 'root/components/Layout';
import Heading from 'root/components/Heading';
import Text from 'root/components/Text';

import './index.css';

const renderLetter = letter => (
  <div styleName="letter" dangerouslySetInnerHTML={{ __html: letter }} /> // eslint-disable-line react/no-danger
);

const ConfirmationsCreatePage = ({ username, letter, code }) => (
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
          Em baixo tens a carta da criança que te foi atribuída. Terás uma cópia
          desta carta no teu email se a quiseres voltar a consultar.
        </Text>
        <Text color="black">
          Visita o nosso{' '}
          <a href="https://www.facebook.com/includebraga">Facebook</a> para
          saber onde entregar a prenda! No momento da entrega por favor não te
          esqueças de entregar este código também (coloca uma etiqueta com isto
          se puderes!).
        </Text>
        <Text color="black" weight="bold">{code}</Text>
        <Text color="black">
          Qualquer dúvida podes contactar-nos nas redes sociais ou por email{' '}
          <a href="mailto:includebraga@gmail.com">includebraga@gmail.com</a>!
          para saber onde entregar a prenda! No momento da entrega por favor não
          te esqueças de entregar este código também (coloca uma etiqueta com
          isto se puderes!).
        </Text>
      </div>
      {renderLetter(letter)}
    </div>
  </Layout>
);

ConfirmationsCreatePage.propTypes = {
  username: PropTypes.string.isRequired,
  letter: PropTypes.string.isRequired,
  code: PropTypes.string.isRequired,
};

export default ConfirmationsCreatePage;
